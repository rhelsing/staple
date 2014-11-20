require 'rails/generators'

module Staple
  class ThemeGenerator < Rails::Generators::Base
    desc 'bring in the staple'
    source_root File.join(File.dirname(__FILE__), '..', '..')
    argument :actions, :type => :array, :default => []

    def call_generators
        if global?
            #call self with each
            components = %w(buttons colors forms sizes tables typography)
            components.each do |c|
                generate "staple:theme", "#{c}", "#{theme}"
            end
        else
            if theme_definition
                if yes? "Any changes you have made to staple/#{component}.scss or builders will be overwritten. Continue? (Y/N)"
                    #tear down previous styles. hack: if they exist!
                    copy_file "source/styles/staple/#{component}.scss", "app/assets/stylesheets/staple/#{component}.scss", :force => true
                    copy_file "source/styles/staple/builders/build_#{component}.scss", "app/assets/stylesheets/staple/builders/build_#{component}.scss", :force => true
                    patterns = theme_definition.split("\n")
                    patterns.each do |pattern|
                        generate "staple:#{component}", "import", "#{pattern}"
                    end
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