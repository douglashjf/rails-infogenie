# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Clear data

puts "Clearing old data"

User.destroy_all
Card.Destroy_all
Summary.Destroy_all

# Create data

puts "Creating new data"

# Creating six users, cards and summaries.
first_name = %w[Jacob Douglas Sean Yi Zong Yong]
last_name = %w[Khong Hsu Wong Yang Han Cheng]
primary_keywords = %w[Crypto Music Marathon Karaoke Code]
secondary_keywords = %w[Currency Theory Race Singing Wars]
key_points = %W["Etherium is one of the main trading currencies"
                 "Grade 5 music theory is compulsory to go higher"
                  "42km is the distance of the full marathon"
                   "Very common way to de-stress"
                    "Very good to improve coding skills"]
key_questions = %W["What is the lowest price ethereum can go?"
                   "What is the highest music theory grade?"
                    "What is the history of marathon?"
                     "What is the most common place for karaoke?"
                      "What is the most common language in coding?"]

# Initialize the iteration variable
i = 0

6.times do
  User.create!(
    first_name: first_name[i],
    last_name: last_name[i],
    email: "#{first_name[i].downcase}@gmail.com",
    password: "password"
  )
  puts "Created #{first_name[i]} #{last_name[i]}."

  Card.create!(
    user: User.all[i],
    primary_keywords: primary_keywords[i],
    secondary_keywords: secondary_keywords[i]
  )
  puts "Created card No. #{i + 1}."

  Summary.create!(
    card: Card.all[i],
    key_points: key_points[i],
    key_questions: key_questions[i]
  )
  puts "Created summary No. #{i + 1}."

  i += 1
end
