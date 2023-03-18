# frozen_string_literal: true

module DummyJson
  class Client < HTTPClient
    def initialize
      super( 'https://dummyjson.com' )
    end

    def get_products( params = {} )
      get( 'products', params )['products']
    end
  end
end
