class CreateSimilarServices < ActiveRecord::Migration
  def change
    create_table :similar_services do |t|
      t.references :services, index: true

      t.timestamps
    end
  end
end
