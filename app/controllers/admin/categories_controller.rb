class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV["HTTP_BASIC_AUTH_USER"], password: ENV["HTTP_BASIC_AUTH_PASSWORD"]
  def index
    @category = Category.order(id: :asc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin_categories], notice: 'Category created!'
    else
      render :new
    end
  end
  
  # def destroy
  #   @category = Category.find params[:id]
  #   @category.destroy
  #   redirect_to [:admin, :category], notice: 'Category deleted!'
  # end

  private

  def category_params
    params.require(:category).permit(
      :name,    
    )
  end

end