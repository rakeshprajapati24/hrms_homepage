class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :FirstName
      t.string :LastName
      t.string :Company
      t.string :jobPosition
      t.integer :Employees
      t.string :Solution
      t.string :Email
      t.timestamps
    end
  end
end
