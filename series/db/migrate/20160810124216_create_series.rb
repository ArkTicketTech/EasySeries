class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.string :name
      t.integer :playtime
      t.integer :playtime_qiniu
      t.integer :series_count
      t.string :img
      t.string :douban_url
      t.string :size
      t.integer :global_weight
      t.integer :featured_weight
      t.string :type

      t.timestamps null: false
    end
  end
end
