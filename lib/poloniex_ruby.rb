require "poloniex_ruby/version"

require 'rest-client'
require 'openssl'
require 'addressable/uri'
require "deep_symbolize"
require 'configuration'

module PoloniexRuby

  def self.get_all_daily_exchange_rates( currency_pair )
    res = get 'returnChartData', currencyPair: currency_pair, period: 86400,  start: 0, :end => Time.now.to_i
    res_hash res
  end

  def self.ticker
    res = get 'returnTicker'
    res_hash res
  end

  def self.volume
    res = get 'return24hVolume'
    res_hash res
  end

  def self.order_book( currency_pair )
    res = get 'returnOrderBook', currencyPair: currency_pair
    res_hash res
  end

  def self.active_loans
    res = post 'returnActiveLoans'
    res_hash res
  end

  def self.balances
    res = post 'returnBalances'
    res_hash res
  end

  def self.lending_history( start = 0, end_time = Time.now.to_i )
    res = post 'returnLendingHistory', start: start, :end => end_time
    res_hash res
  end

  def self.currencies
    res = get 'returnCurrencies'
    res_hash res
  end

  def self.complete_balances
    res = post 'returnCompleteBalances'
    res_hash res
  end

  def self.open_orders( currency_pair )
    res = post 'returnOpenOrders', currencyPair: currency_pair
    res_hash res
  end

  def self.trade_history( currency_pair, start = 0, end_time = Time.now.to_i )
    res = post 'returnTradeHistory', currencyPair: currency_pair, start: start, :end => end_time
    res_hash res
  end

  def self.buy( currency_pair, rate, amount )
    res = post 'buy', currencyPair: currency_pair, rate: rate, amount: amount
    res_hash res
  end

  def self.sell( currency_pair, rate, amount )
    res = post 'sell', currencyPair: currency_pair, rate: rate, amount: amount
    res_hash res
  end

  def self.cancel_order( currency_pair, order_number )
    res = post 'cancelOrder', currencyPair: currency_pair, orderNumber: order_number
    res_hash res
  end

  def self.move_order( order_number, rate )
    res = post 'moveOrder', orderNumber: order_number, rate: rate
    res_hash res
  end

  def self.withdraw( currency, amount, address )
    res = post 'widthdraw', currency: currency, amount: amount, address: address
    res_hash res
  end

  def self.available_account_balances
    res = post 'returnAvailableAccountBalances'
    res_hash res
  end

  def self.tradable_balances
    res = post 'returnTradableBalances'
    res_hash res
  end

  def self.transfer_balance( currency, amount, from_ccount, to_account )
    res = post 'transferBalance', currency: currency, amount: amount, fromAccount: from_ccount, toAccount: to_account
    res_hash res
  end

  def self.margin_account_summary
    res = post 'returnMarginAccountSummary'
    res_hash res
  end

  def self.margin_buy(currency_pair, rate, amount)
    res = post 'marginBuy', currencyPair: currency_pair, rate: rate, amount: amount
    res_hash res
  end

  def self.margin_sell(currency_pair, rate, amount)
    res = post 'marginSell', currencyPair: currency_pair, rate: rate, amount: amount
    res_hash res
  end

  def self.deposit_addresses
    res = post 'returnDepositAddresses'
    res_hash res
  end

  def self.generate_new_address( currency )
    res = post 'generateNewAddress', currency: currency
    res_hash res
  end

  def self.deposits_withdrawls( start = 0, end_time = Time.now.to_i )
    res = post 'returnDepositsWithdrawals', start: start, :end => end_time
    res_hash res
  end

  protected

  def self.resource
    @@resouce ||= RestClient::Resource.new( 'https://www.poloniex.com' )
  end

  def self.get( command, params = {} )
    params[:command] = command
    resource[ 'public' ].get params: params
  end

  def self.post( command, params = {} )
    params[:command] = command
    params[:nonce]   = (Time.now.to_f * 10000000).to_i
    resource[ 'tradingApi' ].post params, { Key: configuration.key , Sign: create_sign( params ) }
  end

  def self.create_sign( data )
    encoded_data = Addressable::URI.form_encode( data )
    OpenSSL::HMAC.hexdigest( 'sha512', configuration.secret , encoded_data )
  end

  def self.res_hash(res)
    data = JSON.parse(res.body)
    data.extend DeepSymbolizable
    return { data: data.deep_symbolize, res: res }
  end
end
