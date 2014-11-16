require 'rails/generators'

module Staple
  class AppendGenerator < Rails::Generators::Base
    desc 'append the staple'
    source_root File.join(File.dirname(__FILE__), '..', '..')
    argument :actions, :type => :array, :default => []

    def append_styles
        gsub_file "app/assets/stylesheets/staple/#{component}.scss", "//&*append", "\n.#{component}.#{pattern}{\n\t#{contents}\n}//&*append" if contents
        gsub_file "app/assets/stylesheets/staple/builders/build_#{component}.scss", "//&*append", "\n.#{component}.\#{$class}.#{pattern}{\n\t#{contents}\n}//&*append" if contents
        gsub_file "app/assets/stylesheets/staple/#{component}.scss", "//&*append", "\n.#{component}.#{pattern}:hover{\n\t#{contents}\n}//&*append" if hover
        gsub_file "app/assets/stylesheets/staple/builders/build_#{component}.scss", "//&*append", "\n.#{component}.\#{$class}.#{pattern}:hover{\n\t#{contents}\n}//&*append" if hover
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