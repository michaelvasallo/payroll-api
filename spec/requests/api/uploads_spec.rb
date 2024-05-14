require 'rails_helper'

RSpec.describe 'Api::Uploads', type: :request do
  let(:file) { fixture_file_upload('time-report-42.csv', 'text/csv') }

  describe 'POST /api/uploads' do
    context 'with valid CSV file' do
      it 'uploads the file' do
        post api_uploads_url, params: { file: }

        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).to eq({ 'message' => 'File uploaded successfully' })
      end
    end

    context 'with invalid CSV file' do
      before { TimeReport.create(id: 42) }

      it 'returns unprocessable entity' do
        post api_uploads_url, params: { file: }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to eq({ 'error' => 'Report ID 42 already exists' })
      end
    end
  end
end
