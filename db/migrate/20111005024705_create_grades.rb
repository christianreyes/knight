class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :repository_id
      t.integer :total_pass
      t.integer :total_possible
      t.text :output

      t.timestamps
    end
  end
end
