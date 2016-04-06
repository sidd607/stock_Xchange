# StockXchange 2016

This repo will contain all the code related to StockXchange 2016 game.

## Contribution Instructions

If you want to contribute to this repository then fork this repository, make changes to your own codebase
and then generate pull request. Even though all of you have access to the master branch please refrain from pushing
code to the master branch. The reason is that it's a good practice to get your code reviewed by other developers as
that helps to find bugs.

## Getting started

First of all fork this repository. You will get some url which will point to your own profile eg. Lets suppose that url of forked repo is
"https://github.com/vik-y/stockXchange"

```sh
git remote add origin https://github.com/vik-y/stockXchange
git pull origin master
```
This will fetch the code from the forked branch which you own to your system. <br>
Now add a remote which points to the main code base that is github.com/zense/stockXchange

```sh
git remote add upstream https://github.com/zense/stockXchange
```
That's it. Now you have basic setup ready to contribute.

### For using the UI

1. Install bower
```sh
cd public/vendors
bower install
```
This will setup the front-end dependencies like bootstrap, angular etc.

## Fixing some common merge conflicts

If you are getting merge conflict in files like "schema.rb" or "Gemfile.lock" then this will work :
```sh
# For resolving schema.rb conflict
git checkout HEAD schema.rb
rake db:migrate

# For resolving Gemfile.lock conflicts
git checkout HEAD Gemfile.lock
bundle install
```
## Fixing Active Admin error

If you are getting "Uninitialized Constant ActiveAdmin (Name error)" then this will probably work :

```sh
gem 'activeadmin', github: 'activeadmin' # Add to GemFile
bundle install
rails g active_admin:install --skip-users # Will add Active Admin with existing users
rake db:migrate
```
But it is better to remove activeadmin for now, because it can be added at the very end. To remove active admin :

```sh
rails destroy active_admin:install
rails destroy active_admin:resource specific_table_name # type this command if you put some other migration to active admin
```

