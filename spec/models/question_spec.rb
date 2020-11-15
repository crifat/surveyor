require 'rails_helper'

RSpec.describe Question, type: :model do
  # associations
  it { should belong_to(:survey) }
  it { should have_many(:answer_options) }
  it { should have_many(:question_answers) }
  it { should have_many(:answers) }

  # validations
  it { should validate_presence_of(:question_text) }
end
