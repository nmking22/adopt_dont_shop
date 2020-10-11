require "rails_helper"

describe "As a visitor" do
  describe "When I visit '/pets'" do
    it "Then I see each Pet in the system including the Pet's image, name, approximate age, sex and name of the shelter where the pet is currently located" do
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
                         location: "#{shelter_1.name}",
                         shelter_id: "#{shelter_1.id}")
      pet_2 = Pet.create(image: "https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg",
                         name: "Puppaloo",
                         description: "Golden Retriever",
                         age: "6",
                         sex: "F",
                         adoption_status: "Adoptable",
                         location: "#{shelter_1.name}",
                         shelter_id: "#{shelter_1.id}")


      visit '/pets'
      expect(page).to have_content("All Pets")
      expect(page).to have_link("#{pet_2.name}")
      expect(page).to have_content("#{pet_1.image}")
      expect(page).to have_content("#{pet_2.name}")
      expect(page).to have_content("#{pet_1.age}")
      expect(page).to have_content("#{pet_2.sex}")
      expect(page).to have_content("#{pet_1.location}")
    end
  end
end

describe "As a visitor" do
  describe "When I visit the pets index page or a shelter pets index page" do
    it "Next to every pet, I see a link to edit that pet's info" do
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
                         location: "#{shelter_1.name}",
                         shelter_id: "#{shelter_1.id}")

      visit '/pets'

      expect(page).to have_link('Update Pet')
    end
    describe "When I click the link" do
      it "I should be taken to that pets edit page where I can update its information just like in User Story 11" do
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
                           location: "#{shelter_1.name}",
                           shelter_id: "#{shelter_1.id}")

        visit '/pets'

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
  describe "When I visit the pets index page or a shelter pets index page" do
    it "Next to every pet, I see a link to delete that pet" do
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
                         location: "#{shelter_1.name}",
                         shelter_id: "#{shelter_1.id}")

      visit '/pets'

      expect(page).to have_link('Delete Pet')
    end
    describe "When I click the link" do
      it "I should be taken to the pets index page where I no longer see that pet" do
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
                           location: "#{shelter_1.name}",
                           shelter_id: "#{shelter_1.id}")

        visit '/pets'

        click_link('Delete Pet')
        expect(current_path).to eq '/pets'
        expect(page).to have_no_content("#{pet_1.name}")
        expect(page).to have_no_content("#{pet_1.image}")
        expect(page).to have_no_content("#{pet_1.description}")
        expect(page).to have_no_content("#{pet_1.age}")
        expect(page).to have_no_content("#{pet_1.sex}")
      end
    end
  end
end

describe "As a visitor" do
  describe "When I visit '/pets'" do
    it "Then I see a link at the top of the page that takes me to the Shelter Index" do
      visit '/pets'

      expect(page).to have_link('Shelters Index')
    end
  end
end

describe "As a visitor" do
  describe "When I visit '/pets'" do
    it "Then I see a link at the top of the page that takes me to the Pet Index" do
      visit '/pets'

      expect(page).to have_link('Pets Index')
    end
  end
end
