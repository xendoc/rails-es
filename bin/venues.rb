# -*- encoding: utf-8 -*-
require 'csv'


cnt = 0
ActiveRecord::Base.transaction do
  CSV.foreach("tmp/venues.csv").each do |row|
    cnt += 1
    v = Venue.new
    v.name = row[0]
    v.kana = row[1].to_s.empty? ? nil : row[1].to_s
    v.lat = row[2]
    v.lng = row[3]
    v.category = row[4].to_i == 0 ? nil : row[4].to_i
    v.has_coupon = row[5]

    v.save!
    puts cnt if cnt % 1000 == 0
  end
end