#staple

a modular ui framework for rails built on top of foundation and sass.

##goals

* favor presets over explicit declaration
* convention over configuration
* keep it simple

##todo

* component based generators:
	* colors
	* typography
	* tables
	* sizes
* fix plastic (Focus color), flat theme selectors.

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
* make variable filename for generators

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
* rails g staple:colors import primary:blue//adds if doesn't exist
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