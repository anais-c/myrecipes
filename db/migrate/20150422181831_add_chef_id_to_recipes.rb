class AddChefIdToRecipes < ActiveRecord::Migration
  def change
    # :recipes es el nombre de la tabla, :chef_id es el nombre de la nueva columna y integer es el tipo de dato de esta columna.
    add_column :recipes, :chef_id, :integer
  end
end
