require 'rails/generators'

module Staple
  class ImportGenerator < Rails::Generators::Base
    desc 'bring in the staple'
    source_root File.join(File.dirname(__FILE__), '..', '..')
    argument :actions, :type => :array, :default => []

    def copy_styles
        puts "style"
        if append?
            puts "append"
            if contents
                puts contents
                #append contents where it needs to go
                # create a class called round in buttons
                # put in for loop or not? after different trigger? :%>>>
            else
                puts "invalid operation"
            end
        else
            puts "add to default"#vs replace default.. theme replaces?
            if contents
                #replace component
                insert_into_file "app/assets/stylesheets/staple/#{component}.scss", "\n#{contents}\n", :after => ":%>>"
                insert_into_file "app/assets/stylesheets/staple/builders/build_#{component}.scss", "\n#{contents}\n", :after => ":%>>"
                #:%>>h = hover?
            else
                puts "invalid operation"
            end
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

    def append?
        if append && append == "append"
            return true;
        else
            return false;
        end
    end

    # Arguments seperate and name
    def component
        actions[0]
    end

    def pattern
        actions[1]
    end

    def append
        actions[2]
    end

  end
end
