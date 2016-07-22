class PostsController < ApplicationController

	before_action :authenticate_user!, only: [:destroy]
    before_action :find_group

	def new
		@post = @group.posts.new
	end

	def edit
		@post = @group.posts.find(params[:id])
	end

	def create
		@post = @group.posts.build(post_params)

		if  @post.save
			redirect_to group_path(@group), notice: "CREAT NEW ARTICLE SUCCESS"
		else
			render :new
		end
	end

	def update
		@post = @group.posts.find(params[:id])

		if @post.update(post_params)
			redirect_to group_path(@group), notice: "UPDATE SUCCESS"
		else
			render :edit
		end
	end

	def destroy
		@post = @group.posts.find(params[:id])

		@post.destroy
		redirect_to group_path(@group), alert: "ARTICLE DELETED"
	end

	private

    def find_group
    	@group = Group.find(params[:group_id])
    end

	def post_params
		params.require(:post).permit(:content)
	end
end