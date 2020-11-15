require 'acceptance_helper'

resource 'Survey' do
  header "Content-Type", "application/json"

  route "/api/v1/surveys/:id", "Show Survey" do
    parameter :id, "Survey Id", type: :integer, example: 1, required: true
    let!(:survey) { create(:survey) }
    let(:id) { survey.id }

    get 'Show Survey' do
      context 'when success' do
        let!(:question) { create(:question, survey_id: survey.id) }
        let(:params) { {id: survey.id} }
        example '200' do

          do_request

          res = JSON.parse(response_body)

          expect(res['data']['questions'].size).to eq(1)

          expect(status).to eq(200)
        end
      end

      context 'when failed' do
        let(:id) { 'a' }
        example '404' do

          do_request

          expect(status).to eq(404)
        end
      end
    end
  end

end