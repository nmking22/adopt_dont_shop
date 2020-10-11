require "rails_helper"

describe "As a visitor" do
  describe "When I visit '/pets/:id'" do
    it "Then I see the pet with that id including the pet's image, name, description, age, sex, adoption status" do
      shelter_1 = Shelter.create(name: "Shelter 1",
                                 address: "123 Fake St.",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "88888")
      pet_1 = Pet.create(image: "https://image.shutterstock.com/z/stock-photo-dog-playing-outside-smiles-231023848.jpg",
                               name: "Doc",
                               description: "Golden Retriever",
                               age: "4",
                               sex: "male",
                               adoption_status: "adoptable",
                               location: "#{shelter_1.name}",
                               shelter_id: "#{shelter_1.id}")

      visit "/pets/#{pet_1.id}"

      expect(page).to have_content("#{pet_1.name}")
      expect(page).to have_xpath("//img[contains(@src,'#{pet_1.image}')]")
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

describe "As a visitor" do
  describe "When I visit a pet show page" do
    it "Then I see a link to delete the pet 'Delete Pet'" do
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

      expect(page).to have_link('Delete Pet')
    end
    describe "When I click the link" do
      it "Then a 'DELETE' request is sent to '/pets/:id', the pet is deleted, and I am redirected to the pet index page where I no longer see this pet" do
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

        click_link('Delete Pet')

        expect(current_path).to eq "/pets"

        expect(page).to have_no_content("#{pet_1.name}")
        expect(page).to have_no_xpath("//img[contains(@src,'#{pet_1.image}')]")
        expect(page).to have_no_content("#{pet_1.description}")
        expect(page).to have_no_content("#{pet_1.age}")
        expect(page).to have_no_content("#{pet_1.sex}")
      end
    end
  end
end

describe "As a visitor" do
  describe "When I visit a pet show page" do
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

      visit "/pets/#{pet_1.id}"

      expect(page).to have_link('Shelters Index')
    end
  end
end

describe "As a visitor" do
  describe "When I visit a pet show page" do
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

      visit "/pets/#{pet_1.id}"

      expect(page).to have_link('Pets Index')
    end
  end
end
