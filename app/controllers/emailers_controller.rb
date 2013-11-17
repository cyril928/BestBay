
class EmailersController < ApplicationController

   def index
      Emailer.deliver_contact().deliver
     
      return if request.xhr?
      render :text => 'Message sent 1'
   end


end