
class EmailersController < ApplicationController

   def index
   
      @item=Item.find(params[:item_id])
      item_id= params[:item_id]
      Emailer.deliver_contact(item_id).deliver
     

      redirect_to(@item)
      
    end



end