![Fr8 Logo](https://github.com/Fr8org/Fr8Core/blob/master/Docs/img/Fr8Logo.png)

# Fr8 Ruby SDK and Terminals

These Ruby-based Fr8 Terminals work with the [Fr8 ecosystem](http://www.fr8.co). Fr8 is an open source cloud based integration platform ([iPaaS](https://en.wikipedia.org/wiki/Cloud-based_integration)).

Fr8 Terminals communicate with Fr8 Hubs using RESTful endpoints, Http, and JSON. The SDK portion of this repository provides tools to make it easier for Terminals to be created and to keep things DRY. For example, there are object mapper classes that allow Ruby developers to avoid having to personally deal with the serialization and deserialization of Ruby objects into JSON.

The Ruby SDK services are admittedly in an early stage of development. (To get a sense of the roadmap, you may want to look at the more mature [.NET SDK](https://github.com/Fr8org/Fr8Core/blob/master/Docs/ForDevelopers/SDK/.NET/Home.md))


Currently, this repository contains a single Terminal, the Fr8 Trello Terminal. This Terminal exposes useful Trello services to Fr8 Plans via a set of Activities.

Join the discussion here in the Issues list and in the #fr8dev-ruby channel on the [public Fr8 Slack Team](http://slack.fr8.co).


## Developing a Fr8 Terminal


1) You only need to clone this repo if you want to build or modify Fr8 Terminals written in Ruby. Before doing so, make sure you're familiar with Fr8 as an end user by building Fr8 Plans at the [main Fr8 website](http://fr8.co).

2) Read the [development guides](https://github.com/Fr8org/Fr8Core/blob/master/Docs/ForDevelopers/DevGuideHome.md), especially the [Terminal Development Guide](https://github.com/Fr8org/Fr8Core/blob/master/Docs/ForDevelopers/DevelopmentGuides/TerminalDevelopmentGuide.md).

3) Clone this repo.

4) Choose a [development approach](https://github.com/Fr8org/Fr8Core/blob/master/Docs/ForDevelopers/DevelopmentGuides/ChoosingADevelopmentApproach.md).  The Fr8 service at fr8.co uses Heroku to deploy production and dev Ruby Terminals.  


Ruby Code uses https://github.com/bbatsov/ruby-style-guide as its style guide, checked by Rubocop.

# Installation

- Rails `gem install rails`
- Bundler `gem install bundler --version '1.11.2'` (v 1.11.2 is the one currently being used by Heroku)
- Install GEMs with Bundler `bundle`
- Initiate the DB `rake db:create`

## Requirements

### OSX
- RVM `\curl -sSL https://get.rvm.io | bash -s stable --ruby`
- Homebrew `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
- PostgreSQL `brew install postgresql`
