Rails.autoloaders.each do |autoloader|
  autoloader.inflector.inflect(
    'http_client' => 'HTTPClient'
  )
end
