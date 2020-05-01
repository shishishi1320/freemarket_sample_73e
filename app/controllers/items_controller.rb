class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # # GET /items
  # # GET /items.json
  # def index
  #   @items = Item.all
  # end

  # # GET /items/1
  # # GET /items/1.json
  # def show
  # end

  def new
    @item = Item.new
    @item.images.build
    @item.build_brand
    @parents = Category.where(ancestry: nil)
  end

  # # GET /items/1/edit
  # def edit
  # end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def update
  #   respond_to do |format|
  #     if @item.update(item_params)
  #       format.html { redirect_to @item, notice: 'Item was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @item }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @item.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /items/1
  # # DELETE /items/1.json
  # def destroy
  #   @item.destroy
  #   respond_to do |format|
  #     format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # # Use callbacks to share common setup or constraints between actions.
    # def set_item
    #   @item = Item.find(params[:id])
    # end

    def item_params
      params.require(:item).permit(:name, :price, :text, :status, :size, :condition, :shipping_cost, :delivery_method, :delivery_area, :delivery_date, :seller_id, :buyer_id, :category_id, brand_attributes: [:id, :name], images_attributes: [:url])
      # .merge(seller_id: current_user.id) あとでつける
    end
end