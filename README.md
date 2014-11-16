#staple

Modular UI framework for rails built on top of foundation and sass.

##todo

* handle hovers (check if hover file is included? etc)
* handle various css-foreach components (rename color to component on buttons?)
* plastic should be theme/template (includes) of other files

##lower priority todo
* declaring as dependency does not load it? vs don't require other gems
* integration with existing projects
* reinstall places foundation again then does replace, separate generator for update?
* bring repeated generator code into mixin
* Set variables with generator: default radius, font, etc. (Which variables?)
* create executables

##Install

```ruby
#Gemfile
gem 'slim-rails'
gem 'foundation-rails'
gem 'font-awesome-rails'
gem 'simple_form'
gem 'staple'
```

```command
bundle install
spring stop
rails g staple:install
```

#how to use

rails g staple:{import|remove||append|amputate} buttons round

#staple command
staple {button-style|button-theme} {pattern} (append)
staple buttons round
staple buttons-theme plastic