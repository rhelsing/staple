#Staple - COMING SOON

High level UI framework. Built on top of foundation.

#STRATEGY

##Main
* Overrides
* Default Styles
* Additional Styles
* Generate

##Import
* Override defaults
* Add additional
	* Styles
	* Type of generators
* Components - inherit default styles

##TODO

* Generators

##LOW PRIORITY
* declaring as dependency does not load it?
* integration with existing projects
* don't require other gems
* reinstall places foundation again then does replace, seperate generator for update?

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

##Simple, Universal Markup
```slim
section.row
	nav.columns.small-3
		ul.side-nav
		  li
		    a href="#"  Link 1
		  li
		    a href="#"  Link 2
	article.columns.small-9
		h1 Article title
		h5.subheader Subheader
		p Lorem ipsum dolor sit amet, consectetur adipisicing elit.
```

##Modify Overall, Modular Style With Commands
```console
staple theme:flat
```

```console
staple type-face-primary:HelveticaNeau
```

```console
staple type-face-secondary:ComicSans
```

```console
staple color-scheme:Flatland
```

staple (append) {button-style|button-theme} {id}
rails g staple:import

if append, add content from appropriate file
if not append, replace default with content

##Build

gem build staple.gemspec
gem push staple-0.0.1.gem