class AddUserToIngredients < ActiveRecord::Migration[4.2]
  def change
    add_reference :ingredients, :user, index: true, foreign_key: true
  end
end
