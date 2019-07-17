class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :students, :advisor_id, :Advisor
  end
end
