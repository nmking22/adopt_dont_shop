require "rails_helper"

describe "As a visitor" do
  describe "When I visit '/shelters'" do
    it "Then I see the name of each shelter in the system" do
      shelter_1 = Shelter.create(name: "Shelter 1",
                                 address: "123 Fake St.",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "88888")
      shelter_2 = Shelter.create(name: "Shelter 2",
                                 address: "1234 Fake St.",
                                 city: "Vail",
                                 state: "CO",
                                 zip: "81888")

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

describe "As a visitor" do
  describe "When I visit the Shelter Index page" do
    it "Then I see a link to create a new Shelter, 'New Shelter'" do

      visit '/shelters'

      expect(page).to have_link("New Shelter")
    end
    describe "When I click this link" do
      it "Then I am taken to '/shelters/new' where I see a form for a new shelter" do

        visit '/shelters'
        click_link("New Shelter")

        expect(current_path).to eq '/shelters/new'
        expect(page).to have_field('name')
        expect(page).to have_field('address')
        expect(page).to have_field('city')
        expect(page).to have_field('state')
        expect(page).to have_field('zip')
        expect(page).to have_button('Create Shelter')
      end
      describe "When I fill out the form with a new shelter's name, address, city, state and zip And I click the button 'Create Shelter' to submit the form" do
        it "Then a `POST` request is sent to '/shelters' and a new shelter is created" do
          visit '/shelters'
          click_link("New Shelter")
          fill_in('name', :with => 'The Shell')
          fill_in('address', :with => '123 ABC Ave.')
          fill_in('city', :with => 'Denver')
          fill_in('state', :with => 'CO')
          fill_in('zip', :with => '88888')
          click_button("Create Shelter")

          expect(current_path).to eq '/shelters'
          expect(page).to have_content("The Shell")
          expect(page).to have_content("123 ABC Ave.")
          expect(page).to have_content("Denver")
          expect(page).to have_content("CO")
          expect(page).to have_content("88888")
        end
      end
    end
  end
end

describe "As a visitor" do
  describe "When I visit the shelter index page" do
    it "Next to every shelter, I see a link to edit that shelter's info" do
      shelter_1 = Shelter.create(name: "Shelter 1",
                                 address: "123 Fake St.",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "88888")

      visit '/shelters'
      expect(page).to have_link('Update Shelter')
    end
    describe "When I click the link" do
      it "I should be taken to that shelters edit page where I can update its information just like in User Story 5" do
        shelter_1 = Shelter.create(name: "Shelter 1",
                                   address: "123 Fake St.",
                                   city: "Denver",
                                   state: "CO",
                                   zip: "88888")

        visit '/shelters'

        click_link('Update Shelter')

        expect(current_path).to eq "/shelters/#{shelter_1.id}/edit"
        expect(page).to have_field('name')
        expect(page).to have_field('address')
        expect(page).to have_field('city')
        expect(page).to have_field('state')
        expect(page).to have_field('zip')
        expect(page).to have_link('Update Shelter')
      end
    end
  end
end
