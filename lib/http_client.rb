# frozen_string_literal: true
require 'rest-client'

class HTTPClient
  DEFAULT_HEADERS = {
    'Accept': 'application/json',
    'Content-Type': 'application/json; charset=utf-8'
  }

  def initialize( url )
    @url = url.to_s.strip
  end

  def get_product( id, params = {} )
    get( "products/#{id}", params )
  end

  protected
    def logger
      if !@logger
        logger_path = "#{Rails.root}/log/#{self.class.name.underscore}.log"
        FileUtils::mkdir_p( File::dirname( logger_path ) )
        @logger = Logger.new( logger_path, 'weekly' )
        @logger.level = Rails.env.dev? ? Logger::DEBUG : Logger::INFO
      end

      @logger
    end

    def get( path, params = {} )
      args = {
        method: :get,
        url: File::join( @url, path ),
        verify_ssl: Rails.env.production?,
        timeout: 180,
        headers: DEFAULT_HEADERS.merge( { params: params } ),
        log: logger
      }

      response = RestClient::Request.execute( args )

      logger.debug "#### GET : #{args} ####\n#{response}"

      JSON.parse( response )
    rescue Exception => e
      logger.error "#### GET : #{args} ####\n#{e}"
      { err: e.to_s }
    end

    def put( path, payload = {} )
      args = {
        method: :put,
        url: File::join( @url, path ),
        verify_ssl: Rails.env.production?,
        timeout: 180,
        payload: payload,
        headers: DEFAULT_HEADERS.merge( {} ),
        log: logger
      }

      response = RestClient::Request.execute( args )

      logger.debug "#### PUT : #{args} ####\n#{response}"

      JSON.parse( response )
    rescue Exception => e
      logger.error "#### PUT : #{args} ####\n#{e}"
      { err: e.to_s }
    end

    def post( path, payload = {} )
      args = {
        method: :post,
        url: File::join( @url, path ),
        verify_ssl: Rails.env.production?,
        timeout: 180,
        payload: payload,
        headers: DEFAULT_HEADERS.merge( {} ),
        log: logger
      }

      response = RestClient::Request.execute( args )

      logger.debug "#### POST : #{args} ####\n#{response}"

      JSON.parse( response )
    rescue Exception => e
      logger.error "#### POST : #{args} ####\n#{e}"
      { err: e.to_s }
    end
end
