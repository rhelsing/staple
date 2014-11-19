#staple

a modular ui framework for rails built on top of foundation and sass.

##goals

* favor presets over explicit declaration
* convention over configuration
* keep it simple

##todo

* does special case generators or component based generators make more sense from high level perspective?
* default form and builders
* hover -> alternate_state
* swap out themes / place theme label and deconstruction before placing next theme

##lower priority todo
* don't require other gems
* integration with existing projects
* reinstall places foundation again then does replace, separate generator for update?
* variables generator:
	* radius
	* font
	* primary-color
	* border-size
	* change amount (color dif, hover dif)
* create executables
* Demarcate each pattern (atom) with comment
* Handle import > modify > remove cycle. Explicit modification.

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

##intended use

* special cases - seperate generators?

###themes
* rails g staple:theme buttons plastic
* rails g staple:theme colors flatland // see flatland.theme
* rails g staple:theme global medium
* rails g staple:theme typography plastic // see flatland.theme

###buttons
* rails g staple:import buttons shadow
* rails g staple:remove buttons shadow
* rails g staple:append buttons gradient
* rails g staple:amputate buttons gradient

###forms
* rails g staple:import forms inner-shadow
* rails g staple:remove forms inner-shadow
* rails g staple:append forms inverse
* rails g staple:amputate forms inverse

###colors*
* rails g staple:import colors secondary:blue
* rails g staple:append colors fave:aqua //adds new color and generate class: button, accent?
* rails g staple:remove colors fave // removes color declaration

###typography*
* rails g staple:import typography typeface-primary:Roboto
* rails g staple:remove typography typeface-primary:Roboto
* rails g staple:append typography cool-typeface:Roboto //create var and generate

###tables
* rails g staple:import tables borders
* rails g staple:remove tables zebra-stripe
* rails g staple:append tables inverse
* rails g staple:amputate tables small

###sizes
* rails g staple:import sizes big
* rails g staple:remove sizes medium
* rails g staple:append sizes xl
* rails g staple:amputate sizes xxl

#staple command - coming soon
staple {button-style|button-theme} {pattern} (append)
staple buttons round
staple buttons-theme plastic