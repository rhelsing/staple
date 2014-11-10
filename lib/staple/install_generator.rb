require 'rails/generators'

module Staple
  class InstallGenerator < Rails::Generators::Base
    desc 'Install foundation w/ slim template, simple form and staple base styles'
    source_root File.join(File.dirname(__FILE__), '..', '..')
    def foundation_install
      # generate "foundation:install", "--slim" #rails g foundation:install --slim
      insert_into_file "app/assets/javascripts/application#{detect_js_format[0]}", "#{detect_js_format[1]} require foundation\n", :after => "jquery_ujs\n"
      append_to_file "app/assets/javascripts/application#{detect_js_format[0]}", "#{detect_js_format[2]}"
      # NOT NEEDED:
      # settings_file = File.join(File.dirname(__FILE__),"..", "..", "..", "..", "vendor", "assets", "stylesheets", "foundation", "_settings.scss")
      # create_file "app/assets/stylesheets/foundation_and_overrides.scss", File.read(settings_file)
      # append_to_file "app/assets/stylesheets/foundation_and_overrides.scss", "\n@import 'foundation';\n"
      copy_file "source/foundation/foundation_and_overrides.scss", "app/assets/stylesheets/foundation_and_overrides.scss", :force => true
      insert_into_file "app/assets/stylesheets/application#{detect_css_format[0]}", "\n#{detect_css_format[1]} require foundation_and_overrides\n", :after => "require_self"
      template 'source/foundation/application.html.slim', "app/views/layouts/application.html.slim"
      remove_file 'app/views/layouts/application.html.erb'
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

    def require_simple_form
      prepend_to_file "config/initializers/simple_form.rb", "require 'simple_form'"
    end

    def modify_simple_form
      gsub_file "config/initializers/simple_form_foundation.rb", "b.use :error, wrap_with: { tag: :small }", "b.use :error, :wrap_with => { :tag => :small, :class => :error }"
      gsub_file "config/initializers/simple_form_foundation.rb", "# b.use :hint,  wrap_with: { tag: :span, class: :hint }", "b.use :hint,  wrap_with: { tag: :small, class: :error }"
    end

    #import base style

    def detect_css_format
      return ['.css', ' *='] if File.exist?('app/assets/stylesheets/application.css')
      return ['.css.sass', ' //='] if File.exist?('app/assets/stylesheets/application.css.sass')
      return ['.sass', ' //='] if File.exist?('app/assets/stylesheets/application.sass')
      return ['.css.scss', ' //='] if File.exist?('app/assets/stylesheets/application.css.scss')
      return ['.scss', ' //='] if File.exist?('app/assets/stylesheets/application.scss')
    end

    def detect_js_format
      return ['.coffee', '#=', "\n() ->\n  $(document).foundation()\n"] if File.exist?('app/assets/javascripts/application.coffee')
      return ['.js.coffee', '#=', "\n() ->\n  $(document).foundation()\n"] if File.exist?('app/assets/javascripts/application.js.coffee')
      return ['.js', '//=', "\n$(function(){ $(document).foundation(); });\n"] if File.exist?('app/assets/javascripts/application.js')
    end

  end
end
