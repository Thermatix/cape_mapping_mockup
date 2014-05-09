class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :node_a
      t.string :node_b
      t.integer :direction
      t.references :map
      
      t.timestamps
    end
  end
end
