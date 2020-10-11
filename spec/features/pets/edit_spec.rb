require 'rails_helper'

describe "As a visitor" do
  describe "When I visit '/pets/:id/edit'" do
    describe "When I click the button to submit the form 'Update Pet'" do
      it "Then a `PATCH` request is sent to '/pets/:id', the pet's data is updated, and I am redirected to the Pet Show page where I see the Pet's updated information" do
        shelter_1 = Shelter.create(name: "Shelter 1",
                                   address: "123 Fake St.",
                                   city: "Denver",
                                   state: "CO",
                                   zip: "88888")
        pet_1 = Pet.create(image: "https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg",
                                 name: "Doc",
                                 description: "Golden Retriever",
                                 age: "4",
                                 sex: "male",
                                 adoption_status: "adoptable",
                                 location: "#{shelter_1.name}",
                                 shelter_id: "#{shelter_1.id}")

        visit "/pets/#{pet_1.id}/edit"

        fill_in('name', :with => 'Killa Bee')
        fill_in('image', :with => 'https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg')
        fill_in('description', :with => 'German Shepherd')
        fill_in('age', :with => '2')
        fill_in('sex', :with => 'female')

        click_button("Update Pet")

        expect(current_path).to eq "/pets/#{pet_1.id}"
        expect(page).to have_content("Killa Bee")
        expect(page).to have_content("https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg")
        expect(page).to have_content("German Shepherd")
        expect(page).to have_content("2")
        expect(page).to have_content("female")

      end
    end
  end
end

describe "As a visitor" do
  describe "When I visit '/pets/:id/edit'" do
    it "Then I see a link at the top of the page that takes me to the Shelter Index" do
      shelter_1 = Shelter.create(name: "Shelter 1",
                                 address: "123 Fake St.",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "88888")

      pet_1 = Pet.create(image: "https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg",
                               name: "Doc",
                               description: "Golden Retriever",
                               age: "4",
                               sex: "male",
                               adoption_status: "adoptable",
                               location: "#{shelter_1.name}",
                               shelter_id: "#{shelter_1.id}")

      visit "/pets/#{pet_1.id}/edit"

      expect(page).to have_link('Shelters Index')
    end
  end
end

describe "As a visitor" do
  describe "When I visit '/pets/:id/edit'" do
    it "Then I see a link at the top of the page that takes me to the Pet Index" do
      shelter_1 = Shelter.create(name: "Shelter 1",
                                 address: "123 Fake St.",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "88888")

      pet_1 = Pet.create(image: "https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg",
                               name: "Doc",
                               description: "Golden Retriever",
                               age: "4",
                               sex: "male",
                               adoption_status: "adoptable",
                               location: "#{shelter_1.name}",
                               shelter_id: "#{shelter_1.id}")

      visit "/pets/#{pet_1.id}/edit"

      expect(page).to have_link('Pets Index')
    end
  end
end
