# Wardrobe

Purpose of this app is to organize your clothes.

### Requirements

Ruby: 2.2.0, Rails: 4.2.5

###Features

DONE:

* filtering items
* adding new item

TO DO:

* users (log in, log out, personal items)
* editing items
* deleting items
* assigning numerical values to states
* laundry (marking as "in laundry", logging and counters)
* collecting items into item sets

### Setup

For now, application is pretty simple, and all what you have to do for setup is:

```
bundle
rake db:setup
```

To populate database with example data:
```
rake db:seed
```

### Launching the app

Run the server by typing command:

```
rails s
```

Visit `localhost:3000` in your browser.

### Testing

Run RSpec test suite by typing:

```
bundle exec rspec --format d
```
