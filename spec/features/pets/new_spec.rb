require 'rails_helper'

describe "As a visitor" do
  describe "When I visit '/shelters/:shelter_id/pets/new'" do
    describe "When I fill in the form with the pet's image, name, description, age, and sex and I click the button 'Create Pet'" do
      it "Then a `POST` request is sent to '/shelters/:shelter_id/pets', a new pet is created for that shelter, that pet has a status of 'adoptable', and I am redirected to the Shelter Pets Index page where I can see the new pet listed" do
        shelter_1 = Shelter.create(name: "Shelter 1",
                                   address: "123 Fake St.",
                                   city: "Denver",
                                   state: "CO",
                                   zip: "88888")

        visit "/shelters/#{shelter_1.id}/pets/new"

        fill_in('name', :with => 'Goose')
        fill_in('image', :with => 'https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg')
        fill_in('description', :with => 'Poodle')
        fill_in('age', :with => '1')
        fill_in('sex', :with => 'male')
        click_button("Create Pet")

        expect(current_path).to eq "/shelters/#{shelter_1.id}/pets"
        expect(page).to have_content("Goose")
        expect(page).to have_content("https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg")
        expect(page).to have_content("Poodle")
        expect(page).to have_content("1")
        expect(page).to have_content("male")
        expect(page).to have_content("adoptable")
      end
    end
  end
end

describe "As a visitor" do
  describe "When I visit '/shelters/:shelter_id/pets/new'" do
    it "Then I see a link at the top of the page that takes me to the Shelter Index" do
      shelter_1 = Shelter.create(name: "Shelter 1",
                                 address: "123 Fake St.",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "88888")

      visit "/shelters/#{shelter_1.id}/pets/new"

      expect(page).to have_link('Shelters Index')
    end
  end
end

describe "As a visitor" do
  describe "When I visit '/shelters/:shelter_id/pets/new'" do
    it "Then I see a link at the top of the page that takes me to the Pet Index" do
      shelter_1 = Shelter.create(name: "Shelter 1",
                                 address: "123 Fake St.",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "88888")

      visit "/shelters/#{shelter_1.id}/pets/new"

      expect(page).to have_link('Pets Index')
    end
  end
end
