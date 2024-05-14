RSpec.describe CsvParserService do
  subject(:service) { CsvParserService.new(file) }
  let(:file) { File.open(Rails.root.join('spec', 'fixtures', 'files', 'sample.csv')) }

  describe '#call' do
    it 'parses CSV file and returns data' do
      csv_data = service.call

      expect(csv_data.size).to eq(4)
      expect(csv_data.first).to include(
        date: '4/1/2023',
        hours_worked: '10',
        employee_id: '1',
        job_group: 'A'
      )
    end
  end
end
