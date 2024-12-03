class PromptsController < ApplicationController
    def ask
        if params[:promt].present?
            service = OpenAIService.new
            @response = service.ask(params[:prompt])
        end
    end
end
