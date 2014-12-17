# MandrillEvent

MandrillEvent is built on the ActiveSupport::Notifications API. Define subscribers to handle specific event types. Subscribers can be a block or an object that responds to #call.


## Installation

### Add it to your Gemfile

```ruby
# Gemfile
gem 'mandrill_event'
```

And then execute:

    $ bundle

## Usage

### Mount the engine in your routes

```ruby
# config/routes.rb
  mount MandrillEvent::Engine => '/mandrill'
```

### Setup the initializer

```ruby
# config/initializers/mandrill_event.rb
MandrillEvent.configure do |events|
  events.subscribe 'reject', RejectHandler.new
end
```

### Create subscriber objects that respond to #call

```ruby
# app/mandrill_handlers/reject_handler.rb
class RejectHandler
  def call(event)
    # your code here
  end
end
```

### Configure Mandrill webhooks to use your endpoint

At the Mandrill website, create a webhook that points to your server with the path `/mandrill/events`. A service like [Ngrok](https://ngrok.com/) or [Ultrahook](http://www.ultrahook.com/) can be really useful in creating a tunnel to your local server and inspecting the request payloads.


## Thanks

MandrillEvent ~~takes inspiration from~~ is a direct rip-off of the [stripe_event](https://github.com/integrallis/stripe_event) gem, which takes it's inspiration from [Webmachine](https://github.com/seancribbs/webmachine-ruby/blob/6edaecea1ceab7c2c54fc5e83446317524f6bb8b/lib/webmachine/events.rb), which is inspired by Erlang. It's turtles all the way down.


## TODO:

* More test coverage
* Incoming webhook requests are authenticated
* Get it on Coveralls
* Get it on Travis
* Get it on Code Climate


## Contributing

1. Fork it ( https://github.com/[my-github-username]/mandrill_event/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
