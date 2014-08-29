# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(:name => 'tokiwa-photo', :corporation => "常磐写真", :owner => "荻巣", :email => "hoge@hoge.com", :password => "hogehoge", :password_confirmation => "hogehoge", :admin_flag => 1)