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
  key_points: ["Etherium is one of the main trading currencies",
               "Cryptocurrency is a form of digital or virtual currency that uses cryptography for security.",
               "A blockchain is a public ledger that records all transactions made with a particular cryptocurrency.",
               "Bitcoin, created in 2009 by an anonymous person or group using the pseudonym Satoshi Nakamoto, was the first cryptocurrency and remains the most well-known and valuable. ",
               "Altcoins are cryptocurrencies other than Bitcoin."]
  key_questions: ["What is the Purpose and Use Case?",
                  "How Secure is the Cryptocurrency?",
                  "What is the Market and Price History?",
                  "Who is Behind the Cryptocurrency?",
                  "What is the Regulatory Environment?"]
)
puts "Created summary 1"

# Second Summary
Summary.create!(
  card: card_2.id,
  key_points: ["Pitch and Scales",
               "Rhythm and Time Signatures",
               "Chords and Harmony",
               "Musical Notation",
               "Form and Structure"]
  key_questions: ["What is Music Theory?",
                  "How Are Musical Notes Represented and Named?",
                  "What Are Scales and Why Are They Important?",
                  "How Do Chords and Harmony Work?",
                  "What Are Time Signatures, and How Do They Affect Rhythm?"]
)
puts "Created summary 2"

# Third Summary
Summary.create!(
  card: card_3.id,
  key_points:  ["Distance and Origin",
                "Training and Preparation",
                "Race Atmosphere",
                "Hydration and Nutrition",
                "Endurance Challenge"]
  key_questions: ["What Is the Standard Distance of a Marathon?",
                  "How Do I Prepare for a Marathon?",
                  "What Are Common Challenges During a Marathon?",
                  "What Is the Importance of Hydration and Nutrition in Marathons?",
                  "What Are Some Famous Marathons Around the World?"]
)
puts "Created summary 3"

# Fourth Summary
Summary.create!(
  card: card_4.id,
  key_points: ["Entertainment and Singing",
               "Social Activity",
               "Equipment",
               "Song Selection",
               "Performance and Confidence"]
  key_questions: ["What Is Karaoke?",
                  "Where Can You Do Karaoke?",
                  "How Does Karaoke Work?",
                  "What Are the Key Components of a Karaoke Setup?",
                  "Is Karaoke Just for Fun, or Can It Be Competitive?"]
)
puts "Created summary 4"

# Fifth Summary
Summary.create!(
  card: card_5.id,
  key_points: ["Coding Challenges and Katas",
               "Community and Rankings",
               "Language Support",
               "Learning and Skill Improvement",
               "Gamified Learning"]
  key_questions: ["What Is CodeWars and How Does It Work?",
                  "What Are CodeWars Katas?",
                  "How Can I Join and Participate in CodeWars?",
                  "How Can CodeWars Help Me Improve as a Programmer?",
                  "What Is the CodeWars Community Like, and How Can I Interact with Others?"]
)
puts "Created summary 5"

# Sixth Summary
Summary.create!(
  card: card_6.id,
  key_points: ["Scoring System",
               "Court and Equipment",
               "Serving and Rallying",
               "Scoring a Point",
               "Tournaments and Rankings"]
  key_questions: ["How is Tennis Scored, and What is the Meaning of "Deuce" and "Advantage"?",
                  "What Are the Basic Rules for Serving in Tennis?",
                  "What Are the Four Grand Slam Tournaments in Tennis, and Why Are They So Important?",
                  "How Does the Tennis Ranking System Work, and What Role Does It Play in Professional Tennis?",
                  "What Are Some Famous Tennis Rivalries and Moments in Tennis History?"]
)
puts "Created summary 6"

Summary.create!(
  card: card_6.id,
  key_points: [
    "Unique Scoring System: Tennis uses a scoring system where points are awarded as 15, 30, 40, and then the game point. Deuce occurs at 40-40, and a player must win two consecutive points to win the game.",
    "Court and Equipment: Tennis is played on a rectangular court with a net in the middle. Players use a racket to hit a ball over the net into the opponent's court.",
    "Serving and Rallying: Matches begin with a serve, and players take turns hitting the ball back and forth in rallies, aiming to keep the ball in play.",
    "Scoring a Point: Points are earned based on the outcome of each rally. A player wins the game by reaching 40 points and being ahead by at least two points.",
    "Tournaments and Rankings: Tennis is played at various levels, from casual matches to prestigious tournaments like Wimbledon. Players earn ranking points that determine their positions in the tennis world."
]

  key_questions: [
    "How is Tennis Scored, and What Does 'Love' Mean in Tennis Scoring?",
    "What Are the Different Types of Tennis Courts, and How Do They Affect Gameplay?",
    "What Are the Four Major Grand Slam Tournaments, and What Makes Each of Them Unique?",
    "How Does Tie-Break Scoring Work in Tennis, and When Is It Used?",
    "What Are Some of the Most Famous Tennis Players in History, and What Are Their Achievements?"
]

)
puts "Created summary 7"
