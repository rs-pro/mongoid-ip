# Mongoid::Ip

[![Build Status](https://travis-ci.org/rs-pro/mongoid-ip.svg)](https://travis-ci.org/rs-pro/mongoid-ip)
[![Gem Version](https://badge.fury.io/rb/mongoid-ip.svg)](http://badge.fury.io/rb/mongoid-ip)

Storing IP in MongoDB done right - as integers

## Installation

Add this line to your application's Gemfile:

    gem 'mongoid-ip'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mongoid-ip

## Usage

Do:

    field :ip, type: Mongoid::Ip
    
And than just use it as you would a regular text string (only change is sort order). 

## Contributing

1. Fork it ( http://github.com/<my-github-username>/mongoid-ip/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
