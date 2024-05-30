#!/bin/bash -e
git clone --recursive https://github.com/theforeman/foreman repo
cd repo && git pull && cd ..

cp repo/db /dsl_rails_placeholder/ -R
cd /dsl_rails_placeholder

cat <<EOT > db/migrate/20140325093623_add_lowerlogin_to_users.rb
class AddLowerloginToUsers < ActiveRecord::Migration[4.2]
  def up
    add_column :users, :lower_login, :string, :limit => 255
    add_index  :users, :lower_login, :unique => true
  end

  def down
    remove_index  :users, :lower_login
    remove_column :users, :lower_login
  end
end
EOT

cat <<EOT > db/migrate/20140630114339_add_boot_mode_to_subnet.rb
class AddBootModeToSubnet < ActiveRecord::Migration[4.2]
  def up
    add_column :subnets, :boot_mode, :string, :default => 'Static', :null => false, :limit => 255
  end

  def down
    remove_column :subnets, :boot_mode
  end
end
EOT

cat <<EOT > db/migrate/20140902102858_convert_ipam_to_string.rb
class ConvertIpamToString < ActiveRecord::Migration[4.2]
  def up
    change_column :subnets, :ipam, :string, :default => 'DHCP', :null => false, :limit => 255
  end

  def down
    change_column :subnets, :ipam, :boolean, :default => true, :null => false
  end
end
EOT

cat <<EOT > db/migrate/20140910111148_add_bond_attributes_to_nic_base.rb
class AddBondAttributesToNicBase < ActiveRecord::Migration[4.2]
  def up
    add_column :nics, :mode, :string, :null => false, :default => 'First', :limit => 255
    add_column :nics, :attached_devices, :string, :default => '', :null => false, :limit => 255
    add_column :nics, :bond_options, :string, :default => '', :null => false, :limit => 255
    rename_column :nics, :physical_device, :attached_to
  end

  def down
    rename_column :nics, :attached_to, :physical_device
    remove_column :nics, :bond_options
    remove_column :nics, :attached_devices
    remove_column :nics, :mode
  end
end
EOT

cat <<EOT > db/migrate/20150225131946_change_default_subnet_boot_mode.rb
class ChangeDefaultSubnetBootMode < ActiveRecord::Migration[4.2]
  def up
    change_column :subnets, :boot_mode, :string, :default => 'DHCP'
  end

  def down
    change_column :subnets, :boot_mode, :string, :default => 'Static'
  end
end
EOT

rm -f db/migrate/20200127103144_ssh_keys_fingerprints_sha1.rb
rm -f db/migrate/20200205105956_drop_parameterized_classes_setting.rb
rm -f db/migrate/20200311131527_drop_smart_variable_permissions.rb
rm -f db/migrate/20200318135632_rename_report_templates.rb
rm -f db/migrate/20200324210540_rename_default_variable_lookup_path.rb
rm -f db/migrate/20200326164755_change_oidc_audience_setting_type.rb
rm -f db/migrate/20200406113832_drop_variable_lookup_key.rb
rm -f db/migrate/20200427151946_drop_rackspace_cr.rb
rm -f db/migrate/20200513092446_change_config_chart_class.rb
rm -f db/migrate/20200521082853_rename_cent_os7_install_media.rb
rm -f db/migrate/20200602155700_drop_puppet_run.rb

cat <<EOT > db/migrate/20150225131946_change_default_subnet_boot_mode.rb
class ChangeDefaultSubnetBootMode < ActiveRecord::Migration[4.2]
  def up
    change_column :subnets, :boot_mode, :string, :default => 'DHCP'
  end

  def down
    change_column :subnets, :boot_mode, :string, :default => 'Static'
  end
end
EOT

cat <<EOT > db/migrate/20200615071719_add_bmc_to_subnet.rb
class AddBmcToSubnet < ActiveRecord::Migration[6.0]
  def change
    add_column :subnets, :bmc_id, :integer
  end
end
EOT

rm -f db/migrate/20200616134403_remove_setting_enable_orchestration.rb

cat <<EOT > db/migrate/20200625081552_add_unique_index_to_lookup_value.rb
class AddUniqueIndexToLookupValue < ActiveRecord::Migration[6.0]
  def up
    add_index :lookup_values, [:lookup_key_id, :match], unique: true
  end

  def down
    remove_index :lookup_values, column: [:lookup_key_id, :match], unique: true
  end
end
EOT

rm -f db/migrate/20200709160133_set_empty_filter_taxonomy_search_nil.rb
rm -f db/migrate/20200825121733_drop_compare_content_host_template.rb
rm -f db/migrate/20200908120905_rebuild_taxonomy_search.rb
rm -f db/migrate/20200918223816_update_login_delegation_description.rb

cat <<EOT > db/migrate/20201030102020_enlarge_report_status.rb
class EnlargeReportStatus < ActiveRecord::Migration[6.0]
  def up
    remove_index :reports, :status
  end

  def down
    add_index :reports, :status
  end
end
EOT

cat <<EOT > db/migrate/20210525144427_enforce_unique_templates.rb
class EnforceUniqueTemplates < ActiveRecord::Migration[6.0]
  def up
    add_index :templates, [:type, :name], unique: true
  end

  def down
    remove_index :templates, [:type, :name]
  end
end
EOT

cat <<EOT > db/migrate/20220124174632_drop_setting_fields.rb
class DropSettingFields < ActiveRecord::Migration[6.0]
  def up
    remove_column :settings, :description
    remove_column :settings, :settings_type
    remove_column :settings, :default
    remove_column :settings, :full_name
    remove_column :settings, :encrypted
  end

  def down
    add_column :settings, :description, :text
    add_column :settings, :settings_type, :string, :limit => 255
    add_column :settings, :default, :text
    add_column :settings, :full_name, :string, :limit => 255
    add_column :settings, :encrypted, :boolean, :null => false, :default => false
  end
end
EOT

rm -f db/migrate/20201224095619_remove_ovirt_use_api_from_attr.rb
rm -f db/migrate/20210114143800_nilify_empty_proxy_credentials.rb
rm -f db/migrate/20210115124508_template_kind_registration.rb
rm -f db/migrate/20210317170111_remove_the_remote_add_setting.rb
rm -f db/migrate/20210401124332_drop_db_pending_migration_setting.rb
rm -f db/migrate/20210502113529_drop_view_bookmarks_permission.rb
rm -f db/migrate/20210609093404_drop_override_taxonomies_from_filter.rb
rm -f db/migrate/20210610131920_restrict_sendmail_location.rb
rm -f db/migrate/20210901081438_drop_view_tasks_permission.rb
rm -f db/migrate/20210915132645_general_setting_to_dsl.rb
rm -f db/migrate/20210929132645_core_setting_to_dsl.rb
rm -f db/migrate/20211111115000_drop_fix_db_cache_setting.rb
rm -f db/migrate/20220111110149_drop_require_ssl_smart_proxies_setting.rb
rm -f db/migrate/20220204155632_rename_job_report_template.rb
rm -f db/migrate/20220208134539_rename_cent_os_stream_os.rb
rm -f db/migrate/20220630104300_fix_facet_audits.rb
rm -f db/migrate/20220907145552_clean_trends_and_foreman_docker_data.rb
rm -f db/migrate/20221017161042_remove_host_power_status_from_settings.rb
rm -f db/migrate/20230414091257_rename_append_domain_setting.rb
rm -f db/migrate/20230418075940_assign_fqdn_to_host_name.rb
rm -f db/migrate/20230719080900_fix_ubuntu_versions.rb
rm -f db/migrate/20230803180552_rename_applicable_errata_report_template.rb
rm -f db/migrate/20230920093000_move_ct_command_into_own_setting.rb
rm -f db/migrate/20231016000000_introduce_host_products_report.rb
rm -f db/migrate/20240215150131_remove_subscription_entitlements_report.rb

cat <<EOT > db/migrate/20240305131306_enforce_not_null_host_comment.rb
class EnforceNotNullHostComment < ActiveRecord::Migration[6.1]
  def up
    change_column_default :hosts, :comment, ''
    change_column_null :hosts, :comment, false
  end
end
EOT

if test -f "db/schema.rb"; then
  rails db:schema:load
else
	rails db:migrate
fi
