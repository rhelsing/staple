#Staple - COMING SOON

High level UI framework. Built on top of foundation.

##TODO

* Tables
* Sizes

* See buttons for config
* can pull in partials/components and new css, not included w/install
* can then customize those with variables. Ask if you want to import if not in project

##LOW PRIORITY
* declaring as dependency does not load it?
* integration with existing projects
* turbolinks messed with abide validation: https://github.com/zurb/foundation/issues/2902

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

##Build

gem build staple.gemspec
gem push staple-0.0.1.gem