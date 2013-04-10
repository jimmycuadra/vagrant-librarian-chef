# vagrant-librarian-chef

A [Vagrant](http://www.vagrantup.com/) plugin to install [Chef](http://www.opscode.com/chef/) cookbooks using [Librarian-Chef](https://github.com/applicationsonline/librarian-chef).

## Requirements

* Vagrant version 1.1 or greater.

## Installation

``` bash
vagrant plugin install vagrant-librarian-chef
```

## Development

``` bash
bundle
mkdir cookbooks
bundle exec vagrant up
```

The cookbooks directory must be present or the Vagrantfile will fail to validate. It's not checked into version control because its contents (including any potential .gitkeep file) are removed by Librarian-Chef during its execution.
