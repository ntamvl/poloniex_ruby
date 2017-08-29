# PoloniexRuby

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/poloniex_ruby`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'poloniex_ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install poloniex_ruby

## Usage

Add this config to `application.rb`:

```ruby
PoloniexRuby.setup do | config |
    config.key = 'my api key'
    config.secret = 'my secret token'
end
```

### returnChartData
```ruby
PoloniexRuby.get_all_daily_exchange_rates( currency_pair )
```

### returnTicker
```ruby
PoloniexRuby.ticker
```

### return24hVolume
```ruby
PoloniexRuby.volume
```

### returnOrderBook
```ruby
PoloniexRuby.order_book( currency_pair )
```

### returnActiveLoans
```ruby
PoloniexRuby.active_loans
```

### returnLendingHistory
```ruby
PoloniexRuby.lending_history( start = 0, end_time: Time.now.to_i )
```

### returnCurrencies
```ruby
PoloniexRuby.currencies
```

### returnCompleteBalances
```ruby
PoloniexRuby.complete_balances
```

### returnOpenOrders
```ruby
PoloniexRuby.open_orders( currency_pair )
```

### returnTradeHistory
```ruby
PoloniexRuby.trade_history( currency_pair, start = 0, end_time = Time.now.to_i )
```

### buy
```ruby
PoloniexRuby.buy( currency_pair, rate, amount )
```

### sell
```ruby
PoloniexRuby.sell( currency_pair, rate, amount )
```

### cancelOrder
```ruby
PoloniexRuby.cancel_order( currency_pair, order_number )
```

### moveOrder
```ruby
PoloniexRuby.move_order( order_number, rate )
```

### widthdraw
```ruby
PoloniexRuby.withdraw( currency, amount, address )
```

### returnAvailableAccountBalances
```ruby
PoloniexRuby.available_account_balances
```

### returnTradableBalances
```ruby
PoloniexRuby.tradable_balances
```

### transferBalance
```ruby
PoloniexRuby.transfer_balance( currency, amount, from_ccount, to_account )
```

### returnMarginAccountSummary
```ruby
PoloniexRuby.margin_account_summary
```

### marginBuy
```ruby
PoloniexRuby.margin_buy(currency_pair, rate, amount)
```

### marginSell
```ruby
PoloniexRuby.margin_sell(currency_pair, rate, amount)
```

### returnDepositAddresses
```ruby
PoloniexRuby.deposit_addresses
```

### generateNewAddress
```ruby
PoloniexRuby.generate_new_address( currency )
```

### returnDepositsWithdrawals
```ruby
PoloniexRuby.deposits_withdrawls( start = 0, end_time = Time.now.to_i )
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ntamvl/poloniex_ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Tam Nguyen](http://ntam.me/) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

