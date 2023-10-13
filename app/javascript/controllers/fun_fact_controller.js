import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="fun-fact"
export default class extends Controller {
  static targets = ["factText","loadingText"]

  connect() {
    window.scrollTo(0, 0);

    const funFacts = [
      // "Remember, while making wishes can be fun and inspirational, it's also important to take action to turn those wishes into reality. Wishing is just the first step toward achieving your dreams!",
      // "Your elevator pitch should be concise, typically under 30 seconds, to effectively introduce yourself and your business.",
      // "A firm and confident handshake can leave a positive impression and build trust during networking events.",
      // "Networking can happen anywhere, from coffee shops to social media platforms, so always be prepared to make connections.",
      // "The Rule of 150: Anthropologist Robin Dunbar proposed the idea that individuals can maintain stable social relationships with around 150 people. Consider this when managing your network.",
      // "There's often a comical dance at networking events where everyone circles the room, trying to find the best conversations to join.",
      // "Networking breakups can be funny when you start making up excuses like 'I have to refill my coffee' to politely exit a conversation, when in fact you're just finding an excuse to use Infogenie",
      // "Trends often lead to innovation. Being aware of the latest trends can inspire creativity and lead to the development of new ideas and products.",
      // "Informed decision-making relies on accurate and current information. Staying updated helps you make smarter choices, whether in business or daily life.",
      // "When you're well-informed, you can engage in meaningful conversations with others, making you a more interesting and valuable contact in your professional and social networks.",
      // "Staying informed is a lifelong learning journey. It keeps your mind active and curious, contributing to personal growth."
      "Based on your inputs, we feed your keywords, guided by a set of targeted prompts into text generation AI-powered application: ChatGPT - this returns a summary of key points and questions.",
      "In case you're wondering, our images aren't hand-drawn either. Instead, we are integrated with the AI image generation service Dall-E to produce an abstract interpretation of the keywords submitted.",
      "By interacting with relevant news sources online and extracting the latest updates via the form of an API, the world's information is now at your fingertips.",
      "From the user's inputs, our smart engine automatically categorizes and sorts created cards into our curated categories without users having to lift a finger.",
      "This seamless interweaving of tasks happens in the background while we shop for a magic carpet to wrap everything into this format to present you your desired output - bite-sized smart updates."
    ];

    const loadingProgress = [
      "Generating Summaries...", "Generating Images...", "Extracting Relevant News...", "Auto-categorizing card...", "Granting your wish..."
    ];

    let index = 0;
    const displayRandomFunFact = () => {
      console.log('crazy');
      if (index === funFacts.length - 1) index = 0;

      // const randomIndex = Math.floor(Math.random() * funFacts.length);
      const funFactText = funFacts[index];
      this.factTextTarget.innerText = funFactText;
      index ++;
    }

    let i = 0;
    const displayLoading = () => {
      if (i === loadingProgress.length - 1) i = 0;
      i ++;
      // const randomi = Math.floor(Math.random() * funFacts.length);
      const loadingText = loadingProgress[i];
      this.loadingTextTarget.innerText = loadingText;
    }



    displayRandomFunFact();
    displayLoading();

    setInterval(displayRandomFunFact, 9000);
    setInterval(displayLoading, 14000);
  }
  }
