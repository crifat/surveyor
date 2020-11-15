ActiveAdmin.register Question do

  permit_params :survey_id, :question_text, :order, :question_type,
                answer_options_attributes: [:id, :question_id, :option_text,
                                            :option_value, :order,
                                            :next_question_id, :_destroy]

  controller do
    before_action :set_survey, only: [:edit, :new]

    private

    def set_survey
      @survey = Survey.find_by(id: params[:survey_id]) || Survey.first
    end
  end

  show do |model|
    attributes_table do
      row :survey
      row :question_text
      row :order
      row :question_type
      row :created_at
      row :updated_at
    end

    if model.answer_options.present?
      panel "Answer Options" do
        table class: "order-items-table" do
          tr do
            th "Option Text"
            th "Option Value"
            th "Order"
            th "Next Question"
            th "Updated At"
            th "Created At"
          end
          model.answer_options.each do |ao|
            tr do
              td ao.option_text
              td ao.option_value
              td ao.order
              td do
                link_to ao.next_question.question_text, admin_question_path(ao.next_question) if ao.next_question.present?
              end
              td ao.updated_at
              td ao.created_at
            end
          end
        end
      end
    end
  end


  form do |f|
    f.semantic_errors *f.object.errors.keys
    tabs do
      tab "Question Details" do
        f.inputs do
          f.input :survey_id, as: :select, collection: Survey.all, selected: survey.id
          f.input :question_text
          f.input :question_type
          f.input :order
        end
      end

      tab "Answer Options" do
        f.has_many :answer_options,
                   heading:       false,
                   new_record:    'Add Option',
                   allow_destroy: true do |i|
          i.input :option_text
          i.input :option_value
          i.input :order
          i.input :next_question_id, input_html: {class: "next-question-select"}, as: :select,
                  collection:            survey.questions.where.not(id: resource&.id).map { |q| [q.question_text, q.id] }
        end
      end
      f.actions
    end

  end


end
