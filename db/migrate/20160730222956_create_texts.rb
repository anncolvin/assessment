class CreateTexts < ActiveRecord::Migration[5.0]
  def change
    create_table :texts do |t|
      t.string :number, null: false
      t.text :message, null: false
    end
  end
end
