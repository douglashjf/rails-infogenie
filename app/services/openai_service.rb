require "openai"

class OpenaiService
  attr_reader :client, :prompt

  def initialize(prompt)
    @client = OpenAI::Client.new
    @prompt = prompt
  end

  def call
    response = client.chat(
      parameters: {
          model: "gpt-3.5-turbo", # Required.
          messages: [
            {
              role: "system",
              content: "You are an assistant that summarizes complex topics. Expect a primary keyword topic and several secondary keywords for context. Please return all answers in a JSON format"
            },
            {
              role: "user",
              content: @prompt
            }
          ],
          temperature: 0.7,
          stream: false,
					max_tokens: 3000 # might want to check this
      })
    # you might want to inspect the response and see what the api is giving you
    response_content = response["choices"][0]["message"]["content"]

  end

  def generate_dalle_image
    response = client.images.generate(
      parameters: {
        prompt: @prompt, size: "512x512" })
    return response.dig("data", 0, "url")
  end
end
