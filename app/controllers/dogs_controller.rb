# frozen_string_literal: true

# Handles user's dog related requests
class DogsController < ApplicationController
  before_action :validate_breed, only: :fetch
  before_action :breed_name, only: :fetch

  # POST /fetch
  def fetch
    @dog = DogService.new(breed_name).call
  end

  private

  def breed_name
    @breed_name ||= params[:breed].downcase.squish
  end

  def validate_breed
    msg = 'Please enter a valid Breed Name'

    raise ArgumentError, msg if params[:breed].blank? || !params[:breed].match?(/^\w+\s+\w+\s*$|^\w+\s*$/)
  end

  rescue_from ArgumentError do |e|
    @dog = { message: e.message, status: :error }.with_indifferent_access
    render :fetch
  end
end
