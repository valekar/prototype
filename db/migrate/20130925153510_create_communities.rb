class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.string :name
      t.string :community_image

      t.timestamps
    end
  end
end
