class Product

  class << self

    def all
      dummy_json_client = DummyJson::Client.new
      fake_store_api_client = FakeStoreApi::Client.new
      products = []

      fake_store_api_products = fake_store_api_client.get_products
      dummy_json_products = dummy_json_client.get_products

      products += fake_store_api_products + dummy_json_products
    end

  end
end
