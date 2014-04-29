
module StoreIp
  extend ActiveSupport::Concern
  included do
    field :i, as: :ip, type: Mongoid::Ip
  end
end

