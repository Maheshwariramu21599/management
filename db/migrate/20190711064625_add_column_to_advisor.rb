class AddColumnToAdvisor < ActiveRecord::Migration[5.2]
  def change
    add_column :advisors, :email ,:string
  end
end
