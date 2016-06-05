class FavoritesController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@favorite = current_user.favorites.build(post: @post)

		if @favorite.save
			redirect_to posts_url, notice: "お気に入り登録をしました"
		else
			redirect_to posts_url, alert: "このツイートはお気に入り登録できません"
		end
	end

	def destroy
		@favorite = current_user.favorites.find_by!(post_id: params[:post_id])
		@favorite.destroy
		redirect_to posts_url, notice: "お気に入りを解除しました"
	end
end
