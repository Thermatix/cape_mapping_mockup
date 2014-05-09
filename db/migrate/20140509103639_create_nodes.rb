class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.references :service
      t.integer :type
      t.integer :evo_value
      t.integer :value_chain

      t.timestamps
    end
  end
end
