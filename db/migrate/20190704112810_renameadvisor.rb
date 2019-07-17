class Renameadvisor < ActiveRecord::Migration[5.2]
  def change
    rename_column :students, :Advisor, :advisor_id
  end
end
