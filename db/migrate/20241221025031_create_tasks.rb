class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :details
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end

# when generating the Task model,
# rails creates migration file in db/migrate (here)
# which is responsible for defining the "database schema"
# t.boolean adds completed column to tasks table
# sets data type to boolean
# sets default value to false
# so that completed attribute tracks whether a task has been finished
