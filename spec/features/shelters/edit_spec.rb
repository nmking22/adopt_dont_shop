require "rails_helper"

describe "As a visitor" do
  describe "When I visit a shelter show page" do
    it "Then I see a link to update the shelter 'Update Shelter'" do
      shelter_1 = Shelter.create(name: "Shelter 1",
                                 address: "123 Fake St.",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "88888")

      visit "/shelters/#{shelter_1.id}"

      expect(page).to have_link('Update Shelter')
    end
  end
  describe "When I click the link 'Update Shelter'" do
    it "Then I am taken to '/shelters/:id/edit' where I see a form to edit the shelter's data including name, address, city, state and zip" do
      shelter_1 = Shelter.create(name: "Shelter 1",
                                 address: "123 Fake St.",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "88888")

      visit "/shelters/#{shelter_1.id}"
      click_link("Update Shelter")

      expect(current_path).to eq "/shelters/#{shelter_1.id}/edit"
    end
  end
  describe "When I fill out the form with updated information" do
    describe "And I click the button to submit the form" do
      it "Then a `PATCH` request is sent to '/shelters/:id' and the shelter's info is updated and I am redirected to the Shelter's Show page where I see the shelter's updated info" do
        shelter_1 = Shelter.create(name: "Shelter 1",
                                   address: "123 Fake St.",
                                   city: "Denver",
                                   state: "CO",
                                   zip: "88888")

        visit "/shelters/#{shelter_1.id}"
        click_link("Update Shelter")

        fill_in('name', :with => 'The Shell')
        fill_in('address', :with => '123 ABC Ave.')
        fill_in('city', :with => 'New York')
        fill_in('state', :with => 'NY')
        fill_in('zip', :with => '87778')

        click_button("Update Shelter")

        expect(current_path).to eq "/shelters/#{shelter_1.id}"
        expect(page).to have_content("The Shell")
        expect(page).to have_content("123 ABC Ave.")
        expect(page).to have_content("New York")
        expect(page).to have_content("NY")
        expect(page).to have_content("87778")
      end
    end
  end
end
