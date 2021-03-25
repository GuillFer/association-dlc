class FavoritesController < ApplicationController
	def index
		@favorites = Favorite.where(user: current_user)
	end

	def create
	  @user = current_user
	  @partner = Partner.find(params[:user_id])
	  @favorite = Favorite.create(user: @user, partner: @partner)
    @favorite.save!
    redirect_back(fallback_location: root_path)
  end

	def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end

