def ruby_on_rails_lessons
  {
    'How This Course Will Work' => {
      title: 'How This Course Will Work',
      description: "Let's get acquainted with what this will look like from here on out.",
      is_project: false,
      github_path: '/ruby_on_rails/introduction/how_this_course_will_work.md',
      identifier_uuid: '5e9d7694-e930-4090-ba4e-1ae3b19d513e',
    },
    'Installing Rails' => {
      title: 'Installing Rails',
      description: 'Get setup for this course by installing Rails.',
      is_project: true,
      github_path: '/ruby_on_rails/introduction/project_installing_rails.md',
      accepts_submission: false,
      previewable: false,
      identifier_uuid: '9dbd5caa-a77d-4731-8897-542aae2984e3',
      installation_lesson: true,
    },
    'A Railsy Web Refresher' => {
      title: 'A Railsy Web Refresher',
      description: "We're not just using the Web, we're living it.  This lesson will get you up to speed on how.",
      is_project: false,
      github_path: '/ruby_on_rails/introduction/web_refresher.md',
      identifier_uuid: '03151914-6ea0-4bbf-aafe-0ace33855bf6',
    },
    'Routing' => {
      title: 'Routing',
      description: "The router is the switchboard of your app, telling requests which controller action they're supposed to run. ",
      is_project: false,
      github_path: '/ruby_on_rails/rails_basics/routing.md',
      identifier_uuid: '50707650-7135-46b8-b42f-feda9ba46213',
    },
    'Controllers' => {
      title: 'Controllers',
      description: 'Controllers are the middle managers of the whole process -- they tell everyone else what to do and take all the credit.',
      is_project: false,
      github_path: '/ruby_on_rails/rails_basics/controllers.md',
      identifier_uuid: 'b4ecc31f-325f-4b31-b1c9-efa2ccc467bf',
    },
    'Views' => {
      title: 'Views',
      description: "When the controller has figured out which data needs to be displayed, it's the View's job to turn that into some half-decent HTML.",
      is_project: false,
      github_path: '/ruby_on_rails/rails_basics/views.md',
      identifier_uuid: 'c0299335-f370-4e80-9286-7fd2d6b8e351',
    },
    'Deployment' => {
      title: 'Deployment',
      description: "There's nothing quite like seeing your application on a real website. We'll show you how it's done.",
      is_project: false,
      github_path: '/ruby_on_rails/rails_basics/deployment.md',
      identifier_uuid: '122dffc9-d98e-490e-8e58-e5f7c66909d4',
    },
    'Blog App' => {
      title: 'Blog App',
      description: "You've learned the basics, now let's put them to work by building a basic blogging app.",
      is_project: true,
      github_path: '/ruby_on_rails/rails_basics/project_blog_app.md',
      accepts_submission: true,
      previewable: true,
      identifier_uuid: '00167c46-3d50-410f-947a-729571744920'
    },
    'Active Record Basics' => {
      title: 'Active Record Basics',
      description: 'Active Record is the crown jewel of Rails because it turns all the bare metal database queries (like SQL) into nice clean Ruby methods.',
      is_project: false,
      github_path: '/ruby_on_rails/active_record_basics/active_record_basics.md',
      identifier_uuid: '260d1def-c36c-4512-b8aa-223458f356b0',
    },
    'Micro-Reddit' => {
      title: 'Micro-Reddit',
      description: "You'll start getting practice thinking data first before building something that acts a lot like Reddit.",
      is_project: true,
      github_path: '/ruby_on_rails/active_record_basics/project_micro_reddit.md',
      accepts_submission: true,
      previewable: false,
      identifier_uuid: 'f46373db-e4e2-4aec-866e-b0123fc7928e',
    },
    'The Asset Pipeline' => {
      title: 'The Asset Pipeline',
      description: 'This lesson explains how Rails handles all the behind-the-scenes stuff to get your CSS, Image files and other assets served quickly and efficiently and how you can use that process.',
      is_project: false,
      github_path: '/ruby_on_rails/assets_and_navigation/asset_pipeline.md',
      identifier_uuid: '13a13e03-9a3c-4ffc-88cb-25b03a4f5b66',
    },
    'Importmaps' => {
      title: 'Importmaps',
      description: 'This lesson explains the default Rails way of handling third party Javascript libraries in your application.',
      is_project: false,
      github_path: '/ruby_on_rails/assets_and_navigation/importmap.md',
      identifier_uuid: '7520e06d-0b98-4be5-ae4a-9a38c93af4d9',
    },
    'Turbo Drive' => {
      title: 'Turbo Drive',
      description: 'This lesson explains how Turbo intercepts links and form submissions to speed up your app.',
      is_project: false,
      github_path: '/ruby_on_rails/assets_and_navigation/turbo_drive.md',
      identifier_uuid: 'd283a0bb-a35f-43ed-95d8-943dcb750443',
    },
    'Form Basics' => {
      title: 'Form Basics',
      description: 'Half refresher, half expanding your mind, this will bridge the gap between the lowly web form and your server side logic.',
      is_project: false,
      github_path: '/ruby_on_rails/forms_and_authentication/form_basics.md',
      identifier_uuid: 'f115f7e4-7ddd-49b2-96d8-2403f172704e',
    },
    'Forms' => {
      title: 'Forms',
      description: "To understand the form, you must start from the beginning.  We'll start with HTML and then learn how Rails can really help you out.",
      is_project: true,
      github_path: '/ruby_on_rails/forms_and_authentication/project_forms.md',
      accepts_submission: true,
      previewable: false,
      identifier_uuid: '3f3fa50c-9223-4178-b86a-6b50caf30896',
    },
    'Sessions, Cookies and Authentication' => {
      title: 'Sessions Cookies and Authentication',
      description: "Learn how to store data in the user's browser and how that is used to sign in the user and keep them signed in across requests.",
      is_project: false,
      github_path: '/ruby_on_rails/forms_and_authentication/sessions_cookies_authentication.md',
      identifier_uuid: '95e85ce2-008a-4e1b-a553-664029025cf5',
    },
    'Members Only!' => {
      title: 'Members Only!',
      description: "You'll build a closed community for sharing embarrassing gossip with the world.",
      is_project: true,
      github_path: '/ruby_on_rails/forms_and_authentication/project_members_only.md',
      accepts_submission: true,
      previewable: true,
      identifier_uuid: '038fc7b2-11df-4d95-9cc9-f6006e51ec2d',
    },
    'Active Record Queries' => {
      title: 'Active Record Queries',
      description: 'Learn how to take some of those advanced querying concepts you used in SQL and have Rails do them for you mathemagically.',
      is_project: false,
      github_path: '/ruby_on_rails/advanced_forms_and_activerecord/active_record_queries.md',
      identifier_uuid: '61880f45-b070-4100-ad9a-ba3ff61c1e1c',
    },
    'Active Record Associations' => {
      title: 'Active Record Associations',
      description: 'Dive into some of the more interesting features of associations like special methods and polymorphism.',
      is_project: false,
      github_path: '/ruby_on_rails/advanced_forms_and_activerecord/active_record_associations.md',
      identifier_uuid: '211edb41-e48f-4da1-bec2-0271e900f266',
    },
    'Private Events' => {
      title: 'Private Events',
      description: "Build a system to manage sign-ups for you and your friends' special events.",
      is_project: true,
      github_path: '/ruby_on_rails/advanced_forms_and_activerecord/project_private_events.md',
      accepts_submission: true,
      previewable: true,
      identifier_uuid: '54233186-d525-4647-a001-91049353ecec',
    },
    'Active Record Callbacks' => {
      title: 'Active Record Callbacks',
      description: 'A brief look at the life-cycle of an Active Record object, from birth to destruction, and how you can hook into that for profit.',
      is_project: false,
      github_path: '/ruby_on_rails/advanced_forms_and_activerecord/active_record_callbacks.md',
      identifier_uuid: 'e40f2187-e598-4c7b-b419-4be9606e2f8b',
    },
    'Advanced Forms' => {
      title: 'Advanced Forms',
      description: "Take what you know about forms and put rocket boosters on it.  Don't be afraid to make a form for anything.",
      is_project: false,
      github_path: '/ruby_on_rails/advanced_forms_and_activerecord/forms_advanced.md',
      identifier_uuid: 'a47db11b-de26-4e38-bd24-edb640319ca2',
    },
    'Flight Booker' => {
      title: 'Flight Booker',
      description: 'Build an airline flight sign-up system, which is a nest of interesting complexities',
      is_project: true,
      github_path: '/ruby_on_rails/advanced_forms_and_activerecord/project_flight_booker.md',
      accepts_submission: true,
      previewable: true,
      identifier_uuid: '52cb7814-24f0-450a-9bf2-39cde4a680da',
    },
    'APIs and Building Your Own' => {
      title: 'APIs and Building Your Own',
      description: 'Rails is really just an API itself... learn about APIs and how to turn your app into one',
      is_project: false,
      github_path: '/ruby_on_rails/apis/apis_and_building_your_own.md',
      identifier_uuid: 'd3fcb7b6-ba98-4c81-87cc-7eae3f17c990',
    },
    'Working with External APIs' => {
      title: 'Working with External APIs',
      description: "Lots of the power of APIs comes from interfacing with third-party applications, which we'll cover in this lesson.",
      is_project: false,
      github_path: '/ruby_on_rails/apis/working_with_external_apis.md',
      identifier_uuid: '81082701-d9ab-4bd4-8948-4ad4b3d10a6e',
    },
    'Kittens API' => {
      title: 'Kittens API',
      description: "In this project, you'll both build your own API",
      is_project: true,
      github_path: '/ruby_on_rails/apis/project_kittens_api.md',
      accepts_submission: true,
      previewable: true,
      identifier_uuid: '5d0433d7-f3f3-46fa-99e7-3bc5893a2599'
    },
    'Flickr API' => {
      title: 'Flickr API',
      description: "In this project, you'll work with a third-party API.",
      is_project: true,
      github_path: '/ruby_on_rails/apis/project_flickr_api.md',
      accepts_submission: true,
      previewable: true,
      identifier_uuid: '2adcd199-34b4-47e0-875c-0df9ecd61ea9',
    },
    'CSS Bundling' => {
      title: 'CSS Bundling',
      description: "If the standard Rails way of handling CSS is no longer suitable, you'll need another CSS Bundling option. We cover this here.",
      is_project: false,
      github_path: '/ruby_on_rails/rails_sprinkles/css_bundling.md',
      identifier_uuid: '383a783c-99e7-4172-a9bd-e33cd52f80a8',
    },
    'JS Bundling' => {
      title: 'JS Bundling',
      description: "Importmaps can only take you so far. Eventually you'll need something a little more powerful.",
      is_project: false,
      github_path: '/ruby_on_rails/rails_sprinkles/js_bundling.md',
      identifier_uuid: '175530d0-6189-4b52-93d7-3df48fb10ba6',
    },
    'Turbo' => {
      title: 'Turbo',
      description: 'An incredibly powerful tool for bringing pages to life without full page reloads. Turbo is the Rails way of SPA-like functionality.',
      is_project: false,
      github_path: '/ruby_on_rails/rails_sprinkles/turbo.md',
      identifier_uuid: '76a38dbf-9f39-40af-8d55-59b4f4fb58de',
    },
    'Stimulus' => {
      title: 'Stimulus',
      description: 'If you want an easy to use, Rails-like way of sprinkling some Javascript code into your application then look no further than StimulusJS.',
      is_project: false,
      github_path: '/ruby_on_rails/rails_sprinkles/stimulus_js.md',
      identifier_uuid: 'a6f18c3c-c1dc-4301-9655-68341a78bdf9',
    },
    'Mailers' => {
      title: 'Mailers',
      description: "You don't often think about where your email comes from.  Here you'll learn how to send it from your app.",
      is_project: false,
      github_path: '/ruby_on_rails/mailers_advanced_topics/mailers.md',
      identifier_uuid: 'e8bf71ba-1740-4c98-a963-50e83d7af59d',
    },
    'Sending Confirmation Emails' => {
      title: 'Sending Confirmation Emails',
      description: "Add email functionality to an existing project.  Just don't SPAM, it's frowned upon.",
      is_project: true,
      github_path: '/ruby_on_rails/mailers_advanced_topics/project_sending_confirmation_emails.md',
      accepts_submission: true,
      previewable: true,
      identifier_uuid: 'bd6d78b4-cefd-4938-8818-5adfe5620c2b'
    },
    'Advanced Topics' => {
      title: 'Advanced Topics',
      description: 'A mash-up of orphan topics like advanced routing, layouts, metaprogramming and design patterns.',
      is_project: false,
      github_path: '/ruby_on_rails/mailers_advanced_topics/advanced_topics.md',
      identifier_uuid: 'a4f06a72-0298-4165-b06c-1b0e837fe956',
    },
    'Websockets and Actioncable' => {
      title: 'Websockets and Actioncable',
      description: 'A delve into the basics of websockets and how Actioncable brings them to Rails.',
      is_project: false,
      github_path: '/ruby_on_rails/mailers_advanced_topics/websockets_and_actioncable.md',
      identifier_uuid: '949892d1-90af-46e0-a750-bedab0c5120b',
    },
    'Rails Final Project' => {
      title: 'Rails Final Project',
      description: "There's a pretty popular social networking app you should build.  They may have made a movie about it.",
      is_project: true,
      github_path: '/ruby_on_rails/mailers_advanced_topics/project_final.md',
      accepts_submission: true,
      previewable: true,
      identifier_uuid: '3eac603e-c8e7-4ba8-ade0-87c4e3c3de59',
    },
    'Conclusion' => {
      title: 'Conclusion',
      description: "Holy cow, you've gotten to the end of the road!  ...Sort of.",
      is_project: false,
      github_path: '/ruby_on_rails/mailers_advanced_topics/conclusion.md',
      identifier_uuid: '170d4217-696c-45b9-91b5-0465bb46f032',
    },
    'Installing PostgreSQL' => {
      title: 'Installing PostgreSQL',
      description: 'This lesson updates the local development environment with a new database provider.',
      is_project: false,
      github_path: '/ruby_on_rails/advanced_forms_and_activerecord/installing_psql.md',
      identifier_uuid: 'b2990a57-ff1f-4b08-a607-2b7bd35fca50',
      installation_lesson: true,
    },
    'Basic Associations' => {
      title: 'Basic Associations',
      description: 'This lesson explains the basics of using Active Record associations to define relationships between models',
      is_project: false,
      github_path: '/ruby_on_rails/active_record_basics/basic_associations.md',
      identifier_uuid: '4bea2014-62ab-490d-be29-9dda2a52445f',
    },
    'Basic Validations' => {
      title: 'Basic Validations',
      description: 'This lesson explains the basics of validating user data in your Rails applications',
      is_project: false,
      github_path: '/ruby_on_rails/active_record_basics/basic_validations.md',
      identifier_uuid: '1063f583-493f-4faf-81e6-3faf5ee76c9c',
    },
    'Migrations' => {
      title: 'Migrations',
      description: 'This lesson explains how migrations are used to change your database schema',
      is_project: false,
      github_path: '/ruby_on_rails/active_record_basics/migrations.md',
      identifier_uuid: 'f964a585-e24c-444e-a2be-13a5339172d9',
    }
  }
end
