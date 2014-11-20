#staple

a modular ui framework for rails built on top of foundation and sass.

##goals

* favor presets over explicit declaration
* convention over configuration
* keep it simple

##todo

* component based generators
* fix plastic, flat theme selectors. Focus color.
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
* Demarcate each pattern in scss (atom) with comment
* Make errors verbose. Print full command on low level.

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
* rails g staple:buttons import shadow
* rails g staple:buttons remove shadow
* rails g staple:buttons append gradient
* rails g staple:buttons amputate gradient

###forms
* rails g staple:forms import inner-shadow
* rails g staple:forms remove inner-shadow
* rails g staple:forms append inverse
* rails g staple:forms amputate inverse

###colors*
* rails g staple:colors import secondary:blue
* rails g staple:colors append fave:aqua //adds new color and generate class: button, accent?
* rails g staple:colors remove fave // removes color declaration

###typography*
* rails g staple:typography import typeface-primary:Roboto
* rails g staple:typography remove typeface-primary:Roboto
* rails g staple:typography append cool-typeface:Roboto //create var and generate

###tables
* rails g staple:tables import borders
* rails g staple:tables remove zebra-stripe
* rails g staple:tables append inverse
* rails g staple:tables amputate small

###sizes
* rails g staple:sizes import big
* rails g staple:sizes remove medium
* rails g staple:sizes append xl
* rails g staple:sizes amputate xxl

#staple command - coming soon
staple {button-style|button-theme} {pattern} (append)
staple buttons round
staple buttons-theme plastic