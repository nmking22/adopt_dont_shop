class CreatePet < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :image
      t.string :age
      t.string :sex
      t.string :location
    end
  end
end
