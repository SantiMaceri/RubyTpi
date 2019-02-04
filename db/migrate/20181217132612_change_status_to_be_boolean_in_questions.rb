class ChangeStatusToBeBooleanInQuestions < ActiveRecord::Migration[5.2]
  def change
  	  remove_column :questions, :status
  	  add_column :questions, :status, :boolean, null: false, default: false

  end
end
