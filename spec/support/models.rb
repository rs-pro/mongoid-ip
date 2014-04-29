class Dummy
  include Mongoid::Document

  include StoreIp
  field :i1, type: Mongoid::Ip
  field :migrate_test, type: String
end

class Migrated
  include Mongoid::Document
  store_in collection: 'dummies'
  field :migrate_test, type: Mongoid::Ip
end