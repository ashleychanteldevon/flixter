class AlterSectionsAddRowOrder < ActiveRecord::Migration[5.2]
  def change
    add_column : courses, :row_order, :integer
    add_index : courses, :row_order
  end
end