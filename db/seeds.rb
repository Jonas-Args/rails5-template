# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def save_ob obj
  if obj.save
  else
    puts "ERROR >>>>>>> #{obj.class.name} --> #{obj.errors.full_messages}"
  end
end

# NOTE: seed for populating car models
CarModel.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('car_models')
[
  { manufacturer: "Toyota", model:"Corolla"},
  { manufacturer: "Toyota", model:"Corolla iM"}
].each do |b|
  s = CarModel.new(b)
  save_ob(s)
end

# NOTE: seed for populating per payment models
Rate.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('rates')
[
  { per: "Hour", price:10},
  { per: "Day", price:240}
].each do |b|
  s = Rate.new(b)
  save_ob(s)
end
