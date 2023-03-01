class CreateTours < ActiveRecord::Migration[7.0]
  def change
    create_table :tours do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :duration
      t.date :date

      t.timestamps
    end
  end
end
