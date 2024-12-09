class BackgroundJob
  include Sidekiq::Job

  def perform(correo, description)
    service = OpenService.new(description)
    ai_response_content = service.ask
    UserMailer.send_email(correo, ai_response_content).deliver_now
  end
end
