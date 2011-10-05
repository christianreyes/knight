class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :location
      t.integer :project_type_id

      t.timestamps
    end
  end
end
