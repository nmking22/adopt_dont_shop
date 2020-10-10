require "rails_helper"

describe "As a visitor" do
  describe "When I visit '/pets'" do
    it "Then I see each Pet in the system including the Pet's image, name, approximate age, sex and name of the shelter where the pet is currently located" do
      pet_1 = Pet.create(image: "https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg",
                         name: "Doc",
                         age: "4",
                         sex: "M",
                         location: "A1")
      pet_2 = Pet.create(image: "https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg",
                         name: "Puppaloo",
                         age: "6",
                         sex: "F",
                         location: "A2")


      visit '/pets'
      expect(page).to have_content("All Pets")
      expect(page).to have_content("#{pet_1.image}")
      expect(page).to have_content("#{pet_2.name}")
      expect(page).to have_content("#{pet_1.age}")
      expect(page).to have_content("#{pet_2.sex}")
      expect(page).to have_content("#{pet_1.location}")
    end
  end
end
