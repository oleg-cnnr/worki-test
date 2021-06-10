# frozen_string_literal: true

class ParseWorker
  include Sidekiq::Worker

  def perform(address_id)
    Parser.new(address_id)
  end
end
