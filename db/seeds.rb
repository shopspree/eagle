# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# AudienceType :
# Public, Organization, Team, Only Me, Custom

# Context:
# Global, [dynamic]
Context.create(name: Settings['context.global'])

# Category:
# Project, Product, Offsite
Category.create(name: 'Project')
Category.create(name: 'Product')
Category.create(name: 'Offsite')
Category.create(name: 'Sales')
Category.create(name: 'CEO Office')
Category.create(name: 'Innovation')
Category.create(name: 'Human Resources and Employee Leisure')

# GroupType
# Organization, Team
GroupType.create(name: 'Organization')
GroupType.create(name: 'Team')

# Organization & Domain
# whitelist
org = Organization.create(name: 'eBay')
org.domains << Domain.create(name: 'ebay.com',   blacklist: false)

org = Organization.create(name: 'Google')
org.domains << Domain.create(name: 'google.com', blacklist: false)

org =  Organization.create(name: 'Amdocs')
org.domains << Domain.create(name: 'amdocs.com', blacklist: false)

org =  Organization.create(name: 'CA')
org.domains << Domain.create(name: 'ca.com', blacklist: false)
org.domains << Domain.create(name: 'ca.contractor.com', blacklist: false)

# blacklist
Domain.create(name: 'gmail.com',  blacklist: true)
Domain.create(name: 'yahoo.com',  blacklist: true)
