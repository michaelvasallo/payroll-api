class CsvParserService
  def initialize(file)
    @file = file
  end

  def call
    [].tap do |data|
      CSV.foreach(@file.path, headers: true) do |row|
        data << {
          date: row['date'],
          hours_worked: row['hours worked'],
          employee_id: row['employee id'],
          job_group: row['job group']
        }
      end
    end
  end
end
