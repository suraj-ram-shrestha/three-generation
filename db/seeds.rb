# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

grandfather =
  RelationshipType.find_or_create_by_name! 'grandfather', reverse_name: 'grandson'
father =
  RelationshipType.find_or_create_by_name! 'father', reverse_name: 'son'

sanulal =
  User.find_or_create_by_name! 'Sanu Lal Shrestha'
rajaram =
  User.find_or_create_by_name! 'Raja Ram Shrestha'
suraj =
  User.find_or_create_by_name! 'Suraj Raj Shrestha'

sanulal.relate(rajaram, father)
rajaram.relate(suraj, father)
sanulal.relate(suraj, grandfather)