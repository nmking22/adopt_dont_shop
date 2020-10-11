require 'rails_helper'

describe "As a visitor" do
  describe "When I visit '/shelters/:id'" do
    it "Then I see the shelter with that id including the shelter's name, address, city, state and zip" do
      shelter_1 = Shelter.create(name: "Shelter 1",
                                 address: "123 Fake St.",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "88888")

      visit "/shelters/#{shelter_1.id}"

      expect(page).to have_content("#{shelter_1.name}")
      expect(page).to have_content("#{shelter_1.address}")
      expect(page).to have_content("#{shelter_1.city}")
      expect(page).to have_content("#{shelter_1.state}")
      expect(page).to have_content("#{shelter_1.zip}")
    end
  end
end

describe "As a visitor" do
  describe "When I visit a shelter show page" do
    it "Then I see a link to delete the shelter" do
      shelter_1 = Shelter.create(name: "Shelter 1",
                                 address: "123 Fake St.",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "88888")

      visit "/shelters/#{shelter_1.id}"

      expect(page).to have_link('Delete Shelter')
    end
    describe "When I click the link 'Delete Shelter'" do
      it "Then a 'DELETE' request is sent to '/shelters/:id' and the shelter is deleted and I am redirected to the shelter index page where I no longer see this shelter" do
        shelter_1 = Shelter.create(name: "Shelter One",
                                   address: "12345 Fake St.",
                                   city: "Santa Fe",
                                   state: "NM",
                                   zip: "77777")

        visit "/shelters/#{shelter_1.id}"
        click_link('Delete Shelter')

        expect(current_path).to eq "/shelters"

        expect(page).to have_no_content("#{shelter_1.name}")
        expect(page).to have_no_content("#{shelter_1.address}")
        expect(page).to have_no_content("#{shelter_1.city}")
        expect(page).to have_no_content("#{shelter_1.state}")
        expect(page).to have_no_content("#{shelter_1.zip}")
      end
    end
  end
end

describe "As a visitor" do
  describe "When I visit a shelter show page" do
    it "Then I see a link at the top of the page that takes me to the Shelter Index" do
      shelter_1 = Shelter.create(name: "Shelter 1",
                                 address: "123 Fake St.",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "88888")

      visit "/shelters/#{shelter_1.id}"

      expect(page).to have_link('Shelters Index')
    end
  end
end

describe "As a visitor" do
  describe "When I visit a shelter show page" do
    it "Then I see a link at the top of the page that takes me to the Pet Index" do
      shelter_1 = Shelter.create(name: "Shelter 1",
                                 address: "123 Fake St.",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "88888")

      visit "/shelters/#{shelter_1.id}"

      expect(page).to have_link('Pets Index')
    end
  end
end

describe "As a visitor" do
  describe "When I visit a shelter show page ('/shelters/:id')" do
    it "Then I see a link to take me to that shelter's pets page ('/shelters/:id/pets')" do
      shelter_1 = Shelter.create(name: "Shelter 1",
                                 address: "123 Fake St.",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "88888")

      visit "/shelters/#{shelter_1.id}"

      expect(page).to have_link("#{shelter_1.name}'s Pets")
    end
  end
end
