require 'rails_helper'

RSpec.describe QuestionAnswer, type: :model do
  # associations
  it { should belong_to(:question) }
  it { should belong_to(:answer) }

  # validations
  it { should validate_presence_of(:answer_text) }
end
