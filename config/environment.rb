# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
RisingFalcons::Application.initialize!


ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
   :address => "smtp.gmail.com",
   :port => 587,
   :domain => "gmail.com",
   :authentication => :login,
   :user_name => "risingfalcons19",
   :password => "risingfalcons",
}


ActionMailer::Base.default :content_type => "text/html"