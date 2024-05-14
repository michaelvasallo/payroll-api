## Instructions

### Building and Running the Application

1. Install Ruby 3.3.1
2. Install dependencies: `bundle install`
3. Run migrations: `rails db:migrate`
4. Start the Rails server: `rails s`
5. You can now access the application at `http://localhost:3000`.

### Testing

1. Run RSpec tests: `rspec`

## Answers to Questions

### How did you test that your implementation was correct?

I wrote service tests and request tests using RSpec to ensure that the API works as expected.

### If this application was destined for a production environment, what would you add or change?

In a production environment, I'd imagine the employee reports and payroll reports would have their own database tables. By pre-calculating and storing this data, it would significantly improve the speed of data retrieval, which is crucial for scalability. In this scenario, payroll reports might be paginated instead of fetching all records at once, or potentially could be filtered by employee.

Also, I would add authentication and authorization to secure the endpoints, implement additional data validation, error handling, logging, rate limiting, and monitoring.

### What compromises did you have to make as a result of the time constraints of this challenge?

Due to time constraints, I skipped model tests and prioritized tests for the services and requests. Also, I chose to only test happy paths to ensure basic functionality was covered.
