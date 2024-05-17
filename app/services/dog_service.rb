# frozen_string_literal: true

require 'net/http'

# A Service to interact with the APIs of https://dog.ceo.
#
# @author Raj Kumar
# @attr_reader [String] breed name of the breed
class DogService
  BASE_URL = ENV.fetch('BASE_URL', 'https://dog.ceo/api')

  attr_reader :breed

  def initialize(breed)
    @breed = breed
  end
end
