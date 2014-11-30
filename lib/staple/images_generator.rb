require 'rails/generators'

module Staple
  class ImagesGenerator < Rails::Generators::Base
    desc 'pending'
    source_root File.join(File.dirname(__FILE__), '..', '..')
    argument :actions, :type => :array, :default => []

    def delegate
        case "#{action}"
        when "import"
            import
        when "remove"
            remove
        when "append"
            append
        when "amputate"
            amputate
        else
            puts "unknown command"
        end
    end

    private

    #ACTIONS

    def import
        puts "#{component} import #{pattern}"
        #remove if there
        gsub_file "app/assets/stylesheets/staple/#{component}.scss", "\n\t#{contents}", "" if contents
        gsub_file "app/assets/stylesheets/staple/#{component}.scss", "//&*default", "\n\t#{contents}//&*default" if contents
        gsub_file "app/assets/stylesheets/staple/#{component}.scss", "//&*hover", "\n\t#{hover}//&*hover" if hover
        gsub_file "app/assets/stylesheets/staple/builders/build_#{component}.scss", "//&*bg", "\n\t\t#{bg}//&*bg" if bg
    end

    def remove
        puts "#{component} remove #{pattern}"
        gsub_file "app/assets/stylesheets/staple/#{component}.scss", "\n\t#{contents}", "" if contents
        gsub_file "app/assets/stylesheets/staple/#{component}.scss", "\n\t#{hover}", "" if hover
        gsub_file "app/assets/stylesheets/staple/builders/build_#{component}.scss", "\n\t\t#{bg}", "" if bg
    end

    #HELPER METHODS

    def contents
        file = File.join(self.class.source_root, 'source', 'styles', "#{component}", "#{pattern.dasherize}.scss")
        get_file(file)
    end

    def hover
        file = File.join(self.class.source_root, 'source', 'styles', "#{component}", "#{pattern.dasherize}-hover.scss")
        get_file(file)
    end

    def bg
        file = File.join(self.class.source_root, 'source', 'styles', "#{component}", "#{pattern.dasherize}-bg.scss")
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
        "images"
    end

  end
end
