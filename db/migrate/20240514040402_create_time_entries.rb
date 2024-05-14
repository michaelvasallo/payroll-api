class CreateTimeEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :time_entries do |t|
      t.references :time_report, null: false, foreign_key: true
      t.date :date
      t.float :hours_worked
      t.integer :employee_id
      t.string :job_group

      t.timestamps
    end
  end
end
