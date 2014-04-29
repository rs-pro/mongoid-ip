# coding: utf-8

require 'spec_helper'

describe Mongoid::Ip do
  it 'correctly stores data' do
    100.times do
      text = Faker::Internet.ip_v4_address
      c = Dummy.new(ip: text)
      c.ip.should eq text
      c.save.should be_true
      c.ip.should eq text
      c.read_attribute(:i).should eq IPAddr.new(text, Socket::AF_INET).to_i
      Dummy.find(c.id).ip.should eq text
    end
  end

  it 'correctly migrates data from string field' do
    text = Faker::Internet.ip_v4_address
    c = Dummy.new(migrate_test: text)
    c.save.should be_true
    Migrated.first.migrate_test.should eq text
  end

  it 'correctly looks up string in DB' do
    text = Faker::Internet.ip_v4_address
    c = Dummy.new(ip: text)
    c.ip.should eq text
    c.save.should be_true
    c.ip.should eq text

    f = Dummy.where(ip: text).first
    f.should_not be_nil
    f.ip.should eq text
  end
end