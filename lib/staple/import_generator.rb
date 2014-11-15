require 'rails/generators'

module Staple
  class ImportGenerator < Rails::Generators::Base
    desc 'bring in the staple'
    source_root File.expand_path("../../../source", __FILE__)
    argument :args, type: :string, required: true
    @component, @pattern, @append = args.split(" ")

    def copy_styles
        puts "style"
        if append?
            puts "append"
            puts contents if contents
        else
            puts "replace default"
            puts contents if contents
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
        file = File.join('styles', "#{@component}", pattern_name)
        if File.file?(file)
            return File.read(file)
        end
    end

    def pattern_name
      "_#{@pattern.dasherize}.scss"
    end

    def append?
        if @append && @append == "append"
            return true;
        else
            return false;
        end
    end

    def args
        "_#{args}"
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
