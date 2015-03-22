# This is a RSS-Aggregator built on Rails.
It started out as a final project of two of [Moringa School's](http://moringaschool.com) first cohort ([dwanjuhi1](http://github.com/dwanjuhi1) & [uschtwill](http://github.com/uschtwill)).

Nevertheless we would like to continue to work on this project and eventually deploy and maintain it. We would like it to aggregate posts from Nairobi tech ecosystem's best blogs.

## Contributing
We believe that it could be a cool project for guys and gals from the Nairuby group to collaborate on have a project together, same goes for the people from the Nairobi JS user group.

Additionally it could be a cool project for people getting started with web development to cut their teeth by making their first contributions to something meaningful and work on a real project. There surely is enough to do.

Please check out the [CONTRIBUTION.md](https://github.com/uschtwill/rails_rss_aggregator/blob/master/CONTRIBUTING.md), if you would like to work on this.

## This aggregator currently has the following features (22.03.15):
* Fetches posts from an unlimited number of RSS feeds
* Atomatically fetches those posts by employing a background worker
* Displays those posts on the frontpage
* Stores all posts in a database and...
* Makes them full-text searchable via ElasticSearch
* Allows visitors to create accounts and...
* To bookmark posts
* Pushes all posts to a Twitterbot

## Using this for a different purpose
Of course you can also just fork the whole thing and make it about something completely different. It really just aggregates RSS feeds, but apart from that its application is quite universal. Just put whatever feeds you want in the ```Blogs``` database table and start aggregating. Feel free to do so, we would love this to see a lot of different uses.

## To install:
(given that you have Ruby and Rails installed)
* clone repository
* ```cd``` into the directory and run a ```bundle install```
* install and run [PostreSQL](http://www.postgresql.org/download/)
* add some entries (RSS-feeds) to the Blogs-table in the database, the background worker fetches new entries every 5 minutes
* install and run [Redis](http://redis.io/topics/quickstart). On Nitrous, navigate to Autoparts > Manage Packages. Search for Redis and follow installation instructions.
* install and run [Elasticsearch](http://www.elastic.co/guide/en/elasticsearch/reference/master/setup.html). On Nitrous, navigate to Autoparts > Manage Packages. Search for Elasticsearch and follow installation instructions.
* install and run [Foreman](http://theforeman.org/manuals/1.7/index.html#3.2.1Installation)
* go to http://localhost:3000
* enjoy


