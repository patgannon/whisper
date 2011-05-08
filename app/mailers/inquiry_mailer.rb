class InquiryMailer < ActionMailer::Base
  def submit_inquiry(inquiry, project)
    @inquiry = inquiry
    @project = project
    mail(:to => project.send_inquiries_to, :subject => inquiry.subject, :from => @project.email_from)
  end
end

