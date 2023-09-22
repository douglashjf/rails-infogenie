puts "Clearing old data"

UserCategory.destroy_all
CardCategory.destroy_all
Category.destroy_all
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
puts "Created Doug 2 cards 2 favourites (1 card deleted by Jacob)"

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
  password: 'password'
)
puts 'Created Sean user, 1 card'


# Card 1
card_1 = Card.create!(
  user_id: user_doug.id,
  primary_keywords: "Cryptocurrency",
  secondary_keywords: "Trading",
  categories: []
)
puts "Created card 1"

# Summary 1
Summary.create!(
  card_id: card_1.id,
  key_points: [
    "Cryptocurrency is a digital or virtual form of currency that uses cryptography for secure financial transactions and control the creation of new units.",
    "Trading is one of the activities associated with cryptocurrency, where individuals buy and sell digital assets in various markets."
  ],
  key_questions: [
    "What is cryptocurrency and how does it work?",
    "How does trading in cryptocurrency function and what are the risks involved?"
  ]
)
puts "Created summary 1"

# Second Card
card_2 = Card.create!(
  user_id: user_doug.id,
  primary_keywords: "Music",
  secondary_keywords: "Theory",
  categories: []
)
puts "Created card 2"

# Second Summary
Summary.create!(
  card_id: card_2.id,
  key_points: [
    "Music is an art form that uses sound and rhythm to express emotions, tell stories, and evoke certain moods.",
    "Music theory is the study of the principles and practices of music, including elements like melody, harmony, rhythm, and form."
  ],
  key_questions: [
    "What is the purpose of music and how does it communicate emotions?",
    "What are the key components studied in music theory and how do they contribute to musical composition?"
  ]
)
puts "Created summary 2"

# Third Card
card_3 = Card.create!(
  user_id: user_jacob.id,
  primary_keywords: "Running",
  secondary_keywords: "Marathon Diet",
  categories: []
)
puts "Created card 3"

Summary.create!(
  card_id: card_3.id,
  key_points: [
    "Running is a physical activity that involves the movement of the body at a faster pace than walking.",
    "Marathon diet refers to the nutritional plan followed by runners in preparation for a marathon race."],
  key_questions: [
    "What is the definition of running and how does it differ from walking?",
    "What is a marathon diet and how does it support the training and performance of marathon runners?"
  ],
)
puts "Created summary 3"

# Fourth Card
card_4 = Card.create!(
  user_id: user_jacob.id,
  primary_keywords: "Karaoke",
  secondary_keywords: "Singing",
  categories: [],
  deleted_at: Time.current
)
puts "Created card 4"

Summary.create!(
  card_id: card_4.id,
  key_points: [
    "Karaoke is a form of entertainment where people sing along to recorded music without the original vocals.",
    "Singing is the act of producing musical sounds with the voice, typically with words and melody."
  ],
  key_questions: [
    "What is karaoke and how does it work?",
    "What is the role of singing in karaoke and how does it enhance the overall experience?"
  ]
)
puts "Created summary 4"

# Fifth Card
card_5 = Card.create!(
  user_id: user_sean.id,
  primary_keywords: "Coding",
  secondary_keywords: "Bootcamp",
  categories: []
)
puts "Created card 5"

Summary.create!(
  card_id: card_5.id,
  key_points: [
    "Coding refers to the process of writing instructions in a programming language to create software applications or websites",
    "Bootcamps are intensive training programs that teach coding skills in a short period of time"
  ],
  key_questions: [
    "What is the purpose of coding?",
    "How do bootcamps help in learning coding?"
  ]
)
puts "Created summary 5"

card_6 = Card.create!(
  user_id: user_sean.id,
  primary_keywords: "Artificial Intelligence",
  secondary_keywords: "Machine Learning",
  categories: []
)
puts "Created card 5"

Summary.create!(
  card_id: card_6.id,
  key_points: [
    "Artificial Intelligence (AI) is a field of computer science that focuses on creating intelligent machines capable of performing tasks that typically require human intelligence",
    "Machine Learning is a subset of AI that involves training machines to learn from data and make predictions or decisions without being explicitly programmed"
  ],
  key_questions: [
    "What is Artificial Intelligence?",
    "How does Machine Learning work?"
  ]
)
puts "Created summary 6"

card_7 = Card.create!(
  user_id: user_sean.id,
  primary_keywords: "Data Science",
  secondary_keywords: "Big Data",
  categories: []
)
puts "Created card 7"

Summary.create!(
  card_id: card_7.id,
  key_points: [
    "Data Science is a multidisciplinary field that uses scientific methods, algorithms, and systems to extract knowledge and insights from structured and unstructured data",
    "Big Data refers to extremely large and complex datasets that cannot be easily managed, processed, or analyzed using traditional data processing applications"
  ],
  key_questions: [
    "What is Data Science?",
    "How is Big Data used in Data Science?"
  ]
)
puts "Created summary 7"

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

# Create Fixed Categories based on list
TAG = %w[ Life Health Relationships Self Improvement Productivity Mindfulness Work Technology Blockchain Data Science Software Development Media Art Gaming Society Economics Education Equality Culture Philosophy Religion Spirituality World Nature Travel ]

TAG.each do |category|
  Category.create!(tag: category)
  puts "Created #{category}"
end
