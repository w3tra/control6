class ImageCommentsController < ApplicationController

	before_action :authenticate_user!

	def create
	  @image_comment = ImageComment.create(image_comment_params)
	  @image_comment.user_id = current_user.id
	  @image_comment.image_id = params[:image_id]
	  
	  if @image_comment.save
	    redirect_to :back
	  else
	    flash.now[:danger] = "error"
	    redirect_to :back
	  end
	end

	private

	def image_comment_params
		params.require(:image_comment).permit(:body, :rating)
	end
end
