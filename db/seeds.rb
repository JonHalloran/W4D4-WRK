# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times { Band.create!(name: Faker::VentureBros.character) }
50.times { Album.create!(
                         title: Faker::Book.title,
                         year: rand(30) + 1980,
                         band_id: [*1..10].sample,
                         recording_type: %w(live studio).sample
)
}
