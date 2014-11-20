require 'rails/generators'

module Staple
  class ButtonsGenerator < Rails::Generators::Base
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
        gsub_file "app/assets/stylesheets/staple/#{component}.scss", "//&*default", "\n\t#{contents}//&*default" if contents
        gsub_file "app/assets/stylesheets/staple/builders/build_#{component}.scss", "//&*default", "\n\t\t#{contents}//&*default" if contents
        gsub_file "app/assets/stylesheets/staple/#{component}.scss", "//&*hover", "\n\t#{hover}//&*hover" if hover
        gsub_file "app/assets/stylesheets/staple/builders/build_#{component}.scss", "//&*hover", "\n\t\t#{hover}//&*hover" if hover
        puts "invalid operation: : #{component} import #{pattern}. for available actions: rails g staple:list [option]" if !contents
    end

    def remove
        puts "#{component} remove #{pattern}"
        gsub_file "app/assets/stylesheets/staple/#{component}.scss", "\n\t#{contents}", "" if contents
        gsub_file "app/assets/stylesheets/staple/builders/build_#{component}.scss", "\n\t\t#{contents}", "" if contents
        gsub_file "app/assets/stylesheets/staple/#{component}.scss", "\n\t#{hover}", "" if hover
        gsub_file "app/assets/stylesheets/staple/builders/build_#{component}.scss", "\n\t\t#{hover}", "" if hover
        puts "invalid operation. for available actions: rails g staple:list [option]" if !contents
    end

    def append
        puts "append"
        gsub_file "app/assets/stylesheets/staple/#{component}.scss", "//&*append", "\n.#{component.singularize}.#{pattern}{\n\t#{contents}\n}//&*append" if contents
        gsub_file "app/assets/stylesheets/staple/builders/build_#{component}.scss", "//&*append", "\n.#{component.singularize}.\#{$class}.#{pattern}{\n\t#{contents}\n}//&*append" if contents
        gsub_file "app/assets/stylesheets/staple/#{component}.scss", "//&*append", "\n.#{component.singularize}.#{pattern}:hover{\n\t#{hover}\n}//&*append" if hover
        gsub_file "app/assets/stylesheets/staple/builders/build_#{component}.scss", "//&*append", "\n.#{component.singularize}.\#{$class}.#{pattern}:hover{\n\t#{hover}\n}//&*append" if hover
        puts "invalid operation. for available actions: rails g staple:list [option]" if !contents
    end

    def amputate
        puts "amp"
        gsub_file "app/assets/stylesheets/staple/#{component}.scss", "\n.#{component.singularize}.#{pattern}{\n\t#{contents}\n}", "" if contents
        gsub_file "app/assets/stylesheets/staple/builders/build_#{component}.scss", "\n.#{component.singularize}.\#{$class}.#{pattern}{\n\t#{contents}\n}", "" if contents
        gsub_file "app/assets/stylesheets/staple/#{component}.scss", "\n.#{component.singularize}.#{pattern}:hover{\n\t#{hover}\n}", "" if hover
        gsub_file "app/assets/stylesheets/staple/builders/build_#{component}.scss", "\n.#{component.singularize}.\#{$class}.#{pattern}:hover{\n\t#{hover}\n}", "" if hover
        puts "invalid operation. for available actions: rails g staple:list [option]" if !contents
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
        "buttons"
    end

  end
end
