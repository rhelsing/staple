#Staple

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
rails generate staple:set theme:Flat
```

```console
rails generate staple:set typeface_primary:HelveticaNeau
```

```console
rails generate staple:set typeface_secondary:ComicSans
```

```console
rails generate staple:set colorscheme:Flatland
```