module Api::V1
  class ProductsController < ApplicationController

    def index
      render json: Product.all
    end

    def show
      product_id = params[:id]
      is_fake_store_api = params[:is_fake_store_api]
      product = Product.get_by_id( product_id, is_fake_store_api )

      if !product.key?(:err)
        render json: product
      else
        render json: {}, status: 404
      end
    end
  end
end
