# frozen_string_literal: true

module FakeStoreApi
  class Client < HTTPClient
    def initialize
      super( 'https://fakestoreapi.com' )
    end

    def get_products( params = {} )
      fake_store_api_products = get( 'products', params )
      products = []

      fake_store_api_products.each do |product|
        products << {
          id: product['id'],
          title: product['title'],
          description: product['description'],
          price: product['price'],
          discountPercentage: 0,
          rating: product['rating']['rate'],
          stock: 0,
          brand: '',
          category: product['category'],
          thumbnail: product['image'],
          images: [ product['image'] ],
          is_fake_store_api: true
        }
      end

      products
    end
  end
end
