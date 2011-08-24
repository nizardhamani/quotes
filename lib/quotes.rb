require 'json'
require 'open-uri'

module Quotes
  
  # Yahoo API endpoint
  ENDPOINT = "http://query.yahooapis.com/v1/public/yql?q="
  
  def self.get(*symbols)
    if symbols.length == 0 || symbols.include?("")
      raise ArgumentError, "Enter symbol(s). Example: Quote.get(\"AAPL\")"
    end
    
    syms = symbols.map{|s| "\"#{s}\""}.join(", ")
    url = ENDPOINT + URI.escape("select * from yahoo.finance.quotes where symbol in (#{syms})") + "&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback="
    resp = ''
    open(url) do |f|
      resp = f.read
    end
    
    info = JSON.parse(resp)['query']['results']['quote']
    
    # returns a hash containing the ticker symbols as keys
    if symbols.length == 1
      quote = {}
      quote[info['symbol']] = Quote.new(info)
      return quote
    else
      quotes = {}
      info.each_with_index do |q, i|
        data = info[i]
        quotes[data['symbol']] = Quote.new(data)
      end
      return quotes
    end
  end
  
  class Quote
    
    def initialize(data)
      data.each do |k, v|
        self.class.class_eval do
          define_method("#{k.downcase}") { v }
        end
      end
    end
    
  end
  
end
