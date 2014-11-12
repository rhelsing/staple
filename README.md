#Staple - COMING SOON

High level UI framework. Built on top of foundation.

##TODO

* Finish color and buttons
* Finish text and test
* Simple default generators first. Basic Theme.
* Load vars then override before
* Generate override components after using vars
* Modify files using generators or manual

##LOW PRIORITY
* declaring as dependency does not load it?
* integration with existing projects

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