#Staple - COMING SOON

High level UI framework. Built on top of foundation.

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
staple theme:Flat
```

```console
staple typeface_primary:HelveticaNeau
```

```console
staple typeface_secondary:ComicSans
```

```console
staple color_scheme:Flatland
```

gem build staple.gemspec
gem push staple-0.0.1.gem

#TODO

* declaring as dependency does not load it?
* make scaffold/generator use simple form/slim. not generate css
* make install compatible with existing projects