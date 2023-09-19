# The `ApplicationMailer` serves as the base class for mailers
# in the application. It provides default settings for the `from`
# address and the layout to be used for email templates.
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
