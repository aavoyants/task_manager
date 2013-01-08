class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :project_id
      t.string :name
      t.integer :rank
      t.boolean :is_done
      t.date :expires_on

      t.timestamps
    end
  end
end
