class RemoveNullConstraintFromShippings < ActiveRecord::Migration[7.0]
  def change
    change_column_null :shippings, :building_name,  true
  end
end
