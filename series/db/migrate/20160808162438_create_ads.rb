class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :url
      t.string :img
      t.integer :activate
      t.integer :audit
      t.text :describe

      t.timestamps null: false
    end
  end
end
