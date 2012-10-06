# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create username: 'admin', email: 'admin@mobeelity.com', password: 'pass.1', password_confirmation: 'pass.1'
Product.create upc: "4800047860010", description: "Green Cross Isopropyl Alcohol 40% Solution", size: "500mL", liquid: true
Product.create upc: "4803925270116", description: "Lipton Red Tea", size: "450mL", liquid: true
