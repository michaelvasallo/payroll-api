class PayrollCalculatorService
  def initialize(time_reports)
    @time_reports = time_reports
    @employee_reports = []
  end

  def call
    @time_reports.each do |time_report|
      time_report.time_entries.group_by(&:employee_id).each do |employee_id, entries|
        calculate_employee_reports(employee_id, entries)
      end
    end

    @employee_reports.sort_by! { |report| [report[:employeeId], report[:payPeriod][:startDate]] }
    { employeeReports: @employee_reports }
  end

  private

  def calculate_employee_reports(employee_id, entries)
    entries.group_by(&:pay_period).each do |pay_period, grouped_entries|
      @employee_reports << {
        employeeId: employee_id.to_s,
        payPeriod: {
          startDate: pay_period.first.strftime('%Y-%m-%d'),
          endDate: pay_period.last.strftime('%Y-%m-%d')
        },
        amountPaid: "$#{format('%.2f', grouped_entries.sum(&:pay_amount))}"
      }
    end
  end
end
