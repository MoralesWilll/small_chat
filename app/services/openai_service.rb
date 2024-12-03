require "openai"

class OpenAIService
    def initialize
        @client = OpenAI::Client.new(api_key: ENV["API_KEY"], log_errors: true)
    end

    def ask(prompt)
        response = @client.chat(
            parameters: {
                model: "gpt-4",
                messages: [ { role: "user", content: prompt } ],
                temperature: 0.7,
                max_tokens: 100
            }
        )
        content = response.dig("choices", 0, "message", "content")
      if content.nil?
        raise "Unexpected response structure"
      end

      content
    rescue => e
      puts "Error: #{e.message}"
      nil
    end
end
