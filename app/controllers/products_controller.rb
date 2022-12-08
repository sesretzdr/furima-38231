class ProductsController < ApplicationController
    before_action :set_product, only: [ :show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [ :index, :show,  :edit]
    before_action :prevent_url, only: [:edit]
  
    def index
      @products = Product.all.order('created_at DESC')
    end
  
    def new
      @product = Product.new
    end
  
    def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to root_path
      else
        render :new
      end
    end
  
    def show
    end
  
    def edit
      redirect_to root_path unless current_user.id == @product.user_id
    end
  
    def update
      if @product.update(product_params)
        redirect_to product_path(@product.id)
      else
        render :edit
      end
    end
  
    def destroy
      @product.destroy if current_user.id == @product.user.id
         redirect_to root_path
    end
  
    private
  
    def require_login
      redirect_to user_session_path, alert: 'You need to sign in or sign up before continuing.' unless user_signed_in?
    end

    def prevent_url
      if @product.user_id != current_user.id || @product.purchase != nil 
        redirect_to root_path
      end
    end
  
    def product_params
      params.require(:product).permit(:image, :name, :explanation, :category_id, :derively_fee_id, :status_id, :prefecture_id, :day_id, :price).merge(user_id: current_user.id)
    end
  
    def set_product
      @product = Product.find(params[:id])
    end
  end
