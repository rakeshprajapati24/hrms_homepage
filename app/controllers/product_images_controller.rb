class ProductImagesController < ApplicationController
  layout "admin"
  def index
    @product_images = ProductImage.all
  end

  def new
    @product_image = ProductImage.new
  end

  def edit
    @product_image = ProductImage.find_by_id(params[:id])
  end

  def create
    @product_image = ProductImage.new(product_image_params)
    if @product_image.save
      redirect_to product_images_path
    else
      render 'new'
    end
  end

  def update
    @product_image = ProductImage.find_by_id(params[:id])
    @product_image.update_attributes(product_image_params)
    if @product_image.save
      redirect_to product_images_path
    else
      render 'edit'
    end
  end

  def destroy
    @product_image = ProductImage.find_by_id(params[:id])
    @product_image.destroy
    redirect_to product_images_path
  end

  private

  def product_image_params
    params.require(:product_image).permit!
  end
end
