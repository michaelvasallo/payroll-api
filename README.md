## Overview

This coding challenge involves building a prototype payroll system API designed to handle the upload of CSV files containing employee work hours and generate payroll reports based on this data. The API supports two primary functionalities: uploading time reports and retrieving payroll reports.

The challenge involves creating an API that:

1. Accepts a CSV file upload containing data on hours worked per day per employee.
   - The CSV file includes columns: date, hours worked, employee id, and job group.
   - Employees belong to job groups which determine their hourly wage:
     - Group A: $20/hr
     - Group B: $30/hr
   - The file name format is `time-report-x.csv` where `x` is the report ID.
2. Provides a report detailing the payment due to each employee for each pay period.
   - The report must include the employee ID, pay period (1st to 15th or 16th to end of the month), and the total amount paid to the employee for each pay period.
   - The report should be based on all uploaded time reports and sorted by employee ID and pay period.

### Application Structure

- **Models:**

  - `TimeReport`: Represents the uploaded time report.
  - `TimeEntry`: Represents individual time entries within a time report.

- **Controllers:**

  - `UploadsController`: Handles file uploads.
  - `PayrollReportsController`: Provides the payroll report.

- **Services:**
  - `CsvParserService`: Parses the uploaded CSV file.
  - `TimeReportCreatorService`: Creates time reports and time entries from parsed data.
  - `PayrollCalculatorService`: Calculates payroll based on stored time entries.

### Instructions

#### Building and Running the Application

1. Install Ruby (if not already installed):

   ```sh
   # Using a version manager like rbenv or RVM is recommended
   # Example with rbenv:
   curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-installer | bash
   rbenv install 3.3.1
   rbenv global 3.3.1
   ```

2. Clone the repository:

   ```sh
    git clone <repository-url>
    cd <repository-directory>
   ```

3. Install dependencies:

   ```sh
   bundle install
   ```

4. Run the database migrations:

   ```sh
   rails db:migrate
   ```

5. Run the test suite:

   ```sh
   rspec
   ```

6. Start the Rails server:

   ```sh
   rails server
   ```

7. Access the application at `http://localhost:3000`.

### Answers to Questions

#### How did you test that your implementation was correct?

I wrote service tests and request tests using RSpec to ensure that the API works as expected.

#### If this application was destined for a production environment, what would you add or change?

In a production environment, I'd imagine the employee reports and payroll reports would have their own database tables. By pre-calculating and storing this data, it would significantly improve the speed of data retrieval, which is crucial for scalability. In this scenario, payroll reports might be paginated instead of fetching all records at once, or potentially could be filtered by employee.

Also, I would add authentication and authorization to secure the endpoints, implement additional data validation, error handling, logging, rate limiting, and monitoring.

#### What compromises did you have to make as a result of the time constraints of this challenge?

Due to time constraints, I skipped model tests and prioritized tests for the services and requests. Also, I chose to only test happy paths to ensure basic functionality was covered.
