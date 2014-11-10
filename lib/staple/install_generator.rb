require 'rails/generators'

module Staple
  class InstallGenerator < Rails::Generators::Base
    desc 'Install foundation w/ slim template, simple form and staple base styles'
    source_root File.join(File.dirname(__FILE__), '..', '..', '..')
    def foundation_install
      generate "foundation:install", "--slim" #rails g foundation:install --slim
    end

    def simple_form_install
      generate "simple_form:install", "--foundation" #rails generate simple_form:install --foundation
    end

    def remove_tree
      gsub_file "app/assets/stylesheets/application#{detect_css_format[0]}", "\n#{detect_css_format[1]} require_tree .", ""
    end

    def include_font_awesome
      insert_into_file "app/assets/stylesheets/application#{detect_css_format[0]}", "\n#{detect_css_format[1]} require font-awesome", :after => "require foundation_and_overrides"
    end

    def modify_simple_form
      gsub_file "config/initializers/simple_form_foundation.rb", "b.use :error, wrap_with: { tag: :small }", "b.use :error, :wrap_with => { :tag => :small, :class => :error }"
      gsub_file "config/initializers/simple_form_foundation.rb", "# b.use :hint,  wrap_with: { tag: :span, class: :hint }", "b.use :hint,  wrap_with: { tag: :small, class: :error }"
    end

    def simplify_foundation_and_overrides
      copy_file "source/foundation_and_overrides.scss", "app/assets/stylesheets/foundation_and_overrides.scss", :force => true
    end

    #import base style

    def detect_css_format
      return ['.css', ' *='] if File.exist?('app/assets/stylesheets/application.css')
      return ['.css.sass', ' //='] if File.exist?('app/assets/stylesheets/application.css.sass')
      return ['.sass', ' //='] if File.exist?('app/assets/stylesheets/application.sass')
      return ['.css.scss', ' //='] if File.exist?('app/assets/stylesheets/application.css.scss')
      return ['.scss', ' //='] if File.exist?('app/assets/stylesheets/application.scss')
    end

  end
end
