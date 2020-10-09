require "rails_helper"

describe "As a visitor" do
  describe "When I visit '/shelters'" do
    it "Then I see the name of each shelter in the system" do
      shelter_1 = Shelter.create(name: "Shelter 1",
                                 address: "123 Fake St.",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "88888")
      shelter_2 = Shelter.create(name: "Shelter 1",
                                 address: "123 Fake St.",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "88888")

      visit '/shelters'

      expect(page).to have_content("All Shelters")
      expect(page).to have_content("#{shelter_1.name}")
      expect(page).to have_content("#{shelter_2.address}")
      expect(page).to have_content("#{shelter_1.city}")
      expect(page).to have_content("#{shelter_2.state}")
      expect(page).to have_content("#{shelter_1.zip}")

    end
  end
end
