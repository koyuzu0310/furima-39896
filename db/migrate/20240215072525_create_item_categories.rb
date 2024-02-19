class CreateItemCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :item_categories do |t|
      t.string     :title        , null: false
      t.text       :text         , null: false
      t.integer    :item_category     , null: false
      t.timestamps
    end
  end
end
