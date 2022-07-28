class CategoriesController < ApplicationController
    layout "admin"
  def index
    @categories = Categorie.all
    @categories = @categories.where("concat_ws(' ', categorie_name, seo_name) like ?", "%#{params[:search_terms]}%".gsub(/\s+/, ""))
        respond_to do |format|
          format.html
          format.csv { send_data @categories.to_csv}
      end
  end

  def new
    @categorie = Categorie.new
  end

  def edit
    @categorie = Categorie.find_by_id(params[:id])
  end

  def show 
    @categorie = Categorie.find_by_id(params[:id])
  end

  def create
    @categorie = Categorie.new(params_categorie)
    if @categorie.save
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def update
    @categorie = Categorie.find_by_id(params[:id])
    @categorie.update_attributes(params_categorie)
    if @categorie.save
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @categorie = Categorie.find_by_id(params[:id])
    @categorie.destroy
    redirect_to categories_path
  end

  private

  def params_categorie
    params.require(:categorie).permit!
  end
end
