class CreateEquities < ActiveRecord::Migration[5.1]
  def change
    create_table :equities do |t|
      t.string :symbol, limit: 20
      t.string :name
      t.integer :face_value, unsigned: true, limit: 2

      t.timestamps
    end
  end
end
