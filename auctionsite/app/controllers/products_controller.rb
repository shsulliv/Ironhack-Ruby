class ProductsController < ApplicationController

	def all
		@products = Product.most_recent_items(10)
	end

	def index
		@user = User.find params[:user_id]
		@user_products = @user.products.all
	end

	def create
		@user = User.find(params[:user_id])
		@product = @user.products.new products_params

		if @product.save
			redirect_to action: 'index', controller: 'products'
		else
			render 'new'
		end
	end

	def show
		# @user = User.find params[:user_id]
		# @product = @user.products.find params[:id]
		@product = Product.find params[:id] ||
		render_404(params)
	end

	def destroy
		@destroyed_product = Product.find_by(id: params[:id]).destroy
	end

	private

    def products_params
    	params.require(:product).permit(:title, :description, :deadline)
    end

  def render_404(params)
		Rails.logger.warn("Tried to access #{params}")
	end

end
