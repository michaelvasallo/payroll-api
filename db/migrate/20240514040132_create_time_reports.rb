class CreateTimeReports < ActiveRecord::Migration[7.1]
  def change
    create_table :time_reports do |t|

      t.timestamps
    end
  end
end
