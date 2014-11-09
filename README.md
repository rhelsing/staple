#Staple - DOES NOT WORK YET

CSS platform in the spirit of thoughtbot/refills. Built on top of foundation.

##Install
```ruby
#Gemfile
gem 'staple'
bundle install
```

or

```ruby
gem install 'staple'
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