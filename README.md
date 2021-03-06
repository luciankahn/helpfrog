# Helpfrog
Find, map, and rate nearby social services in NYC.

## About

* The city of New York maintains a database of social service agencies. Until now, there was no simple way for ordinary people to browse, filter, or view them. Helpfrog aims to provide the missing link between the open data portal and regular New Yorkers. Just enter an address or intersection, choose one or more categories, and we'll show you a map and list of the nearest resources.

* HelpFrog is designed for use on library or social service agency computers and doesn't require an email address, smartphone, phone number, or ID of any kind. Helpfrog is an open source app. Built and maintained by Lucian Kahn (Ruby on Rails, jQuery, Google Maps API, Ruby Geocoder) and Miriam Nadler (Sass, jQuery). Original Sinatra prototype by Lucian Kahn.

## Contributing:

* Clone this repo and make a feature branch.
* Don't forget to merge master into your local branch and resolve any merge conflicts BEFORE making a pull request.
* The current project is located in rails/helpfrog. Don't make PRs to the Sinatra version; it's only a prototype.
* For development purposes, you MAY use rake db:seed to populate the database with categories and the "LGBT Resources" data.
* For development purposes, you MAY NOT run the complete "rake db:update_apis" task. This would make unnecessary requests to the NYC open data database. Please be considerate.
* However, you MAY add an additional resource to the update_apis rake task -- we encourage this! Simply comment out the rest of the API calls in update_apis while you're testing the new API call. 
* TEST YOUR CODE. 
