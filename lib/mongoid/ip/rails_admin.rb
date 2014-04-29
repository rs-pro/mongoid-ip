
require 'rails_admin/adapters/mongoid'
begin
  require 'rails_admin/adapters/mongoid/property'
rescue Exception => e 
end

module RailsAdmin
  module Adapters
    module Mongoid
      class Property
        alias_method :type_without_mongoid_ip, :type
        def type
          if property.type.to_s == 'Mongoid::Ip'
            :mongoid_ip
          else
            type_without_mongoid_ip
          end
        end
      end
    end
  end
end

require 'rails_admin/config/fields/types/text'
module RailsAdmin
  module Config
    module Fields
      module Types
        class MongoidIp < RailsAdmin::Config::Fields::Types::Text
          # Register field type for the type loader
          RailsAdmin::Config::Fields::Types::register(self)

          register_instance_option :pretty_value do
            if value.respond_to?(:data)
              IPAddr.new(value.data, Socket::AF_INET).to_s
            else
              value
            end
          end

          register_instance_option :formatted_value do
            if value.respond_to?(:data)
              IPAddr.new(value.data, Socket::AF_INET).to_s
            else
              value
            end
          end
        end
      end
    end
  end
end
