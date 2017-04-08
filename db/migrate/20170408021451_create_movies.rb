class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.integer :guidebox_id
      t.string :title
      t.integer :release_date
      t.string :rating
      t.string :overview
      t.string :primary_genre
      t.string :secondary_genre
      t.string :tertiary_genre
      t.string :primary_free_name
      t.string :primary_free_link
      t.string :secondary_free_name
      t.string :secondary_free_link
      t.string :primary_web_source_name
      t.string :primary_web_source_link
      t.string :secondary_web_source_name
      t.string :secondary_web_source_link
      t.string :primary_sub_source_name
      t.string :primary_sub_source_link
      t.string :secondary_sub_source_name
      t.string :secondary_sub_source_link
      t.string :cs_media_link
      t.string :trailer
      t.string :sm_img
      t.string :md_img
      t.string :lg_img

      t.timestamps
    end
  end
end
