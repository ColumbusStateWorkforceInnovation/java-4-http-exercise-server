class OrderLineItemsController < ApplicationController
  before_action :set_order_line_item, only: %i[ show edit update destroy ]
  before_action :set_order, only: %i[index new create show edit update destroy]

  # GET /users/1/orders/1/order_line_items or /users/1/orders/1/order_line_items.json
  def index
    @order_line_items = OrderLineItem.all
  end

  # GET /users/1/orders/1/order_line_items/1 or /users/1/orders/1/order_line_items/1.json
  def show
  end

  # GET /users/1/orders/1/order_line_items/new
  def new
    @order_line_item = OrderLineItem.new
  end

  # GET /users/1/orders/1/order_line_items/1/edit
  def edit
  end

  # POST /users/1/orders/1/order_line_items or /users/1/orders/1/order_line_items.json
  def create
    @order_line_item = OrderLineItem.new(order_line_item_params)
    @order_line_item.order = @order

    respond_to do |format|
      if @order_line_item.save
        format.html { redirect_to user_order_order_line_item_url(@order.user, @order, @order_line_item), notice: "Order line item was successfully created." }
        format.json { render :show, status: :created, location: user_order_order_line_item_url(@order.user, @order, @order_line_item) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1/orders/1/order_line_items/1 or /users/1/orders/1/order_line_items/1.json
  def update
    respond_to do |format|
      if @order_line_item.update(order_line_item_params)
        format.html { redirect_to user_order_order_line_item_url(@order.user, @order, @order_line_item), notice: "Order line item was successfully updated." }
        format.json { render :show, status: :ok, location: user_order_order_line_item_url(@order_line_item) }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1/orders/1/order_line_items/1 or /users/1/orders/1/order_line_items/1.json
  def destroy
    @order_line_item.destroy!

    respond_to do |format|
      format.html { redirect_to user_order_order_line_items_url(@order.user, @order), notice: "Order line item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_line_item
      @order_line_item = OrderLineItem.find(params[:id])
    end

    def set_order
      @order = Order.find(params[:order_id])
    end

    # Only allow a list of trusted parameters through.
    def order_line_item_params
      params.require(:order_line_item).permit(:order_id, :count, :product_id)
    end
end
