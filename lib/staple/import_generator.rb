require 'rails/generators'

module Staple
  class ImportGenerator < Rails::Generators::Base
    desc 'bring in the staple'
    source_root File.join(File.dirname(__FILE__), '..', '..')
    argument :actions, :type => :array, :default => []
    def init
        puts "#{actions}"
    end

    def copy_styles
        puts "style"
        if append?
            puts "append"
            file = File.join('styles', "#{component}", pattern_name)
            puts file
            puts File.read(File.join(self.class.source_root, file))
            # puts File.read(File.join(destination_root, file))
        else
            puts "replace default"
            file = File.join('styles', "#{component}", pattern_name)
            puts file
            puts File.read(File.join(self.class.source_root, file))
        end
    end

    # def copy_html
    #   copy_file_if_exists(
    #     partial_name,
    #     File.join('app', 'views', 'refills', partial_name),
    #   )
    # end

    private

    def contents
        file = File.join('styles', "#{component}", pattern_name)
        if File.file?(file)
            return File.read(file)
        end
    end

    def pattern_name
      "#{pattern.dasherize}.scss"
    end

    def append?
        if append && append == "append"
            return true;
        else
            return false;
        end
    end

    def component
        actions[0]
    end

    def pattern
        actions[1]
    end

    def append
        actions[2]
    end

    # def copy_file_if_exists(source, destination)
    #   if File.exists?(File.join(self.class.source_root, source))
    #     copy_file source, destination
    #   end
    # end

    # def partial_name
    #   "_#{snippet.underscore}.html.erb"
    # end

    # def javascript_name
    #   "#{snippet.underscore}.js"
    # end
  end
end
