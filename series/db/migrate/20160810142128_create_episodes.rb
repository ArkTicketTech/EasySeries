class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :name
      t.integer :playtime
      t.integer :playtime_qiniu
      t.integer :play_condition
      t.string :url_1
      t.string :url_2
      t.string :url_3
      t.string :size
      t.integer :episode_num
      t.references :serie, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
