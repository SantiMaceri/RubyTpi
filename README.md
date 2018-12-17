# README

Full Rest Json Ruby on Rails for Users, Questions and Answers

## Requirements
	- Ruby Version: 2.5.1
	- Rails Version: 5.2.2
	- SQLite3 Version: 3.22.0

## Configuration
Clone the project and execute to install dependencies
``` bash
bundle
``` 
There are migrations created for this project, they are not perfect, but they do the work. To run them:
``` bash
rails db:migrate
``` 
## Testing
To run the tests located in /test/models execute:
``` bash
rails test
``` 
## How to Use
* In the root directory of the project execute rails s to start up de Api (default localhost:3000)
* Use POSTMan, HTTPie, or simply curl command to try it.
* Example (with HTTPpie):
``` bash
http GET :3000/questions sort=needing_help
```
