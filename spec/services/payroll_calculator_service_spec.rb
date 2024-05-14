require 'rails_helper'

RSpec.describe PayrollCalculatorService do
  subject(:service) { PayrollCalculatorService.new(time_reports) }

  describe '#call' do
    let(:time_report) do
      TimeReport.create(time_entries_attributes: [
                          { date: '2023-01-04', hours_worked: 10, employee_id: 1, job_group: 'A' },
                          { date: '2023-01-14', hours_worked: 5, employee_id: 1, job_group: 'A' },
                          { date: '2023-01-20', hours_worked: 3, employee_id: 2, job_group: 'B' },
                          { date: '2023-01-20', hours_worked: 4, employee_id: 1, job_group: 'A' }
                        ])
    end
    let(:time_reports) { [time_report] }

    it 'calculates payroll reports' do
      payroll_report = service.call

      expect(payroll_report[:employeeReports].size).to eq(3)
      expect(payroll_report[:employeeReports]).to include(
        { employeeId: '1', payPeriod: { startDate: '2023-01-01', endDate: '2023-01-15' }, amountPaid: '$300.00' },
        { employeeId: '1', payPeriod: { startDate: '2023-01-16', endDate: '2023-01-31' }, amountPaid: '$80.00' },
        { employeeId: '2', payPeriod: { startDate: '2023-01-16', endDate: '2023-01-31' }, amountPaid: '$90.00' }
      )
    end
  end
end
