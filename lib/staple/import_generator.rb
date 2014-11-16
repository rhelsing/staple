require 'rails/generators'

module Staple
  class ImportGenerator < Rails::Generators::Base
    desc 'bring in the staple'
    source_root File.join(File.dirname(__FILE__), '..', '..')
    argument :actions, :type => :array, :default => []

    def import_styles
        gsub_file "app/assets/stylesheets/staple/#{component}.scss", "//&*default", "\n\t#{contents}//&*default" if contents
        gsub_file "app/assets/stylesheets/staple/builders/build_#{component}.scss", "//&*default", "\n\t\t#{contents}//&*default" if contents
        gsub_file "app/assets/stylesheets/staple/#{component}.scss", "//&*hover", "\n\t#{hover}//&*hover" if hover
        gsub_file "app/assets/stylesheets/staple/builders/build_#{component}.scss", "//&*hover", "\n\t\t#{hover}//&*hover" if hover
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
