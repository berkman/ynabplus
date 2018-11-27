OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :ynab, ENV['YNAB_CLIENT_ID'], ENV['YNAB_CLIENT_SECRET']
end
