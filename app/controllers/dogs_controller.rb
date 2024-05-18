# frozen_string_literal: true

# Handles user's dog related requests
class DogsController < ApplicationController
  before_action :breed_name, only: :fetch

  # POST /fetch
  def fetch
    @dog = DogService.new(breed_name).call
  end

  private

  def breed_name
    @breed_name ||= params[:breed].downcase
  end
end
