require 'rails/generators'

module Staple
  class AmputateGenerator < Rails::Generators::Base
    desc 'remove styles from default'
    source_root File.join(File.dirname(__FILE__), '..', '..')
    argument :actions, :type => :array, :default => []

    def amputate_styles
        gsub_file "app/assets/stylesheets/staple/#{component}.scss", "\n.#{component.singularize}.#{pattern}{\n\t#{contents}\n}", "" if contents
        gsub_file "app/assets/stylesheets/staple/builders/build_#{component}.scss", "\n.#{component.singularize}.\#{$class}.#{pattern}{\n\t#{contents}\n}", "" if contents
        gsub_file "app/assets/stylesheets/staple/#{component}.scss", "\n.#{component.singularize}.#{pattern}:hover{\n\t#{hover}\n}", "" if hover
        gsub_file "app/assets/stylesheets/staple/builders/build_#{component}.scss", "\n.#{component.singularize}.\#{$class}.#{pattern}:hover{\n\t#{hover}\n}", "" if hover
        puts "invalid operation. for available actions: rails g staple:list [option]" if !contents
    end

    private

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

    def component
        actions[0]
    end

    def pattern
        actions[1]
    end

  end
end