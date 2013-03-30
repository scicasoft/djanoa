require 'rails/generators'
require 'rails/generators/migration'

module Djanoa
  module Generators

    class InstallGenerator < Rails::Generators::Base
      
      include Rails::Generators::Migration
      source_root File.expand_path("../../templates", __FILE__)
      
      def self.next_migration_number(dirname)
        if ActiveRecord::Base.timestamped_migrations
          Time.now.utc.strftime("%Y%m%d%H%M%S")
        else
         "%.3d" % (current_migration_number(dirname) + 1)
        end
      end
      
      def create_migration_file
        migration_template 'migration.rb', 'db/migrate/djanoa_migration.rb'
      end
      
      def create_model
        template "model.rb", File.join('app/models', "djanoa_message.rb")
      end

      def create_controller
        template "controller.rb", File.join('app/controllers', "djanoa_messages_controller.rb")
      end

      def create_initializer_file
        template 'initializer.rb', File.join('config/initializers', "djanoa.rb")
      end

      def create_route
        route "get '/new_sms' => 'djanoa_messages#new_sms', defaults: {format: 'xml'}"
      end
      
    end

  end
end