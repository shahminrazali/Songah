require 'rails_helper'

RSpec.feature "Landing page", type: :feature do

  describe 'landing page' do
    it 'displays welcome message' do
      visit users_path
      expect(page).to eq users_path
      expect(page).to have_text "Welcome"
    end
  end
  
end
