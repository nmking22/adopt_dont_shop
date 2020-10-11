require 'rails_helper'
describe "As a visitor" do
  describe "When I visit '/shelters/:shelter_id/pets'" do
    it "Then I see each Pet that can be adopted from that Shelter with that shelter_id including the Pet's image, name, age and sex" do
      shelter_1 = Shelter.create(name: "Shelter 1",
                                 address: "123 Fake St.",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "88888")
      pet_1 = Pet.create(image: "https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg",
                         name: "Doc",
                         description: "Golden Retriever",
                         age: "4",
                         sex: "M",
                         adoption_status: "Adoptable",
                         location: "Shelter 1",
                         shelter_id: shelter_1.id)
      pet_2 = Pet.create(image: "https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg",
                         name: "Puppaloo",
                         description: "Golden Retriever",
                         age: "6",
                         sex: "F",
                         adoption_status: "Adoptable",
                         location: "Shelter 1",
                         shelter_id: shelter_1.id)

      visit "/shelters/#{shelter_1.id}/pets"

      expect(page).to have_content("Pets at #{shelter_1.name}")
      expect(page).to have_content("#{pet_1.name}")
      expect(page).to have_content("#{pet_2.image}")
      expect(page).to have_content("#{pet_1.age}")
      expect(page).to have_content("#{pet_2.sex}")
    end
  end
end


describe "As a visitor" do
  describe "When I visit a Shelter Pets Index page" do
    it "Then I see a link to add a new adoptable pet for that shelter 'Create Pet'" do
      shelter_1 = Shelter.create(name: "Shelter 1",
                                 address: "123 Fake St.",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "88888")
      pet_1 = Pet.create(image: "https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg",
                         name: "Doc",
                         description: "Golden Retriever",
                         age: "4",
                         sex: "M",
                         adoption_status: "Adoptable",
                         location: "Shelter 1",
                         shelter_id: shelter_1.id)
      pet_2 = Pet.create(image: "https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg",
                         name: "Puppaloo",
                         description: "Golden Retriever",
                         age: "6",
                         sex: "F",
                         adoption_status: "Adoptable",
                         location: "Shelter 1",
                         shelter_id: shelter_1.id)

      visit "/shelters/#{shelter_1.id}/pets"

      expect(page).to have_link('Create Pet')
    end
    describe "When I click the link" do
      it "I am taken to '/shelters/:shelter_id/pets/new' where I see a form to add a new adoptable pet" do
        shelter_1 = Shelter.create(name: "Shelter 1",
                                   address: "123 Fake St.",
                                   city: "Denver",
                                   state: "CO",
                                   zip: "88888")
        pet_1 = Pet.create(image: "https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg",
                           name: "Doc",
                           description: "Golden Retriever",
                           age: "4",
                           sex: "M",
                           adoption_status: "Adoptable",
                           location: "Shelter 1",
                           shelter_id: shelter_1.id)
        pet_2 = Pet.create(image: "https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg",
                           name: "Puppaloo",
                           description: "Golden Retriever",
                           age: "6",
                           sex: "F",
                           adoption_status: "Adoptable",
                           location: "Shelter 1",
                           shelter_id: shelter_1.id)

        visit "/shelters/#{shelter_1.id}/pets"

        click_link('Create Pet')

        expect(current_path).to eq "/shelters/#{shelter_1.id}/pets/new"
        expect(page).to have_field('name')
        expect(page).to have_field('image')
        expect(page).to have_field('description')
        expect(page).to have_field('age')
        expect(page).to have_field('sex')
        expect(page).to have_button('Create Pet')
      end
    end
  end
end
