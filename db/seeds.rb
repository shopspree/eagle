# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# AudienceType :
# Public, Organization, Team, Only Me, Custom

# Categories:
# Project, Product, Offsite
Category.create(name: 'Project')
Category.create(name: 'Product')
Category.create(name: 'Offsite')
Category.create(name: 'Sales')
Category.create(name: 'CEO Office')
Category.create(name: 'Innovation')
Category.create(name: 'Human Resources and Employee Leisure')
