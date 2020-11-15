class AnswersController < ApplicationController
  before_action :set_survey, only: [:create, :index]
  before_action :check_question, only: [:create]

  def index
    @questions = @survey.questions.includes(:answers)
  end

  def create
    result = Api::V1::Answer::Creator.create(params)

    return redirect_to survey_question_path(result.survey, result.next_question) if result.next_question.present?

    flash[:success] = "Survey successfully completed!"
    redirect_to '/'

  rescue => e
    flash[:error] = e.message
    redirect_back fallback_location: '/'
  end

  protected

  def set_survey
    @survey = Survey.find(params[:survey_id])
  end

  def check_question
    @question = @survey.questions.find(params[:question_id])
  end
end
