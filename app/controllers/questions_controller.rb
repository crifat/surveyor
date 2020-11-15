class QuestionsController < ApplicationController
  def show
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.find(params[:id])
    @answer_options = @question.answer_options
  end
end
