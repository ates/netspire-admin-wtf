Web administration interface for Netspire 
=========================================

Running
-------

    cd netspire-admin

Copy config/database.yml.sample to config/database.yml and adjust it

Bootstrap database:

    bundle exec rake db:setup

Run it on 3000 port:

    bundle exec rails s


Demo
----
http://netspire.heroku.com

username: admin

password: secret