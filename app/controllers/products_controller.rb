class ProductsController < ApplicationController
	layout "admin"
	def index
		@products = Product.all
		@products = @products.where("concat_ws(' ', product_name, product_description,price,weight,seo_name) like ?", "%#{params[:search_terms]}%".gsub(/\s+/, ""))
      	respond_to do |format|
      	format.html
      	format.csv { send_data @products.to_csv}
    end
	end

	def new
		@product = Product.new
	end

	def edit
		@product = Product.find_by_id(params[:id])
	end

	def show 
		@product = Product.find_by_id(params[:id])
	end

	def create
		@product = Product.new(params_product)
		if @product.save
			redirect_to products_path
		else
			render 'new'
		end
	end

	def update
		@product = Product.find_by_id(params[:id])
		@product.update_attributes(params_product)
		if @product.save
			redirect_to products_path
		else
			render 'edit'
		end
	end

	def destroy
		@product = Product.find_by_id(params[:id])
		@product.destroy
		redirect_to products_path
	end

	private

	def params_product
		params.require(:product).permit!
	end
end
