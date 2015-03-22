Thanks @DavidLemayian for the pointer thath having a CONTRIBUTION.md would be agood idea. :)

# Contributing


## Why to contribute
Thanks for checking out this document, it means you are at least thinking about contributing to it. As we would like to deploy this RSS aggregator, we really are looking forward to you helping us improve it. 

We believe that it could be a cool project for guys and gals from the Nairuby group to collaborate on have a project together, same goes for the people from the Nairobi JS user group.

Additionally it could be a cool project for people getting started with web development to cut their teeth by making their first contributions to something meaningful and work on a real project. There surely is enough to do.


## Things you need to do to get going
(given that you have Ruby and Rails installed)
* clone repository
* ```cd``` into the dircetory and run a ```bundle install```
* install and run [PostreSQL](http://www.postgresql.org/download/)
* add some entries (RSS-feeds) to the Blogs-table in the database, the background worker fetches new entries every 5 minutes
* install and run [Redis](http://redis.io/topics/quickstart). On Nitrous, navigate to Autoparts > Manage Packages. Search for Redis and follow installation instructions.
* install and run [Elasticsearch](http://www.elastic.co/guide/en/elasticsearch/reference/master/setup.html). On Nitrous, navigate to Autoparts > Manage Packages. Search for Elasticsearch and follow installation instructions.
* install and run [Foreman](http://theforeman.org/manuals/1.7/index.html#3.2.1Installation)
* go to http://localhost:3000
* enjoy


## How to contribute
* Fork this repository
* Clone it to you machine
* Ideally write some tests (we haven't really done this so far, but would like to start doing this)
* Make your changes / Implement your features
* Run tests or at least be sure your code is working properly
* Commit your changes
* Push to your fork
* Do a [Pull Request](https://help.github.com/articles/using-pull-requests/)

A good starting point for getting ideas on what to work on is the [issues page](https://github.com/uschtwill/rails_rss_aggregator/issues). Just browse it, let us know what you'd like to work on and we'll make sure it is put aside for you. Choose anything that is labeled ```up-for-grabs```.

Here are some ideas:
* Fancy front-end coded in JS
* Tests for anything 
* Just reviewing the code and making it better would be VERY appreciated as well.

If you just find something buggy or would like to comment on the code, you can also just do that via the issues page. If you're going that route please provide as many information as you can (software-versions, screenshots, error-messages etc.).


## Submitting changes
* Please write clear and concise log messages for your commits.
* Try to comment your code where possible. (So far we haven't really done this ourselves, but I guess it would be a good idea to start doing so.)
* We will try to get back to you asap, but it might take a day or two.
* Be sure to finish your implementation properly before doing a Pull Request. Make commits of logical units.
* Consider starting the commit message with an applicable emoji (I stole this from [here](https://github.com/atom/atom/blob/master/CONTRIBUTING.md) :D ):
* :art: `:art:` when improving the format/structure of the code
* :racehorse: `:racehorse:` when improving performance
* :non-potable_water: `:non-potable_water:` when plugging memory leaks
* :memo: `:memo:` when writing docs
* :penguin: `:penguin:` when fixing something on Linux
* :apple: `:apple:` when fixing something on Mac OS
* :checkered_flag: `:checkered_flag:` when fixing something on Windows
* :bug: `:bug:` when fixing a bug
* :fire: `:fire:` when removing code or files
* :green_heart: `:green_heart:` when fixing the CI build
* :white_check_mark: `:white_check_mark:` when adding tests
* :lock: `:lock:` when dealing with security
* :arrow_up: `:arrow_up:` when upgrading dependencies
* :arrow_down: `:arrow_down:` when downgrading dependencies
* :shirt: `:shirt:` when removing linter warnings


## Coding conventions
* We indent using two spaces.
* We use [SLIM](http://http://slim-lang.com/) for all our views.


Thanks for reading! :heart::heart::heart:

