#!/bin/bash -e
git clone --recursive https://github.com/solidusio/solidus repo

cp repo/core/db /dsl_rails_placeholder/ -R
cd /dsl_rails_placeholder

cat <<EOT >> Gemfile
gem 'spree', '~> 4.7' # core and API
gem 'spree_backend', '~> 4.7' # Admin panel (optional)
gem 'spree_frontend', '~> 4.7' # Storefront (optional)
gem 'spree_emails', '~> 4.7' # transactional emails (optional)
gem 'spree_sample', '~> 4.7' # dummy data like products, taxons, etc (optional)
gem 'spree_auth_devise', '~> 4.6' # Devise integration (optional)
gem 'spree_gateway', '~> 3.11' # payment gateways eg. Stripe, Braintree (optional)
EOT

cat <<EOT > db/migrate/20190106184413_remove_code_from_spree_promotions.rb
# frozen_string_literal: true

class RemoveCodeFromSpreePromotions < ActiveRecord::Migration[5.1]
  def up
    remove_index :spree_promotions, name: :index_spree_promotions_on_code
    remove_column :spree_promotions, :code
  end

  def down
    add_column :spree_promotions, :code, :string
    add_index :spree_promotions, :code, name: :index_spree_promotions_on_code
  end

  def self.promotions_with_code_handler
    Solidus::Migrations::PromotionWithCodeHandlers::RaiseException
  end
end
EOT

cat <<EOT > db/migrate/20231027084517_add_order_promotions_foreign_key.rb
class AddOrderPromotionsForeignKey < ActiveRecord::Migration[7.0]
  def up
    add_foreign_key :spree_orders_promotions, :spree_orders, column: :order_id, validate: false, on_delete: :cascade
  end

  def down
    remove_foreign_key :spree_orders_promotions, :spree_orders
  end
end
EOT

cat <<EOT > db/migrate/20231031175215_add_promotion_order_promotion_foreign_key.rb
class AddPromotionOrderPromotionForeignKey < ActiveRecord::Migration[7.0]
  def up
    add_foreign_key :spree_orders_promotions, :spree_promotions, column: :promotion_id, on_delete: :cascade
  end

  def down
    remove_foreign_key :spree_orders_promotions, :spree_promotions
  end
end
EOT

bundle install

if test -f "db/schema.rb"; then
  rails db:schema:load
else
	rails db:migrate
fi
