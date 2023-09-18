puts "Clearing old data"

Favourite.destroy_all
Summary.destroy_all
Card.destroy_all
User.destroy_all

# Create data

puts "Creating new data"

# Create all users
user_doug = User.create!(
  first_name: "Doug",
  last_name: "Hsu",
  email: "doug@gmail.com",
  password: "password"
)
puts "Created Doug 2 cards 2 favourites (1 card from deleted user Sean)"

user_jacob = User.create!(
  first_name: "Jacob",
  last_name: "Khong",
  email: "jacob@gmail.com",
  password: "password"
)
puts "Created Jacob 2 cards (deleted his own marathon card)"

user_sean = User.create(
  first_name: 'Sean',
  last_name: 'Seanson',
  email: 'sean@gmail.com',
  password: 'password',
  # deleted_at: Time.current
)
puts 'Created Sean user (soft delete), 1 card'


# Card 1
card_1 = Card.create!(
  user_id: user_doug.id,
  primary_keywords: "Cryptocurrency",
  secondary_keywords: "Trading"
)
puts "Created card 1"

# Summary 1
Summary.create!(
  card_id: card_1.id,
  key_points: ["Etherium is one of the main trading currencies",
               "Cryptocurrency is a form of digital or virtual currency that uses cryptography for security.",
               "A blockchain is a public ledger that records all transactions made with a particular cryptocurrency.",
               "Bitcoin, created in 2009 by an anonymous person or group using the pseudonym Satoshi Nakamoto, was the first cryptocurrency and remains the most well-known and valuable. ",
               "Altcoins are cryptocurrencies other than Bitcoin."],
  key_questions: ["What is the Purpose and Use Case?",
                  "How Secure is the Cryptocurrency?",
                  "What is the Market and Price History?",
                  "Who is Behind the Cryptocurrency?",
                  "What is the Regulatory Environment?"]
)
puts "Created summary 1"

# Second Card
card_2 = Card.create!(
  user_id: user_doug.id,
  primary_keywords: "Music",
  secondary_keywords: "Theory"
)
puts "Created card 2"

# Second Summary
Summary.create!(
  card_id: card_2.id,
  key_points: ["Pitch and Scales",
               "Rhythm and Time Signatures",
               "Chords and Harmony",
               "Musical Notation",
               "Form and Structure"],
  key_questions: ["What is Music Theory?",
                  "How Are Musical Notes Represented and Named?",
                  "What Are Scales and Why Are They Important?",
                  "How Do Chords and Harmony Work?",
                  "What Are Time Signatures, and How Do They Affect Rhythm?"]
)
puts "Created summary 2"

# Third Card
card_3 = Card.create!(
  user_id: user_jacob.id,

  primary_keywords: "Marathon",
  secondary_keywords: "Race"
)
puts "Created card 3"

Summary.create!(
  card_id: card_3.id,
  key_points:   ["Distance and Origin",
                "Training and Preparation",
                "Race Atmosphere",
                "Hydration and Nutrition",
                "Endurance Challenge"],
  key_questions: ["What Is the Standard Distance of a Marathon?",
                  "How Do I Prepare for a Marathon?",
                  "What Are Common Challenges During a Marathon?",
                  "What Is the Importance of Hydration and Nutrition in Marathons?",
                  "What Are Some Famous Marathons Around the World?"]
)
puts "Created summary 3"

# Fourth Card
card_4 = Card.create!(
  user_id: user_jacob.id,
  primary_keywords: "Karaoke",
  secondary_keywords: "Singing",
  deleted_at: Time.current
)
puts "Created card 4"

Summary.create!(
  card_id: card_4.id,
  key_points: ["Entertainment and Singing",
               "Social Activity",
               "Equipment",
               "Song Selection",
               "Performance and Confidence"],
  key_questions: ["What Is Karaoke?",
                  "Where Can You Do Karaoke?",
                  "How Does Karaoke Work?",
                  "What Are the Key Components of a Karaoke Setup?",
                  "Is Karaoke Just for Fun, or Can It Be Competitive?"]
)
puts "Created summary 4"

# Fifth Card
card_5 = Card.create!(
  user_id: user_sean.id,
  primary_keywords: "Code",
  secondary_keywords: "Wars"
)
puts "Created card 5"

Summary.create!(
  card_id: card_5.id,
  key_points: ["Coding Challenges and Katas",
               "Community and Rankings",
               "Language Support",
               "Learning and Skill Improvement",
               "Gamified Learning"],
  key_questions: ["What Is CodeWars and How Does It Work?",
                  "What Are CodeWars Katas?",
                  "How Can I Join and Participate in CodeWars?",
                  "How Can CodeWars Help Me Improve as a Programmer?",
                  "What Is the CodeWars Community Like, and How Can I Interact with Others?"]
)
puts "Created summary 5"

# Create favourites for Doug (1x existing, 1x deleted)

# Existing
Favourite.create!(
  user_id: user_doug.id,
  card_id: card_3.id
)

# deleted card
Favourite.create!(
  user_id: user_doug.id,
  card_id: card_4.id
)

# deleted user
Favourite.create!(
  user_id: user_doug.id,
  card_id: card_5.id
)
