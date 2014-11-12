require 'rails/generators'

module Staple
  class ListGenerator < Rails::Generators::Base
    desc 'List Available Staples'

    def list
      puts 'Available Staples'
      puts '================='
      # stylesheets.each do |file_name|
      #   puts '- ' + file_name.gsub(/_|\.scss/, '')
      # end
    end

    # private
    # def stylesheets
    #   refills_dir = File.expand_path('../../../source/stylesheets/staple', __FILE__)
    #   stylesheets = Dir.entries(refills_dir)
    #   stylesheets.reject {|f| f == '.' || f == '..' }
    # end
  end
end
