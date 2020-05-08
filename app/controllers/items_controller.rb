class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :buy, :pay]
  before_action :set_parent, [:new, :create]
  require "payjp" 

  # GET /items
  # GET /items.json
  def index
    @items = Item.on_sell.includes([:images]).order(created_at: :desc)
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @user = User.find_by(id: @item.seller_id)
    @category = Category.find_by(id: @item.category_id)
    @brand = Brand.find_by(id: @item.brand_id)
  end

  # GET /items/new
  def new
    @item = Item.new
    @item.images.build
    @item.build_brand
  end

  #format json
  def get_delivery_method
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])

  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
        
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def buy
    unless @item.buy?
      card = CreditCard.where(user_id: current_user.id)
      if card.exists?
        @card = CreditCard.find_by(user_id: current_user.id)
        Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
        customer = Payjp::Customer.retrieve(@card.customer_id)
        @default_card_information = Payjp::Customer.retrieve(@card.customer_id).cards.data[0]
      end
    else
      redirect_to item_path(@item)
    end
  end

  def pay
    unless @item.buy?
      @card = CreditCard.find_by(user_id: current_user.id)
      @item.status = 1
      @item.save!
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      @charge = Payjp::Charge.create(
      amount: @item.price,
      customer: @card.customer_id,
      currency: 'jpy'
      )
    else
      redirect_to item_path(@item)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    def set_parent
      @parents = Category.where(ancestry: nil)
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :price, :text, :status, :size, :condition, :shipping_cost, :delivery_method, :delivery_area, :delivery_date, :category_id, brand_attributes: [:id, :name], images_attributes: [:url, :_destroy, :id]).merge(seller_id: current_user.id, status: 0)
    end
end