require "rails_helper"

describe "As a visitor" do
  describe "When I visit '/pets/:id'" do
    it "Then I see the pet with that id including the pet's image, name, description, age, sex, adoption status" do
      pet_1 = Pet.create(image: "https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg",
                         name: "Doc",
                         description: "Golden Retriever",
                         age: "4",
                         sex: "M",
                         adoption_status: "Adoptable",
                         location: "A1")

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
