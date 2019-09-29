class CreateGurus < ActiveRecord::Migration[5.2]
  def change
    create_table :gurus do |t|
      t.string :blog
      t.string :undertone
      t.string :hair
      t.json :eyes
      t.json :skin

      t.timestamps
    end
  end
end
