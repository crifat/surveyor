module Api
  module V1
    module Answer
      class Creator
        attr_reader :question, :survey, :next_question

        def initialize(params)
          @params = params
          @question_id = params[:question_id]
          @survey_id = params[:survey_id]
          @api_response = nil
          @next_question = nil
        end

        def self.create(params)
          self.new(params).create
        end

        def create
          entry_answer

          self
        end

        private

        def entry_answer
          @survey = Survey.find_by(id: @survey_id)
          @question = @survey.questions.find_by(id: @question_id)
          @answer = ::Answer.create!
          if @params[:answer_option_ids].present?
            @params[:answer_option_ids].each do |id|
              @option = AnswerOption.find(id)
              QuestionAnswer.create!(question_id: self.question.id, answer_id: @answer.id, answer_text: @option.option_value)
            end
            if @option.next_question_id.present?
              @next_question = @survey.questions.find(@option.next_question_id)
            else
              @next_question = @survey.questions.where.not(id: @question.id).where('questions.order >= ?', @question.order).first
            end
          else
            QuestionAnswer.create!(question_id: self.question.id, answer_id: @answer.id, answer_text: @params[:answer_text])
          end
        end
      end
    end
  end
end