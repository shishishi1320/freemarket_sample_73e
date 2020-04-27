class BrandsCategoriesController < ApplicationController
  before_action :set_brands_category, only: [:show, :edit, :update, :destroy]

  # GET /brands_categories
  # GET /brands_categories.json
  def index
    @brands_categories = BrandsCategory.all
  end

  # GET /brands_categories/1
  # GET /brands_categories/1.json
  def show
  end

  # GET /brands_categories/new
  def new
    @brands_category = BrandsCategory.new
  end

  # GET /brands_categories/1/edit
  def edit
  end

  # POST /brands_categories
  # POST /brands_categories.json
  def create
    @brands_category = BrandsCategory.new(brands_category_params)

    respond_to do |format|
      if @brands_category.save
        format.html { redirect_to @brands_category, notice: 'Brands category was successfully created.' }
        format.json { render :show, status: :created, location: @brands_category }
      else
        format.html { render :new }
        format.json { render json: @brands_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /brands_categories/1
  # PATCH/PUT /brands_categories/1.json
  def update
    respond_to do |format|
      if @brands_category.update(brands_category_params)
        format.html { redirect_to @brands_category, notice: 'Brands category was successfully updated.' }
        format.json { render :show, status: :ok, location: @brands_category }
      else
        format.html { render :edit }
        format.json { render json: @brands_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brands_categories/1
  # DELETE /brands_categories/1.json
  def destroy
    @brands_category.destroy
    respond_to do |format|
      format.html { redirect_to brands_categories_url, notice: 'Brands category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brands_category
      @brands_category = BrandsCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def brands_category_params
      params.require(:brands_category).permit(:category_id_id, :brand_id_id)
    end
end
