# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes the DogsHelper.
describe DogsHelper, type: :helper do
  describe 'message_locals' do
    it 'returns correct locals (hash) for successful response hash' do
      body = { 'status' => 'success', 'message' => 'Anything' }
      expect(message_locals(body)).to eq({
                                           msg: 'Enter a breed name and let us surprise you! 🐶 🦴 🐾',
                                           tw_class: 'text-inherit'
                                         })
    end
  end
end
