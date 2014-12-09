# MandrillEvent

MandrillEvent is built on the ActiveSupport::Notifications API. Incoming webhook requests are authenticated. Define subscribers to handle specific event types. Subscribers can be a block or an object that responds to #call.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mandrill_event'
```

And then execute:

    $ bundle

## Usage

TODO: Write usage instructions here

## Thanks

MandrillEvent takes inspiration directly from the [stripe_event](https://github.com/integrallis/stripe_event) gem, which takes it's inspiration from [Webmachine](https://github.com/seancribbs/webmachine-ruby/blob/6edaecea1ceab7c2c54fc5e83446317524f6bb8b/lib/webmachine/events.rb), which is inspired by Erlang. It's turtles all the way down.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/mandrill_event/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
