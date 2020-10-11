require "rails_helper"

describe "As a visitor" do
  describe "When I visit '/pets/:id'" do
    it "Then I see the pet with that id including the pet's image, name, description, age, sex, adoption status" do
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

      visit "/pets/#{pet_1.id}"

      expect(page).to have_content("#{pet_1.name}")
      expect(page).to have_content("#{pet_1.image}")
      expect(page).to have_content("#{pet_1.description}")
      expect(page).to have_content("#{pet_1.age}")
      expect(page).to have_content("#{pet_1.sex}")
      expect(page).to have_content("#{pet_1.adoption_status}")
    end
  end
end

describe "As a visitor" do
  describe "When I visit a Pet Show page" do
    it "Then I see a link to update that Pet 'Update Pet'" do
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

      visit "/pets/#{pet_1.id}"

      expect(page).to have_link('Update Pet')
    end
    describe "When I click the link" do
      it "I am taken to '/pets/:id/edit' where I see a form to edit the pet's data including image, name, description, age, sex" do
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

        visit "/pets/#{pet_1.id}"

        click_link('Update Pet')

        expect(current_path).to eq "/pets/#{pet_1.id}/edit"
        expect(page).to have_field('name')
        expect(page).to have_field('image')
        expect(page).to have_field('description')
        expect(page).to have_field('age')
        expect(page).to have_field('sex')
        expect(page).to have_button('Update Pet')
      end
    end
  end
end
