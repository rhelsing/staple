require 'rails/generators'

module Staple
  class InstallGenerator < Rails::Generators::Base
    desc 'Install foundation w/ slim template, simple form and staple base styles'
    def foundation_install
      generate "foundation:install", "--slim" #rails g foundation:install --slim
    end

    def simple_form_install
      generate "simple_form:install", "--foundation" #rails generate simple_form:install --foundation
    end

    #modify simple form to use hints as errors

    #import base style

  end
end
