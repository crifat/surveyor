class Api::V1::SurveysController < ApiBaseController
  before_action :set_survey, only: [:show]

  def show
    success_response data: @survey.serialized_data
  end

  protected

  def set_survey
    @survey = Survey
                  .includes(questions: :answer_options) # To avoid N+1 Query
                  .order('answer_options.order asc, answer_options.updated_at desc') # To avoid N+1 Query
                  .find_by(id: params[:id])

    error_response(message: 'Invalid Survey!', status: :not_found) unless @survey.present?
  end
end
