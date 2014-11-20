require 'rails/generators'

module Staple
  class ColorsGenerator < Rails::Generators::Base
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
        puts "#{component} import #{variable} -> #{color}"
        if File.readlines("app/assets/stylesheets/staple/#{component}.scss").any?{ |l| l["#{variable}"] }
            puts "exists"
        else
            puts "not in there"
        end
        #check for variable, if yes: replace line, if no, create
    end

    def remove
        #check for variable, and remove line
    end

    #HELPER METHODS

    def contents
        file = File.join(self.class.source_root, 'source', 'styles', "#{component}", "#{color.dasherize}.color")
        get_file(file)
    end

    def get_file(file)
        if File.file?(file)
            return File.read(file)
        else
            return false
        end
    end

    def not_valid
        !contents
    end

    #DEFINE

    def action
        actions[0]
    end

    def variable
        actions[1].split(":").first
    end

    def color
        actions[1].split(":").last
    end

    def component
        "colors"
    end

  end
end
