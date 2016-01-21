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
