# frozen_string_literal: true

class Parser
  attr_reader :address, :connection, :response

  def initialize(address_id)
    @address = Address.find(address_id)

    @connection = Faraday.new(url: address.uri)

    make_request
  rescue StandardError => e
    address.update(result: e.inspect)
    address.fail!
  end

  def make_request
    @response = connection.get

    handle_response
  rescue Faraday::Error => e
    address.update(result: e.inspect)
    address.fail!
  end

  def handle_response
    title = extract_title

    address.update(code: response.status, result: title)
    address.complete!
  end

  def extract_title
    doc = Nokogiri::HTML(response.body)

    doc.title || 'Заголовок отсутствует'
  end
end
