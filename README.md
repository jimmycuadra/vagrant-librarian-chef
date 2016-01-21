# vagrant-librarian-chef

*WARNING: This project is no longer maintained. You should use [Berkshelf](http://berkshelf.com/) instead.*

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

Librarian-Chef can be configured normally via configuration file at `.librarian/chef/config`. Again, if you change the path where cookbooks are installed by Librarian-Chef, make sure your Vagrantfile is updated to tell Vagrant's Chef provisioner where to look for them via the `cookbooks_path` attribute.

If you want to programmtically disable the plugin without uninstalling it, set the `enabled` attribute to false:

``` ruby
config.librarian_chef.enabled = false
```

## Development

Vagrant 1.5.0 or greater is required.

``` bash
bundle
bundle exec vagrant up
```

## Acknowledgements

Thank you to [@thegcat](https://github.com/thegcat) and other contributors for their work on
[vagrant-librarian](https://github.com/thegcat/vagrant-librarian), an earlier
version of this functionality for Vagrant 1.0.x and the original Librarian gem
with integrated Librarian-Chef.
