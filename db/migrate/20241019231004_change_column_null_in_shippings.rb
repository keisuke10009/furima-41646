class ChangeColumnNullInShippings < ActiveRecord::Migration[7.0]
  def change
    change_column_null :shippings, :street_address,  false
  end
end
