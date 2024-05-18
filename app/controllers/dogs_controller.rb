# frozen_string_literal: true

# Handles user's dog related requests
class DogsController < ApplicationController
  before_action :breed_name, only: :fetch

  # POST /fetch
  def fetch
    @url = DogService.new(breed_name).call['message']
  end

  private

  def breed_name
    @breed_name ||= params[:breed].downcase
  end
end
