class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_post, only: [:show, :edit, :destroy, :update, :upvote, :downvote]

	def index
		@posts = Post.all.order("created_at DESC" )
	end
	
	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.new(post_params)

		if @post.save
			redirect_to @post
		else
			redirect_to 'new'
		end

	end

	def show
	end

	def update
		if @post.update(post_params)
			redirect_to @post, notice: "Guardado Exitosamente"
		else
			redirect_to 'edit'
		end
	end

	def edit

	end

	def destroy
		if @post.destroy
			redirect_to root_path, notice: "El post se ha eliminado correctamente"
		end
	end

	def upvote 
		@post.upvote_by current_user
		if request.xhr?
    		render json: { count: @post.get_upvotes.size, id: params[:id] }
  		else
    		redirect_to posts_path
 		end
	end

	def downvote
		@post.downvote_by current_user
		if request.xhr?
    		render json: { count: @post.get_downvotes.size, id: params[:id] }
  		else
    		redirect_to posts_path
 		end
	end

	private

	def set_post
		@post = Post.find(params[:id])
	end
	def post_params
		params.require(:post).permit(:title, :image)
	end
end
