require 'rails_helper'


RSpec.describe 'Tasks', type: :request do
  describe 'GET /tasks' do
    let(:url) { '/tasks' }

    context 'when the request is valid' do
      before { get url }

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'render appropriate view' do
        expect(response).to render_template(:index)
      end
    end
  end

  describe 'POST /tasks' do
    let(:url) { '/tasks' }
    let(:valid_params) do
      {
        'task': {
          'addresses_attributes': {
            '0': {
              'uri': Faker::Internet.url
            },
            '1': {
              'uri': Faker::Internet.url,
            }
          }
        }
      }
    end

    let(:invalid_params) do
      {
        'task': {
          'addresses_attributes': {
            '0': {
              'uri': nil
            }
          }
        }
      }
    end

    context 'when params is valid' do
      before { post url, params: valid_params }

      it 'returns status code 302' do
        expect(response).to have_http_status(:found)
      end

      it 'creates a task' do
        expect(Task.count).to eq(1)
      end

      it 'performs ParseWorker for addresses' do
        expect(ParseWorker.jobs.size).to eq(2)
      end
    end

    context 'when params is invalid' do
      before { post url, params: invalid_params }

      it 'render appropriate view' do
        expect(response).to render_template(:new)
      end

      it 'does not create task' do
        expect(Task.count).to eq(0)
      end
    end
  end

  describe 'DELETE /tasks/:id' do
    before do
      create_list(:task, 2)
      delete url
    end

    let(:url) { "/tasks/#{Task.first.id}"}

    it 'delete selected task' do
      expect(Task.count).to eq(1)
    end
  end
end
