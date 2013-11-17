class Emailer < ActionMailer::Base

default :from => "risingfalcons19@gmail.com" 



 def deliver_contact()
    mail(:to =>"pratibha25.anjali@gmail.com",
         :body=> "Please see the Terms and Conditions attached",
	 :subject=>"good!")
   end


end