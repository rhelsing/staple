require 'rails/generators'

module Staple
  class ImportGenerator < Rails::Generators::Base
    desc 'bring in the staple'
    source_root File.join(File.dirname(__FILE__), '..', '..')
    argument :actions, :type => :array, :default => []

    def call_generators
        if global?
            #call self with each
            puts "all"
        else
            puts "component"
            if theme_definition
                patterns = theme_definition.split("\n")
                patterns.each do |pattern|
                    generate "staple:import", "#{component}", "#{pattern}"
                end
            end
        end
    end

    private

    def theme_definition
        file = File.join(self.class.source_root, 'source', 'styles', "#{component}", "themes", "#{theme.dasherize}.theme")
        get_file(file)
    end

    def get_file(file)
        if File.file?(file)
            File.read(file)
        else
            false
        end
    end

    def global?
        if component=="global"
            true
        else
            false
        end
    end

    def component
        actions[0]
    end

    def theme
        actions[1]
    end

  end
end

#rails g staple:theme buttons plastic
#rails g staple:theme global plastic