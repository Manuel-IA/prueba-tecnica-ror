class Product

  @dummy_json_client = DummyJson::Client.new
  @fake_store_api_client = FakeStoreApi::Client.new

  class << self

    def all
      products = []

      fake_store_api_products = @fake_store_api_client.get_products
      dummy_json_products = @dummy_json_client.get_products

      products += fake_store_api_products + dummy_json_products
    end

    def get_by_id( product_id, is_fake_store_api )
      if is_fake_store_api
        product = @fake_store_api_client.get_product_as_dummy_api(product_id)
      else
        product = @dummy_json_client.get_product(product_id)
      end

      product
    end
  end
end
