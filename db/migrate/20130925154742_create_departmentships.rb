class CreateDepartmentships < ActiveRecord::Migration
  def change
    create_table :departmentships do |t|
      t.integer :community_id
      t.integer :department_id

      t.timestamps
    end
  end
end
