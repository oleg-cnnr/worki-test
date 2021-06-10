# frozen_string_literal: true

class Task < ApplicationRecord
  has_many :addresses, dependent: :destroy

  accepts_nested_attributes_for :addresses

  after_commit :process_addresses

  def process_addresses
    addresses.each do |address|
      ParseWorker.perform_async(address.id)
    end
  end

  def processed?
    addresses.map(&:state).include?('awaiting')
  end
end
