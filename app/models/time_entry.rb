class TimeEntry < ApplicationRecord
  belongs_to :time_report

  validates :date, :hours_worked, :employee_id, :job_group, presence: true

  def pay_amount
    case job_group
    when 'A'
      hours_worked * 20
    when 'B'
      hours_worked * 30
    else
      0
    end
  end

  def pay_period
    if date.day <= 15
      (date.beginning_of_month..(date.beginning_of_month + 14.days))
    else
      ((date.beginning_of_month + 15.days)..date.end_of_month)
    end
  end
end
