# Future Space Inc Challenge!
### Code challenge to show my habilities with ruby on rails, RestAPI, Clean Code, Async Jobs, OpenAPI documentation and Rspec Tests

# How to install the project
1. run `git clone git@github.com:PhTrias/future-space-chalenge.git`

2. run `cd future-space-chalenge`

3. run `bundle install`

4. run `rake db:create db:migrate`

5. run `whenever --update-crontab`

after clone the project and run the dependencies, we can start!

# Running the challenge

In this project i had configured 3 methods to run the import data from from the [Launch api](https://ll.thespacedevs.com/2.0.0/launch/):
## You can run by rake task


in terminal, run: `rake launchers:import_data`

## You can run by CronTab


in `config/schedule.rb`, i used [Whenever Gem](https://github.com/javan/whenever) to run scheduled task that will import launchers data from api. I define the run time once a day at `2am`, because this time, the traffic is lower and dont charge the api.

## You can run by API


In terminal, in the project repository, run: `rails s`. This command will start the server.

In another terminal tab, run: `bundle exec sidekiq -q import`. This command will start the sidekiq to run import launchers job assyncronously.

With the server running, open another terminal tab and run: `curl -i -X GET 'http://localhost:3000/api/v1/get_token'`. This will return to you a token, that can be used to authenticate your next request in launchers api.

Now, run: `curl -i -X GET 'http://localhost:3000/api/v1/import_launchers' -H 'Authentication: Token token_returned_from_previous_request_here'`. You will see the message: `Running launchers import asyncronously`.

If this message appear, the job will start execution. You can follow the execution of the job in the sidekiq tab.

# Accessing the api

To access the API, you need to follow the next steps.

In terminal, in the project repository, run: `rails s`. This command will start the server.

With the server running, open another terminal tab and run: `curl -i -X GET 'http://localhost:3000/api/v1/get_token'`. This will return to you a token, that can be used to authenticate your next request in launchers api.

Doing this, you be able to use the api! Remember use the authentication header to autenthicate: `-H 'Authentication: Token your_token_here'`

# Open API 3.0 Documentation
To access the API Doc, you need to follow the next steps.

In terminal, in the project repository, run: `rails s`. This command will start the server.

Access `http://localhost:3000/api-docs/index.html`.

> Note: You can access the api to return objects clicking on `Try it out`, but you need some DB objects to test with db connected. You can run `rake launchers:import_data` to get launchers for test.

To test api with authentication, access `Tokens`, get yout token running `Try it out` -> `Execute`. Use the token to Authenticate at the beginning of page on `Authorize` 

# Running Specs

To run the Rspec Tests, open a tab in terminal and run:

1. `bundle exec rspec  ./spec/` ~> All specs at once
2. `bundle exec rspec  ./spec/models/` ~> Models specs
3. `bundle exec rspec  ./spec/api/` ~> Api controllers specs
4. `bundle exec rspec  ./spec/services/` ~> Services specs
5. `bundle exec rspec  ./spec/requests/` ~> Swagger api specs


# Stacks
### 1. Ruby
  ### version - 3.0.2
### 2. Rails
  ### version - 7.0.4
### 3. Sidekiq
  ### version - 6.5.1
### 4. Rspec
    rspec-core version - 3.12.0
    rspec-expectations version - 3.12.2
    rspec-mocks version - 3.12.2
    rspec-rails version - 6.0.1
    rspec-support version - 3.12.0
### 4. Rswag (specs, api)
  ### Latest version

