class AddCategoryReferenceToItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :category, foreign_key: true
  end
end
