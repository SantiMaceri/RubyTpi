class ChangeStatusToBeBooleanInQuestions < ActiveRecord::Migration[5.2]
  def change
  	  change_column :questions, :status, :boolean

  end
end
