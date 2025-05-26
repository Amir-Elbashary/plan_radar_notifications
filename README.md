# PlanRadar Scheduler

This app is built using Ruby 3.2.2 and Rails 7.2.2 in API mode
To run the application, it's as simple as:
- Make sure you're using the correct ruby version
- Make sure you use the `database.yml.example` and `env.example` with your system configs
- Run: bundle install
- Run: `rails db:create` then `rails db:migrate`
- Run: `rspec` to run all tests
- Run: `rails s` to run rails server
- Run `sidekiq` or `bundle exec sidekiq` to run the skidekiq dashboard
- API documentation is available on `localhost:3000` which will redirect to `localhost:3000/api`
- SideKiq dashboard is available on `localhost:3000/sidekiq`

My first thoughs was adding a job for each created ticket, but this idea would be bad on
a large scale app with millions of user as we will be having millions of jobs in queue
Maybe the good thing about this idea if that the notification will be up to the seconds
but editing tickets will be maintained in an ineffecient way

After some searching i came to the colcusion that polling would be the best way to do it so far
by running a job which loop through users and add jobs only when they match the time
Also this makes sure if some job fail, it will run again in a given interval (currently 1 min)
but i can be adjusted to whatever suits our needs
- It's a Linear time complixity O(n) but still, i think it's better than the first solution

I added some optional stuff on the app just to make it as close as full application
- Api Docs
- Custom methods to make the swagger docs as DRY as possible
- Created 4 APIs to add/update users and tickets for test purposes
- configured sidekiq in a viewable way
- I tried to add comments to explain my code as much as i could
