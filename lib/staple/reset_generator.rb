require 'rails/generators'

module Staple
  class ResetGenerator < Rails::Generators::Base
    desc 'bring in the staple'
    source_root File.join(File.dirname(__FILE__), '..', '..')
    argument :actions, :type => :array, :default => []

    def reset
        components = %w(buttons colors forms tables typography sizes images)
        if yes? "All css changes will be overwritten. Continue? (Y/N)"
            components.each do |c|
                copy_file "source/styles/staple/#{c}.scss", "app/assets/stylesheets/staple/#{c}.scss", :force => true
                copy_file "source/styles/staple/builders/build_#{c}.scss", "app/assets/stylesheets/staple/builders/build_#{c}.scss", :force => true
            end
        end
    end

  end
end