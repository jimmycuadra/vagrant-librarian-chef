# vagrant-librarian-chef

A [Vagrant](http://www.vagrantup.com/) plugin to install [Chef](http://www.opscode.com/chef/) cookbooks using [Librarian-Chef](https://github.com/applicationsonline/librarian-chef).

## Requirements

* Vagrant version 1.1 or greater.

## Installation

``` bash
vagrant plugin install vagrant-librarian-chef
```

## Usage

Vagrant will automatically run Librarian-Chef before any provisioning step, so simply set up your Cheffile as you normally would.

## Development

``` bash
bundle
mkdir cookbooks
bundle exec vagrant up
```

The cookbooks directory must be present or the Vagrantfile will fail to validate. It's not checked into version control because its contents (including any potential .gitkeep file) are removed by Librarian-Chef during its execution.

## Acknowledgements

Thank you to @thegcat and other contributors for their work on [vagrant-librarian](https://github.com/thegcat/vagrant-librarian), an earlier version of this functionality for Vagrant 1.0.x and the original Librarian gem with integrated Librarian-Chef.
