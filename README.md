#staple

a modular ui framework for rails built on top of foundation and sass.

##todo

* placement of triggers
* create patterns and themes

##lower priority todo
* declaring as dependency does not load it? vs don't require other gems
* integration with existing projects
* reinstall places foundation again then does replace, separate generator for update?
* bring repeated generator code into mixin
* Set variables with generator: default
	* radius
	* font
	* primary-color
	* border-size
	* change ammount (color dif, hover dif)
* create executables
* Demarcate each pattern (atom) with comment

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