require 'rails/generators'

module Staple
  class TypographyGenerator < Rails::Generators::Base
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
        puts "#{component} import #{variable} -> #{typeface}"
        if File.readlines(filename).any?{ |l| l["$#{variable}:"] }
            #replace line w/ new
            gsub_file(filename, /\$#{variable}:.*$/, "$#{variable}: #{contents};") if contents
            gsub_file(filename, "//&*import", "\n#{import_type}//&*import") if import_type
            gsub_file(filename, /\$#{variable}:.*$/, "$#{variable}: #{typeface};") if !contents
        else
            #create variable w/color
            gsub_file(filename, "//&*append", "$#{variable}: #{contents};\n//&*append") if contents
            gsub_file(filename, "//&*append", "$#{variable}: #{typeface};\n//&*append") if !contents
        end
        #check for variable, if yes: replace line, if no, create
    end

    def remove
        #check for variable, and remove line
        gsub_file(filename, /\$#{variable}:.*$/, "")
        gsub_file(filename, "\n#{import_type}", "") if import_type
    end

    #HELPER METHODS

    def contents
        file = File.join(self.class.source_root, 'source', 'styles', "#{component}", "#{typeface.dasherize}.typeface")
        get_file(file)
    end

    def import_type
        file = File.join(self.class.source_root, 'source', 'styles', "#{component}", "#{typeface.dasherize}-import.scss")
        get_file(file)
    end

    def get_file(file)
        if File.file?(file)
            return File.read(file)
        else
            return false
        end
    end

    def filename
        "app/assets/stylesheets/staple/#{component}.scss"
    end

    #DEFINE

    def action
        actions[0]
    end

    def variable
        actions[1].split(":").first
    end

    def typeface
        actions[1].split(":").last
    end

    def component
        "typography"
    end

  end
end
