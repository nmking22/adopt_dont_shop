require 'rails_helper'

describe "As a visitor" do
  describe "When I visit '/shelters/new'" do
    it "Then I see a link at the top of the page that takes me to the Shelter Index" do
      visit '/shelters/new'

      expect(page).to have_link('Shelters Index')
    end
  end
end

describe "As a visitor" do
  describe "When I visit '/shelters/new'" do
    it "Then I see a link at the top of the page that takes me to the Pet Index" do
      visit '/shelters/new'

      expect(page).to have_link('Pets Index')
    end
  end
end
