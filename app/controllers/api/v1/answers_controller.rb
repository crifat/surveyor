class Api::V1::AnswersController < ApiBaseController
  before_action :set_survey, only: [:index, :create]
  before_action :check_question, only: [:create]

  def index
    @questions = @survey.questions.includes(:answers)

    success_response data: {questions: @questions.map(&:serialized_data_with_answer)}
  end

  def create
    result = Api::V1::Answer::Creator.create(params)

    success_response data: {next_question: result.next_question.serialized_data}, status: :created
  rescue => e
    error_response message: e.message
  end

  protected

  def set_survey
    @survey = Survey.find_by(id: params[:survey_id])

    error_response(message: 'Invalid Survey!', status: :not_found) unless @survey.present?
  end

  def check_question
    question = @survey.questions.find_by(id: params[:question_id])

    error_response(message: 'Invalid Question!', status: :not_found) unless question.present?
  end
end
