class ContactUsMailer < ActionMailer::Base

  default :to => "patrick.lighthall@gmail.com", :subject => "Contact From Website"

  def send_confirmation(message)
    @message = message
    mail(:from => @message.email ) do |format|
      format.text
    end
  end
end