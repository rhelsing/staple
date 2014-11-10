#Staple - COMING SOON

CSS platform in the spirit of thoughtbot/refills. Built on top of foundation.

##Install
```ruby
#Gemfile
gem 'staple'
```

```command
bundle install
rails g staple:install
```

If generator hangs, call spring stop then try again

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

* fix foundation-rails require, inlcude install in staple install?
* declaring as dependency does not load it?
* set scaffold to use slim? simple_form?
* stop spring
* make scaffold/generator use simple form/slim. not generate css
* make install compatible with existing projects