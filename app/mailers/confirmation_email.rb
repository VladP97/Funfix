class ConfirmationEmail < Devise::Mailer
  default from: "vlad.potapov1997@gmail.com"
  helper :application
  include Devise::Controllers::UrlHelpers
  default template_path: 'devise/mailer'
end