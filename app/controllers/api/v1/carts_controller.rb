module Api::V1
  class CartsController < ApplicationController

    def create
      total = params[:total]
      products = []
      if !params[:products].blank?
        products = JSON.parse params[:products]
      end

      cart = Cart.new({products: products, total: total})

      if cart.valid? && cart.save
        render json: cart
      else
        render json: cart.errors, status: 400
        
      end
    end
  end
end
