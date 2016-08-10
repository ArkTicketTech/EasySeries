class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.string :name
      t.integer :playtime
      t.integer :playtime_qiniu
      t.integer :series_count
      t.string :img
      t.integer :play_condition

      t.timestamps null: false
    end
  end
end
