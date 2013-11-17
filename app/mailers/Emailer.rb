class Emailer < ActionMailer::Base

 default :from => "risingfalcons19@gmail.com" 



 def deliver_contact(item_id)

    
    itemId=item_id
    mail(:to =>"risingfalcons19@gmail.com",
         :body=> "Illegal item id #{itemId}",
	 :subject=>"Illegal Item Report")
   end


end