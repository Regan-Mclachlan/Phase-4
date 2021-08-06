# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin = Group.find_or_create_by(group_type:"Admin")
Standard = Group.find_or_create_by(group_type:"Standard")
Everyone = Group.find_or_create_by(group_type:"Everyone")