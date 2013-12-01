class RatingCommentsController < ApplicationController
  before_filter :authenticate_user!

  # POST /items
  # POST /items.json
  # Standard scaffold code augmented by setting the user_id on the item to the user_id of the person posting(seller)
  def create
    puts params[:item_id]
    puts params[:comment]
    puts params[:rating]
    @item = Item.find(params[:item_id])

    rating_value = 0
    index = 0
    @rating_comment_set = RatingComment.where(['item_id = ? AND user_id <> ?', params[:item_id], current_user.id])
    @rating_comment_set.each do |rating_comment|
      rating_value += rating_comment.rating
      index += 1
    end

    (index != 0) ?
        rating_value = (rating_value + Integer(params[:rating])) / (index + 1) :
        rating_value = Integer(params[:rating])
    @item.update_attributes(average_rating: rating_value)


    @rating_comment_set = RatingComment.where({item_id: params[:item_id], user_id: current_user.id})

    @rating_comment = nil
    @rating_comment_set.each do |rating_comment|
      @rating_comment = rating_comment
    end

    unless params[:comment].nil?
      unless @rating_comment.nil?
        @rating_comment.update_attributes(rating: Integer(params[:rating]))
        @rating_comment.update_attributes(comment: params[:comment])
      else
        @rating_comment = RatingComment.new(user_id: current_user.id, seller_id: @item.user_id, item_id: params[:item_id],
                                        rating: Integer(params[:rating]), comment: params[:comment], is_seller_rating: 0)
        @rating_comment.save
      end
    else
      unless @rating_comment.nil?
        @rating_comment = RatingComment.find({item_id: params[:item_id], user_id: current_user.id})
        @rating_comment.update_attributes(rating: Integer(params[:rating]))
        @rating_comment.update_attributes(comment: "")
      else
        @rating_comment = RatingComment.new(user_id: current_user.id, seller_id: @item.user_id, item_id: params[:item_id],
                                            rating: Integer(params[:rating]), comment: "", is_seller_rating: 0)
        @rating_comment.save
      end
    end

    respond_to do |format|
      #if @item.save
        format.html { redirect_to @item, notice: 'Thanks for your comment, rating.' }
      #else
        #format.html { render action: "new" }
        #format.json { render json: @item.errors, status: :unprocessable_entity }
      #end
    end
  end
end
