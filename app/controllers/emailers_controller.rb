class EmailersController < ApplicationController

   def index
      @item=Item.find(params[:item_id])
      userId= params[:user_id]
      item_id= params[:item_id]
      Emailer.deliver_contact(item_id,userId).deliver

      redirect_to(@item)
      
    end

end