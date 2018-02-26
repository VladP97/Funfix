class ConfirmationEmail < Devise::Mailer
  helper :application
  include Devise::Controllers::UrlHelpers
  default template_path: 'devise/mailer', from: "funfix@gmail.com"
end