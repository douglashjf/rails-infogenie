puts "Clearing old data"

Comment.destroy_all
NewsArticle.destroy_all
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
jack_avatar = URI.open("https://i.seadn.io/gcs/files/ea1a6648d854220815cf1425079e915b.png?w=500&auto=format")
user_jack = User.create!(
  first_name: "Jack",
  last_name: "Khong",
  email: "jackinfogenie@gmail.com",
  password: "password"
)
user_jack.photo.attach(io: jack_avatar, filename: "jack_avatar.jpg", content_type: "image/jpg")
user_jack.save!

puts "Created jack (with avatar) 2 cards 2 favourites (1 card deleted by Jacob)"

jacob_avatar = URI.open("https://pbs.twimg.com/media/Ftq4k41WIAYadtY?format=jpg&name=large")
user_jacob = User.create!(
  first_name: "Jacob",
  last_name: "Khong",
  email: "jacobkhongdev@gmail.com",
  password: "password"
)
user_jacob.photo.attach(io: jacob_avatar, filename: "jacob_avatar.png", content_type: "image/png")
user_jacob.save!
puts "Created Jacob (with avatar) 2 cards (deleted his own marathon card)"

sean_avatar = URI.open("https://i.seadn.io/gcs/files/26d28aa6f8cb427f538ab98cd538d137.png?auto=format&dpr=1&w=1000")
user_sean = User.create(
  first_name: 'Sean',
  last_name: 'Seanson',
  email: 'sean@gmail.com',
  password: 'password'
)
user_sean.photo.attach(io: sean_avatar, filename: "sean_avatar.png", content_type: "image/png")
user_sean.save!
puts 'Created Sean (with avatar) user, 1 card'

doug_avatar = URI.open("https://media.licdn.com/dms/image/C4D03AQFdMFIAV-alKQ/profile-displayphoto-shrink_400_400/0/1606904491217?e=1701907200&v=beta&t=2rTcS6JL7DCZS9wWb_2qK1hbJnDiD02HJn9cWTSV2xQ")
user_doug = User.create(
  first_name: 'Doug',
  last_name: 'sally',
  email: 'dougie@skiff.com',
  password: 'password'
)
user_doug.photo.attach(io: doug_avatar, filename: "doug_avatar.png", content_type: "image/png")
user_doug.save!
puts 'Created doug (with avatar) user, 1 card'

sally_avatar = URI.open("https://openseauserdata.com/files/f826e047bb394a2ceb3be4d3f1ffc5fb.png")
user_sally = User.create(
  first_name: 'Sally',
  last_name: 'sally',
  email: 'sally@gmail.com',
  password: 'password'
)
user_sally.photo.attach(io: sally_avatar, filename: "sally_avatar.png", content_type: "image/png")
user_sally.save!
puts 'Created Sally (with avatar) user, 1 card'

# Create Fixed Categories based on list
TAG = %w[ Life Health Relationships Self Improvement Productivity Mindfulness Work Technology Blockchain Data Science Software Development Media Art Gaming Society Economics Education Equality Culture Philosophy Religion Spirituality World Nature Travel ]

TAG.each do |category|
  Category.create!(tag: category)
  puts "Created #{category}"
  # # Find the "Technology" category by name
  # technology_category = Category.find_by(tag: "Technology")
  # # Update the categories attribute of Card 1
  # card_1.categories << technology_category if technology_category
end

category_names = TAG

# Initialize an array to store the actual Category objects
categories_for_card = []


# Find or create categories and add them to the array
category_names.each do |category_name|
  category = Category.find_or_create_by(tag: category_name)
  categories_for_card << category
end


# Card 1
card_1 = Card.create!(
  user_id: user_jack.id,
  primary_keywords: "Cryptocurrency",
  secondary_keywords: "Trading",
  image_url: "https://res.cloudinary.com/ddvj6niez/image/upload/v1696301799/DALL_E_2023-10-03_10.53.02_-_Mondrian-style_realistic_painting_of_cryptocurrency_with_additional_context_of_trading._vvnppu.png",
  categories: [categories_for_card[8], categories_for_card[9]]
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
  user_id: user_sean.id,
  primary_keywords: "Internet of Things",
  secondary_keywords: "career trends",
  image_url: "https://res.cloudinary.com/ddvj6niez/image/upload/v1696753888/e6jl2lassorhdnl94vhl.png",
  categories: [categories_for_card[8], categories_for_card[4], categories_for_card[5]]
)
puts "Created card 2"

# Second Summary
Summary.create!(
  card_id: card_2.id,
  key_points: [
    "Internet of Things (IoT) refers to the network of physical devices, vehicles, appliances, and other objects embedded with sensors, software, and connectivity, enabling them to collect and exchange data.",
    "Career trends in IoT show a growing demand for professionals with expertise in hardware and software development, data analytics, cybersecurity, and cloud computing.",
    "The widespread adoption of IoT technologies has the potential to revolutionize industries such as healthcare, manufacturing, transportation, and agriculture."
  ],
  key_questions: ["Are there any governmental regulations or policies that have a significant impact on the IoT industry and how do you foresee these regulations evolving and shaping the industry in the near future?",
    "With the rapid advancements in connectivity and data processing capabilities, how do you see emerging technologies such as 5G, edge computing, or artificial intelligence impacting the IoT industry? ",
    "Are there any specific technology trends that you believe will have a transformative effect on IoT implementations?"
  ]
)
puts "Created summary 2"

# Third Card
card_3 = Card.create!(
  user_id: user_jack.id,
  primary_keywords: "Machine Learning",
  secondary_keywords: "Regression",
  image_url: "https://res.cloudinary.com/ddvj6niez/image/upload/v1696661660/rrvwor814kjujjd8rbhe.png",
  categories: [categories_for_card[8], categories_for_card[10], categories_for_card[12]]
)
puts "Created card 3"

Summary.create!(
  card_id: card_3.id,
  key_points: [
    "Machine Learning is a field of study in data science that focuses on developing algorithms and models to enable computers to learn and make predictions or decisions without being explicitly programmed.",
    "Regression is a statistical technique used in machine learning to predict numerical values based on input variables.",
    "Machine learning algorithms analyze large amounts of data to identify patterns and relationships, which can then be used to make accurate predictions or decisions."],
  key_questions: [
    "What is the role of Machine Learning in data science?",
    "How does regression help in modeling relationships between variables?",
    "What are some real-world applications of Machine Learning and Regression?"  ],
)
puts "Created summary 3"

# Fourth Card
card_4 = Card.create!(
  user_id: user_jack.id,
  primary_keywords: "Startup Funding",
  secondary_keywords: "Venture Capital",
  image_url: "https://res.cloudinary.com/ddvj6niez/image/upload/v1696662806/trwf1yf06xkh5qlqazs0.png",
  categories: [categories_for_card[5], categories_for_card[7]]
)

Summary.create!(
  card_id: card_4.id,
  key_points: [
    "Startup funding is the process of raising capital to finance the growth of a new business.",
    "Venture capital is a type of investment that provides funding to startups in exchange for equity.",
    "Pitching to investors is a crucial step in securing startup funding."
  ],
  key_questions: [
    "What are the various sources of startup funding?",
    "How does venture capital differ from other funding options?",
    "What should entrepreneurs include in their pitch to attract investors?"
  ]
)
puts "Created summary 4"

# Fifth Card
card_5 = Card.create!(
  user_id: user_sally.id,
  primary_keywords: "Coding",
  secondary_keywords: "Bootcamp",
  image_url: "https://res.cloudinary.com/ddvj6niez/image/upload/v1696301798/DALL_E_2023-10-03_10.55.23_-_Mondrian-style_realistic_painting_of_coding_with_additional_context_of_bootcamp_vmloc8.png",
  categories: [categories_for_card[11], categories_for_card[7]]
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
  user_id: user_sally.id,
  primary_keywords: "Artificial Intelligence",
  secondary_keywords: "Machine Learning",
  image_url: "https://res.cloudinary.com/ddvj6niez/image/upload/v1696301969/DALL_E_2023-10-03_10.57.50_-_Mondrian-style_realistic_painting_of_artificial_intelligence_with_additional_context_of_machine_learning_p9sweq.png",
  categories: [categories_for_card[8], categories_for_card[10]]
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
  image_url: "https://res.cloudinary.com/ddvj6niez/image/upload/v1696301798/DALL_E_2023-10-03_10.56.04_-_Mondrian-style_realistic_painting_of_data_science_with_additional_context_of_big_data_yp1h7h.png",
  categories: [categories_for_card[10], categories_for_card[8]]
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

card_8 = Card.create!(
  user_id: user_jack.id,
  primary_keywords: "Business Strategy",
  secondary_keywords: "Market Analysis",
  image_url: "https://res.cloudinary.com/ddvj6niez/image/upload/v1696662992/yzfduutfcgsdlno4xnse.png",
  categories: [categories_for_card[7], categories_for_card[18]]
)

Summary.create!(
  card_id: card_8.id,
  key_points: [
    "Business strategy involves planning and decision-making to achieve long-term goals and objectives.",
    "Market analysis is the process of evaluating market trends, competition, and consumer behavior.",
    "A SWOT analysis is a valuable tool for assessing a company's business strategy."
  ],
  key_questions: [
    "How can a well-defined business strategy contribute to a company's success?",
    "What steps are involved in conducting effective market analysis?",
    "What is the purpose of a SWOT analysis in business strategy?"
  ]
)
puts "Created summary 8"


card_9 = Card.create!(
  user_id: user_sally.id,
  primary_keywords: "Entrepreneurship",
  secondary_keywords: "Innovation",
  image_url: "https://res.cloudinary.com/ddvj6niez/image/upload/v1696663130/pqarceq60sikxed8bqir.png",
  categories: [categories_for_card[5], categories_for_card[3], categories_for_card[4]]
)

Summary.create!(
  card_id: card_9.id,
  key_points: [
    "Entrepreneurship is the activity of starting and managing a new business venture.",
    "Innovation is the process of introducing new ideas, products, or services.",
    "Successful entrepreneurs often exhibit traits such as risk-taking and resilience."
  ],
  key_questions: [
    "What are the key characteristics of a successful entrepreneur?",
    "How does innovation drive entrepreneurship and business growth?",
    "What are the challenges and rewards of entrepreneurial endeavors?"
  ]
)

puts "Created summary 9"

card_10 = Card.create!(
  user_id: user_sean.id,
  primary_keywords: "Marketing Strategies",
  secondary_keywords: "Digital Advertising",
  image_url: "https://res.cloudinary.com/ddvj6niez/image/upload/v1696663386/e6qu6bxs0lljaaycvwoh.png",
  categories: [categories_for_card[14], categories_for_card[8] ]
)

Summary.create!(
  card_id: card_10.id,
  key_points: [
    "Marketing strategies are plans and tactics used to promote products or services to target audiences.",
    "Digital advertising is a form of online marketing that uses digital channels to reach consumers.",
    "Content marketing is an effective strategy for engaging audiences and building brand loyalty."
  ],
  key_questions: [
    "What are some effective marketing strategies for businesses?",
    "How does digital advertising impact consumer behavior and purchasing decisions?",
    "Why is content marketing important in today's marketing landscape?"
  ]
)

puts "Created summary 10"




# Create favourites for jack (1x existing, 1x deleted)

# Existing

Favourite.create!(
  user_id: user_jack.id,
  card_id: card_1.id
)

Favourite.create!(
  user_id: user_jack.id,
  card_id: card_2.id
)

Favourite.create!(
  user_id: user_jack.id,
  card_id: card_3.id
)

# deleted card
Favourite.create!(
  user_id: user_jack.id,
  card_id: card_4.id
)

Favourite.create!(
  user_id: user_sally.id,
  card_id: card_2.id
)

Favourite.create!(
  user_id: user_sally.id,
  card_id: card_3.id
)

Favourite.create!(
  user_id: user_sally.id,
  card_id: card_5.id
)

Favourite.create!(
  user_id: user_doug.id,
  card_id: card_2.id
)

Favourite.create!(
  user_id: user_doug.id,
  card_id: card_8.id
)

Favourite.create!(
  user_id: user_doug.id,
  card_id: card_3.id
)

Favourite.create!(
  user_id: user_sean.id,
  card_id: card_1.id
)

Favourite.create!(
  user_id: user_sean.id,
  card_id: card_2.id
)

Favourite.create!(
  user_id: user_sean.id,
  card_id: card_3.id
)

Favourite.create!(
  user_id: user_sean.id,
  card_id: card_7.id
)

Favourite.create!(
  user_id: user_sean.id,
  card_id: card_8.id
)

puts "Created Favourites"


Comment.create!(
  content: "Saving this for future reference!",
  user_id: user_sean.id,
  card_id: card_1.id,
  created_at: Time.utc(2023, 10, 1, 0, 0, 0)
)

Comment.create!(
  content: "Insightful and deep questions, love it",
  user_id: user_sean.id,
  card_id: card_2.id,
  created_at: Time.utc(2023, 10, 1, 0, 0, 0)
)

Comment.create!(
  content: "LOL love this!!!",
  user_id: user_sean.id,
  card_id: card_3.id,
  created_at: Time.utc(2023, 10, 2, 0, 0, 0)
)

Comment.create!(
  content: "makes total sense, sharing this",
  user_id: user_sean.id,
  card_id: card_7.id,
  created_at: Time.utc(2023, 10, 1, 0, 0, 0)
)

Comment.create!(
  content: "@Sean you got that right",
  user_id: user_jack.id,
  card_id: card_1.id,
  created_at: Time.utc(2023, 10, 4, 0, 0, 0)
)

Comment.create!(
  content: "@Sean ⭐ for creating this card",
  user_id: user_jack.id,
  card_id: card_2.id,
  created_at: Time.utc(2023, 10, 6, 0, 0, 0)
)

Comment.create!(
  content: "🕺🕺🕺🕺🕺",
  user_id: user_jack.id,
  card_id: card_3.id,
  created_at: Time.utc(2023, 10, 3, 0, 0, 0)
)

Comment.create!(
  content: "pity I didn't find this earlier..",
  user_id: user_jack.id,
  card_id: card_4.id,
  created_at: Time.utc(2023, 10, 3, 0, 0, 0)
)

Comment.create!(
  content: "sheeeeeeeeesh! 😍",
  user_id: user_sally.id,
  card_id: card_2.id,
  created_at: Time.utc(2023, 10, 6, 0, 0, 0)
)

Comment.create!(
  content: "boooooom!",
  user_id: user_sally.id,
  card_id: card_3.id,
  created_at: Time.utc(2023, 10, 5, 0, 0, 0)
)

Comment.create!(
  content: "Who's here?",
  user_id: user_sally.id,
  card_id: card_5.id,
  created_at: Time.utc(2023, 10, 5, 0, 0, 0)
)



puts "Created Comments"


NewsArticle.create!(
  description: "French operator Kinéis announced that its spatial connectivity helps revolutionize forest fire prevention using early detection. New space technologies and satellite-based Internet of Things (IoT) capabilities are contributing to better prevention in detecting forest fires and reducing their impact on the environment. Kinéis showcases this transformative application, which holds the potential to mitigate the devastating effects of wildfires globally.",
  url: "https://www.iot-now.com/2023/10/09/137056-kineis-uses-satellite-based-iot-connectivity-for-early-forest-fire-detection/#:~:text=French%20operator%20Kin%C3%A9is%20announced%20that,their%20impact%20on%20the%20environment.",
  published_at: Time.utc(2023, 10, 9, 0, 0, 0),
  name: "Kinéis uses satellite-based IoT connectivity for early forest fire detection",
  card_id: card_2.id,
  title: "Kinéis uses satellite-based IoT connectivity for early forest fire detection"
)

NewsArticle.create!(
  description: "Virgin Media O2 aims to revolutionise rural agriculture with its “Connected Farm of the Future” initiative, in partnership with Cannon Hall Farm located in Barnsley.",
  url: "https://www.iottechnews.com/news/2023/sep/21/virgin-media-o2-showcases-connected-farm-of-the-future/",
  published_at: Time.utc(2023, 10, 8, 0, 0, 0),
  name: "Virgin Media O2 showcases the 'connected farm of the future'",
  card_id: card_2.id,
  title: "Virgin Media O2 showcases the 'connected farm of the future'"
)

NewsArticle.create!(
  description: "BlackBerry Ltd., wrapping up a strategic review of its options, plans to hold an initial public offering for the company’s Internet of Things division, separating the business from its main cybersecurity operations.",
  url: "https://www.bloomberg.com/news/articles/2023-10-04/blackberry-plans-ipo-for-for-its-internet-of-things-business#xj4y7vzkg",
  published_at: Time.utc(2023, 10, 6, 0, 0, 0),
  name: "BlackBerry Plans IPO for Its Internet of Things Business",
  card_id: card_2.id,
  title: "BlackBerry Plans IPO for Its Internet of Things Business"
)



puts 'created newsarticle for card 2'
