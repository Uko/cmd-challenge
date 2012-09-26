class AddUserIdToTasks < ActiveRecord::Migration
  def up
    Task.delete_all
    
    add_column :tasks, :user_id, :int
  end
  
  def down
    remove_column :tasks, :user_id
  end
end
