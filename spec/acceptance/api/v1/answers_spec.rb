require 'acceptance_helper'

resource 'Answer' do
  header "Content-Type", "application/json"

  route "/api/v1/surveys/:survey_id/answers", "Show Survey" do
    parameter :survey_id, "Survey Id", type: :integer, example: 1, required: true
    let!(:survey) { create(:survey) }
    let(:survey_id) { survey.id }

    get 'Get Answers' do
      context 'when success' do
        let!(:question_1) { create(:question, survey_id: survey.id) }
        let!(:answer_1) { create(:answer) }
        let!(:question_answer_1) { create(:question_answer, question_id: question_1.id, answer_id: answer_1.id) }
        example '200' do

          do_request

          res = JSON.parse(response_body)

          expect(res['data']['questions'].size).to be > 0
          expect(status).to eq(200)
        end
      end

      context 'when failed' do
        let(:survey_id) { 'a' }
        example '404' do

          do_request

          expect(status).to eq(404)
        end
      end
    end

    parameter :survey_id, "Survey Id", type: :integer, example: 1, required: true
    parameter :question_id, "Question Id", type: :integer, example: 1, required: true
    parameter :answer_option_ids, "Selected Answer Option Ids", type: :integer, example: 1, required: false
    parameter :answer_text, "Answer typed by user", type: :integer, example: 1, required: false

    let!(:question_2) { create(:question, survey_id: survey.id, question_type: :single_choice) }
    let!(:question_3) { create(:question, survey_id: survey.id, order: 2) }
    let!(:question_4) { create(:question, survey_id: survey.id, order: 3) }
    let!(:answer_option_21) { create(:answer_option, question_id: question_2.id, next_question_id: question_4.id) }
    let!(:answer_option_22) { create(:answer_option, question_id: question_2.id) }

    let!(:survey_id) { survey.id }
    let!(:question_id) { question_2.id }
    post 'Submit Answer' do
      context 'when success' do
        let(:params) { {question_id: question_2.id, answer_option_ids: [answer_option_22.id]}.to_json }
        example '200' do

          do_request

          res = JSON.parse(response_body)

          expect(res['data']['next_question']['id']).to eq(question_3.id)
          expect(status).to eq(201)
        end
      end

      context 'With Logic Jump' do
        let(:params) { {question_id: question_2.id, answer_option_ids: [answer_option_21.id]}.to_json }
        example '200' do

          do_request

          res = JSON.parse(response_body)

          expect(res['data']['next_question']['id']).to eq(question_4.id)
          expect(status).to eq(201)
        end
      end

      context 'when failed' do
        let(:survey_id) { 'a' }
        let(:params) { {question_id: 'a', answer_option_ids: [answer_option_21.id]}.to_json }
        example '404' do

          do_request

          expect(status).to eq(404)
        end
      end
    end
  end

end