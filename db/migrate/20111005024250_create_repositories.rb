class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :location
      t.integer :project_type

      t.timestamps
    end
  end
end
