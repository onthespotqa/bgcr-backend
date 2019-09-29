# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

require 'csv'
gurus_file = File.read(Rails.root.join('lib', 'seeds', 'gurus.csv'))
csv = CSV.new(gurus_file, :headers => true, :header_converters => :symbol, :converters => :all, :skip_blanks => true)
gurus = csv.to_a.map { |row| row.to_hash }

gurus.each do |g|
  group = g[:group] ? g[:group] : "6"
  Guru.create!(blog: g[:blog], undertone: [g[:undertone]], skin: [g[:skin]], group: group)
end


foundations_file = File.read(Rails.root.join('lib', 'seeds', 'foundations.csv'))
csv = CSV.new(foundations_file, :headers => true, :converters => :all, :skip_blanks => true)
foundations = csv.to_a.map { |row| row.to_hash }

foundations.each do |f|
  g = Guru.find_by_blog(f['blog'])
  guru_group = g.group
  f.delete('blog')
  f.compact.each do |key, value|
    g.foundations.create!(brand: key, shade: value, group: guru_group)
  end
end
