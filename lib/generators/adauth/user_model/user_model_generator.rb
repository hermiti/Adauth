module Adauth
    module Generators
        class UserModelGenerator < Rails::Generators::Base
            source_root File.expand_path('../templates', __FILE__)
            argument :model_name, :type => :string, :default => "user"
            argument :migration_name, :type => :string, :default => false
            
            def generate_user_model
                template "model.rb.erb", "app/models/#{file_name}.rb"
                generate "migration", "#{migration_name_for_array}", "login:string", "group_strings:string", "name:string"
            end
            
            private
            
            def file_name
               model_name.underscore
            end
            
            def migration_name_for_array
                migration_name || "create_#{model_name.pluralize}"
            end
        end
    end
end