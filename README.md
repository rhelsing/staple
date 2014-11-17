#staple

a modular ui framework for rails built on top of foundation and sass.

##todo

* placement of triggers
* create patterns and themes
* default form and builders
* color schemes, typography -> *special case
* hover -> alternate_state
* swap out themes / place theme label and deconstruct before placing next theme

##lower priority todo
* don't require other gems
* integration with existing projects
* reinstall places foundation again then does replace, separate generator for update?
* variables generator:
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