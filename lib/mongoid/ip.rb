require "mongoid/ip/version"
require "ipaddr"

module Mongoid
  class Ip
    def initialize(data)
      @data = data
    end

    def to_s
      @data.to_s
    end

    def inspect
      '"' + to_s + '"'
    end

    def ==(other)
      if other.class == self.class
        other.to_s == to_s
      elsif other.class == String
        @data == other
      else
        false
      end
    end

    def coerce(something)
      [self, something]
    end

    def mongoize
      IPAddr.new(@data, Socket::AF_INET).to_i
    end

    protected

    def method_missing(name, *args, &block)
      @data.send(name, *args, &block)
    end

    class << self

      # Get the object as it was stored in the database, and instantiate
      # this custom class from it.
      def demongoize(object)
        if object.is_a?(Mongoid::Ip)
          object.to_s
        elsif object.is_a?(Fixnum)
          IPAddr.new(object, Socket::AF_INET).to_s
        else
          object
        end
      end

      # Takes any possible object and converts it to how it would be
      # stored in the database.
      def mongoize(object)
        case
          when object.is_a?(Mongoid::Ip) then object.mongoize
          when object.is_a?(Fixnum) then object
          when object.is_a?(String) then Mongoid::Ip.new(object).mongoize
          else object
        end
      end

      # Converts the object that was supplied to a criteria and converts it
      # into a database friendly form.
      def evolve(object)
        case object
          when Mongoid::Ip then object.mongoize
          when Fixnum then object
          when String then Mongoid::Ip.new(object).mongoize
          else object
        end
      end
    end
  end
end

require "mongoid/ip/concern"

if Object.const_defined?("RailsAdmin")
  require "mongoid/ip/rails_admin"
end