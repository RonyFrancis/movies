# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Movies

Movie.create!(name: 'ironman', description: 'suit')
Movie.create!(name: 'hulk', description: 'hulk smash')
Movie.create!(name: 'thor', description: 'hammer')
Movie.create!(name: 'captain america', description: 'shield')
Movie.create!(name: 'avenger', description: 'team')

User.create!(username: 'user1', password: '123456')
User.create!(username: 'user2', password: '123456')

Genre.create!(user_id: 1, movie_id: 1, description: 'scifi')
Genre.create!(user_id: 1, movie_id: 1, description: 'action')
Genre.create!(user_id: 2, movie_id: 2, description: 'monster')
Genre.create!(user_id: 2, movie_id: 3, description: 'gods')
Genre.create!(user_id: 2, movie_id: 4, description: 'war')
Genre.create!(user_id: 2, movie_id: 5, description: 'superhero')
