import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="fun-fact"
export default class extends Controller {
  static targets = ["factText"]

  connect() {
    const funFacts = [
      "Remember, while making wishes can be fun and inspirational, it's also important to take action to turn those wishes into reality. Wishing is just the first step toward achieving your dreams!",
      "Your elevator pitch should be concise, typically under 30 seconds, to effectively introduce yourself and your business.",
      "A firm and confident handshake can leave a positive impression and build trust during networking events.",
      "Networking can happen anywhere, from coffee shops to social media platforms, so always be prepared to make connections.",
      "The Rule of 150: Anthropologist Robin Dunbar proposed the idea that individuals can maintain stable social relationships with around 150 people. Consider this when managing your network.",
      "There's often a comical dance at networking events where everyone circles the room, trying to find the best conversations to join.",
      "Networking breakups can be funny when you start making up excuses like 'I have to refill my coffee' to politely exit a conversation, when in fact you're just finding an excuse to use Infogenie",
      "Trends often lead to innovation. Being aware of the latest trends can inspire creativity and lead to the development of new ideas and products.",
      "Informed decision-making relies on accurate and current information. Staying updated helps you make smarter choices, whether in business or daily life.",
      "When you're well-informed, you can engage in meaningful conversations with others, making you a more interesting and valuable contact in your professional and social networks.",
      "Staying informed is a lifelong learning journey. It keeps your mind active and curious, contributing to personal growth."

    ];


    const displayRandomFunFact = () => {
      console.log('crazy');
      const randomIndex = Math.floor(Math.random() * funFacts.length);
      const funFactText = funFacts[randomIndex];
      this.factTextTarget.innerText = funFactText;
    }

    displayRandomFunFact();

    setInterval(displayRandomFunFact, 5000);
  }
  }
