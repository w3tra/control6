class ImagesController < ApplicationController
	before_action :authenticate_user!, :except => [:index]

	def index
		@images = Image.page(params[:page]).per(12).order('id DESC')
	end

	def new
		@image = Image.new
	end

	def create
		@image = current_user.images.create(image_params)
		if @image.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def show
		@image = Image.find(params[:id])
		@image_comment = ImageComment.new
	end

	def destroy
		@image = Image.find(params[:id])
		@image.destroy if @image.user == current_user
		redirect_to user_path(current_user)
	end

	private

	def image_params
		params.require(:image).permit(:title, :user, :picture)
	end
end
