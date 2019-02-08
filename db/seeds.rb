# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u1 =User.create!(username: "pepe", password: "12345", screen_name: "pepe", email: "pepe@gmail.com")
u2 =User.create!(username: "popo", password: "12345", screen_name: "popo", email: "popo@hotmail.com")

u1.questions.create(title: "pepeQuestion", description: "pepeDescription")
u2.questions.create(title: "popoQuestion", description: "pepeDescription")