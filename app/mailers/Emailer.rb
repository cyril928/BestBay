class Emailer < ActionMailer::Base

  default :from => "risingfalcons19@gmail.com"

  def deliver_contact(item_id,user_id)
    itemId=item_id
    userId=user_id
    mail(:to =>"bestbay2013fall@gmail.com",
         :body=> "Illegal item id #{itemId} reported from user id #{userId}",
	 :subject=>"Illegal Item Report")
  end


  def deliver_contact2()

    mail(:to =>"bestbay2013fall@gmail.com",
         :body=> "I have some problem with this site",
         :subject=>"Contact admin")
  end

end