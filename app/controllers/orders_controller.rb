class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :set_user, only: %i[ index new create show edit update destroy ]

  # GET /users/1/orders or /users/1/orders.json
  def index
    @orders = Order.all
  end

  # GET /users/1/orders/1 or /users/1/orders/1.json
  def show
  end

  # GET /users/1/orders/new
  def new
    @order = Order.new
  end

  # GET /users/1/orders/1/edit
  def edit
  end

  # POST /users/1/orders or /users/1/orders.json
  def create
    @order = Order.new(order_params)
    @order.user = @user

    respond_to do |format|
      if @order.save
        format.html { redirect_to user_orders_url(@user), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1/orders/1 or /users/1/orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1/orders/1 or /users/1/orders/1.json
  def destroy
    @order.order_line_items.destroy_all
    @order.destroy!

    respond_to do |format|
      format.html { redirect_to user_orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:created_at, :user_id)
    end
end
