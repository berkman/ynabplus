Rails.application.config.middleware.use OmniAuth::Builder do
  provider :oauth, ['YNAB_ID'], ENV['YNAB_SECRET']
end
