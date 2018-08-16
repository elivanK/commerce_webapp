if Rails.env.production?
    Rails.configuration.stripe = {
      publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
      secret_key: ENV['STRIPE_SECRET_KEY']
    }
  else
    Rails.configuration.stripe = {
      publishable_key: 'pk_test_RcCRsExO8IAZ49fl8wc178rR',
      secret_key: 'sk_test_Hm3hzdx6hZAovhfouiNsHS18'
    }
  end
  
  Stripe.api_key = Rails.configuration.stripe[:secret_key]