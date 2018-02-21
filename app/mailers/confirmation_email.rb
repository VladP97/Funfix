class ConfirmationEmail < Devise::Mailer
  default from: "vlad.potapov@gmail.com"
  helper :application
  include Devise::Controllers::UrlHelpers
  default template_path: 'devise/mailer'
end