class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :buy, :destroy,:pay]
  before_action :set_parent, only: [:new, :create,:edit, :update, :destroy, :set_parents]
  before_action :item_show_buy,   only:[:pay, :buy]


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

  def set_parents
    @children = Category.where(ancestry: params[:parent_id])
    @grandchildren = Category.where(ancestry: params[:ancestry])
  end

  def set_children
    @children = Category.where(ancestry: params[:parent_id])
  end

  def set_grandchildren
    @grandchildren = Category.where(ancestry: params[:ancestry])
  end

  # GET /items/1/edit
  def edit
    if user_signed_in? && current_user.id == @item.seller_id
    @item = Item.find(params[:id])
    @children = Category.where(ancestry: params[:parent_id])
    @grandchildren = Category.where(ancestry: params[:ancestry])
    else
    redirect_to root_path
    end
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    if @item.save
      # redirect_to root_path, notice: 'Event was successfully created.'
    else
      @item.images.build
      render :new
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    imageLength = @item.images.length
    deleteImage = 0

    for num in 0..9
      if params[:item][:images_attributes][num.to_s] != nil
        if params[:item][:images_attributes][num.to_s][:_destroy] == "1"
          deleteImage += 1
        end
      end
    end
    if @item.valid? && !@item.images.empty? && imageLength != deleteImage
      @item.update(item_params) if user_signed_in? && current_user.id == @item.seller_id
      redirect_to item_path
    else
      redirect_to edit_item_path(@item)
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy if user_signed_in? && current_user.id == @item.seller_id
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def buy
    if user_signed_in? && current_user.id == @item.seller_id
      redirect_to root_path
    else
      @address = Address.find(current_user.id)
      unless @item.buy?
        @card = CreditCard.find_by(user_id: current_user.id)
        if @card.present?
          Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
          customer = Payjp::Customer.retrieve(@card.customer_id)
          @customer_card = customer.cards.retrieve(@card.card_id)
    
          @card_brand = @customer_card.brand
          case @card_brand
          when "Visa"
            @card_src = "visa.png"
          when "JCB"
            @card_src = "jcb.png"
          when "Psypal"
            @card_src = "paypal.png"
          when "MasterCard"
            @card_src = "master.png"
          when "American Express"
            @card_src = "amex.png"
          when "Diners Club"
            @card_src = "diners.png"
          when "Discover"
            @card_src = "discover.png"
          end
    
          @exp_month = @customer_card.exp_month.to_s
          @exp_year = @customer_card.exp_year.to_s.slice(2,3)
        end
      else
        redirect_to item_path(@item)
      end
    end
  end

  def pay
    unless @item.buy?
      @card = CreditCard.find_by(user_id: current_user.id)
      if @card.present?  
        @item.buyer_id = current_user.id
        @item.status = 1    
        Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
        @charge = Payjp::Charge.create(
        amount: @item.price,
        customer: @card.customer_id,
        currency: 'jpy'
        )
        @item.save!   
      else
        redirect_to new_credit_card_path, alert: "クレジットカードを登録してください"
      end
    else
      redirect_to item_path(@item), alert: "購入が完了しました"
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
      params.require(:item).permit(:name, :price, :text, :status, :size, :condition, :shipping_cost, :delivery_method, :delivery_area, :delivery_date, :category_id, brand_attributes: [:name], images_attributes: [:url, :_destroy, :id]).merge(seller_id: current_user.id, status: 0)
    end

    #購入済の商品、出品者はpay,buyページにurlから飛べないように
    def  item_show_buy
      if @item.buyer_id.present? || current_user.id == @item.seller_id
        redirect_to root_path
      end
    end
end
