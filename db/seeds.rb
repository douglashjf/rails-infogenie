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
Card.destroy_all
Summary.destroy_all

# Create data

puts "Creating new data"

# Creating six users, cards and summaries.
first_name = %w[ Zong Yong]
last_name = %w[ Yang Han Cheng]
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

# First User
user_jacob = User.create(
  first_name: "Jacob",
  last_name: "Khong",
  email: "jacob@gmail.com",
  password: "password"
)
puts "Created Jacob Khong"

# Second User
user_doug = User.create(
  first_name: "Douglas",
  last_name: "Hsu",
  email: "doug@gmail.com",
  password: "password"
)
puts "Created Douglas Hsu"

# Third User
user_sean = User.create(
  first_name: "Sean",
  last_name: "Wong",
  email: "sean@gmail.com",
  password: "password"
)
puts "Created Sean Wong"

# Fourth User
user_yiyang = User.create(
  first_name: "Yi",
  last_name: "Yang",
  email: "yiyang@gmail.com",
  password: "password"
)
puts "Created Yi Yang"

# Fifth User
user_yc = User.create(
  first_name: "Yong",
  last_name: "Cheng",
  email: "yongcheng@gmail.com",
  password: "password"
)
puts "Created YC"

# Sixth User
user_zonghan = User.create(
  first_name: "Zong",
  last_name: "Han",
  email: "zonghan@gmail.com",
  password: "password"
)
puts "Created Zong Han"

# First Card
card_1 = Card.create!(
  user_id: user_zonghan.id,
  primary_keywords: "Crypto",
  secondary_keywords: "Currency"
)
puts "Created card 1"

# Second Card
card_2 = Card.create!(
  user_id: user_doug.id,
  primary_keywords: "Music",
  secondary_keywords: "Theory"
)
puts "Created card 2"

# Third Card
card_3 = Card.create!(
  user_id: user_doug.id,
  primary_keywords: "Marathon",
  secondary_keywords: "Race"
)
puts "Created card 3"

# Fourth Card
card_4 = Card.create!(
  user_id: user_jacob.id,
  primary_keywords: "Karaoke",
  secondary_keywords: "Singing"
)
puts "Created card 4"

# Fifth Card
card_5 = Card.create!(
  user_id: user_sean.id,
  primary_keywords: "Code",
  secondary_keywords: "Wars"
)
puts "Created card 5"

# Sixth Card
card_6 = Card.create!(
  user_id: user_jacob.id,
  primary_keywords: "Sports",
  secondary_keywords: "Tennis"
)
puts "Created card 6"

# First Summary
Summary.create!(
  card_id: card_1.id,
  key_points: "Etherium is one of the main trading currencies",
  key_questions: "What is the lowest price ethereum can go?"
)
puts "Created summary 1"

# Second Summary
Summary.create!(
  card: card_2.id,
  key_points: "Grade 5 music theory is compulsory to go higher",
  key_questions: "What is the highest music theory grade?"
)
puts "Created summary 2"

# Third Summary
Summary.create!(
  card: card_3.id,
  key_points:  "42km is the distance of the full marathon",
  key_questions: "What is the history of marathon?"
)
puts "Created summary 3"

# Fourth Summary
Summary.create!(
  card: card_4.id,
  key_points: "Very common way to de-stress",
  key_questions: "What is the most common place for karaoke?"
)
puts "Created summary 4"

# Fifth Summary
Summary.create!(
  card: card_5.id,
  key_points: "Very good to improve coding skills",
  key_questions: "What is the most common language in coding?"
)
puts "Created summary 5"

# Sixth Summary
Summary.create!(
  card: card_6.id,
  key_points: "There are 8 levels of coding",
  key_questions: "What is the different languages they have?"
)
puts "Created summary 6"
