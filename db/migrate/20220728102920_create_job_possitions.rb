class CreateJobPossitions < ActiveRecord::Migration
  def change
    create_table :job_possitions do |t|
      t.string :job_position
      t.boolean :status

      t.timestamps
    end
  end
end
