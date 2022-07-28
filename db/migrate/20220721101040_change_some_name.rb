class ChangeSomeName < ActiveRecord::Migration
  def change
    rename_column :contacts, :FirstName, :first_name
    rename_column :contacts, :LastName, :last_name
    rename_column :contacts, :Company, :company
    rename_column :contacts, :jobPosition, :job_position
    rename_column :contacts, :Employees, :no_of_employees
    rename_column :contacts, :Solution, :solution
    rename_column :contacts, :Email, :email
  end
end
