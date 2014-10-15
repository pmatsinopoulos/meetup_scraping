This is a ruby script that can be used to scrape [Meet Up](http://www.meetup.com) and send a message to all the members of a given meet up group.

Usage
=====

Use

```
bundle
```

to install all the necessary gems.

On the command line:

```
bundle exec ruby meetup_scraping.rb <your_email> <your_password> <meetup_slug> <your_message_in_single_quotes>
```

Example of usage:

```
bundle exec ruby meetup_scraping.rb panayotis@matsinopoulos.gr 12345678 Startup-Grind-Athens 'This is my message to all members'
```

where `Startup-Grind-Athens` is a [valid meetup group](http://www.meetup.com/Startup-Grind-Athens)


