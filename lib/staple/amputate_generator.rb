require 'rails/generators'

module Staple
  class AmputateGenerator < Rails::Generators::Base
    desc 'remove styles from default'
    source_root File.join(File.dirname(__FILE__), '..', '..')
    argument :actions, :type => :array, :default => []

    def import_styles
        puts "remove from default"
        if contents
            #replace component
            gsub_file "app/assets/stylesheets/staple/#{component}.scss", "\n.#{pattern_name}{\n#{contents}\n}", ""
            # gsub_file "app/assets/stylesheets/staple/builders/build_#{component}.scss", "\n#{contents}\n", ""
        else
            puts "invalid operation"
        end
    end

    private

    def contents
        file = File.join(self.class.source_root, 'source', 'styles', "#{component}", pattern_name)
        if File.file?(file)
            return File.read(file)
        else
            return false
        end
    end

    def pattern_name
      "#{pattern.dasherize}.scss"
    end

    def component
        actions[0]
    end

    def pattern
        actions[1]
    end

  end
end