# frozen_string_literal: true

require 'net/http'

# A Service to interact with the APIs of https://dog.ceo.
#
# @author Raj Kumar
# @attr_reader [String] breed name of the breed
class DogService
  BASE_URL = ENV.fetch('BASE_URL', 'https://dog.ceo/api')

  attr_reader :breed

  # @param [String] breed name of the breed
  # @return [DogService]
  def initialize(breed)
    @breed = breed
  end

  # @return [Hash] opts the options to create a response with.
  # @option opts [String] :status The response status
  # @option opts [String] :message The response message
  def call
    uri = URI("#{BASE_URL}/breed/#{breed}/images/random")
    res = Net::HTTP.get_response(uri)

    JSON.parse(res.body)
  end
end
