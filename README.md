# vagrant-librarian-chef

A [Vagrant](http://www.vagrantup.com/) plugin to install
[Chef](http://www.opscode.com/chef/) cookbooks using
[Librarian-Chef](https://github.com/applicationsonline/librarian-chef).

## Requirements

* Vagrant version 1.2.0 or greater.

## Installation

``` bash
vagrant plugin install vagrant-librarian-chef
```

## Usage

Vagrant will automatically run Librarian-Chef before any provisioning step, so
simply set up your Cheffile as you normally would.

You may specify the subdirectory within which to run `librarian-chef`
using the `librarian_chef.cheffile_dir` config key.  Please keep in mind
that you will need to explicitly set the `cookbooks_path` in the
`:chef_solo` provisioner:

```ruby
Vagrant.configure("2") do |config|

  config.librarian_chef.cheffile_dir = "chef"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "chef/cookbooks"

    ...

  end
end
```

## Development

``` bash
bundle
bundle exec vagrant up
```

## Acknowledgements

Thank you to @thegcat and other contributors for their work on
[vagrant-librarian](https://github.com/thegcat/vagrant-librarian), an earlier
version of this functionality for Vagrant 1.0.x and the original Librarian gem
with integrated Librarian-Chef.
