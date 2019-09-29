class CreateFoundations < ActiveRecord::Migration[5.2]
  def change
    create_table :foundations do |t|
      t.string :brand
      t.string :shade
      t.string :group
      t.belongs_to :guru

      t.timestamps
    end
  end
end
