require 'rails/generators'

module Staple
  class FormsGenerator < Rails::Generators::Base
    desc 'pending'
    source_root File.join(File.dirname(__FILE__), '..', '..')
    argument :actions, :type => :array, :default => []

    def delegate
        case "#{action}"
        when "import"
            import
        when "remove"
            remove
        else
            puts "unknown command"
        end
    end

    private

    #ACTIONS

    def import
        puts "#{component} import #{pattern}"
        gsub_file "app/assets/stylesheets/staple/#{component}.scss", "//&*default", "\n\t#{contents}//&*default" if contents
        gsub_file "app/assets/stylesheets/staple/#{component}.scss", "//&*focus", "\n\t#{focus}//&*focus" if focus
        gsub_file "app/assets/stylesheets/staple/#{component}.scss", "//&*error", "\n\t#{error}//&*error" if error


        puts "invalid operation: #{component} import #{pattern}. for available actions: rails g staple:list [option]" if !contents
    end

    def remove
        puts "#{component} remove #{pattern}"
        gsub_file "app/assets/stylesheets/staple/#{component}.scss", "\n\t#{contents}", "" if contents
        gsub_file "app/assets/stylesheets/staple/#{component}.scss", "\n\t#{focus}", "" if focus
        gsub_file "app/assets/stylesheets/staple/#{component}.scss", "\n\t#{error}", "" if error
    end

    #HELPER METHODS

    def contents
        file = File.join(self.class.source_root, 'source', 'styles', "#{component}", "#{pattern.dasherize}.scss")
        get_file(file)
    end

    def focus
        file = File.join(self.class.source_root, 'source', 'styles', "#{component}", "#{pattern.dasherize}-focus.scss")
        get_file(file)
    end

    def error
        file = File.join(self.class.source_root, 'source', 'styles', "#{component}", "#{pattern.dasherize}-error.scss")
        get_file(file)
    end

    def get_file(file)
        if File.file?(file)
            return File.read(file)
        else
            return false
        end
    end

    #DEFINE

    def action
        actions[0]
    end

    def pattern
        actions[1]
    end

    def component
        "forms"
    end

  end
end
