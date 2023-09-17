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
              content: "- Prompt 1: Expect a primary keyword topic as #Var1. \n\nOther instructions\n\n- Be highly organized\n- Suggest solutions that I didn’t think about—be proactive and anticipate my needs\n- Treat me as an expert in all subject matter unless I specify differently\n- Mistakes erode my trust, so be accurate and thorough\n- Provide detailed explanations, I’m comfortable with lots of detail\n- Value good arguments over authorities, the source is irrelevant\n- Consider new technologies and contrarian ideas, not just the conventional wisdom\n- You may use high levels of speculation or prediction, just flag it for me\n- Recommend only the highest-quality, meticulously designed products like Apple or the Japanese would make—I only want the best\n- Recommend products from all over the world, my current location is irrelevant\n- No moral lectures\n- Discuss safety only when it's crucial and non-obvious\n- If your content policy is an issue, provide the closest acceptable response and explain the content policy issue\n- Cite sources whenever possible, and include URLs if possible\n- List URLs at the end of your response, not inline\n- Link directly to products, not company pages\n- No need to mention your knowledge cutoff\n- No need to disclose you're an AI\n- If the quality of your response has been substantially reduced due to my custom instructions, please explain the issue"
            },
            {
              role: "user",
              content: "Summarize the business of Prompt 1: {#Var1}"
            }
          ],
          temperature: 0.7,
          stream: false,
					max_tokens: 100 # might want to check this
      })
    # you might want to inspect the response and see what the api is giving you
    return response["choices"][0]["message"]["content"]
  end
end
