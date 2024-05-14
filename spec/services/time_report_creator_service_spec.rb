require 'rails_helper'

RSpec.describe TimeReportCreatorService do
  subject(:service) { TimeReportCreatorService.new(report_id, time_entries_data) }

  describe '#call' do
    let(:report_id) { 42 }
    let(:time_entries_data) do
      [
        { date: '2024-01-01', hours_worked: 10, employee_id: '1', job_group: 'A' },
        { date: '2024-01-02', hours_worked: 8, employee_id: '2', job_group: 'B' }
      ]
    end

    it 'creates time report and associated time entries' do
      time_report = service.call

      expect(time_report).to be_persisted
      expect(time_report.id).to eq(report_id)
      expect(time_report.time_entries.count).to eq(2)
    end
  end
end
