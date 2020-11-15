require 'rails_helper'

RSpec.describe AnswerOption, type: :model do
  # associations
  it { should belong_to(:question) }
  it { should belong_to(:next_question) }

  # validations
  it { should validate_presence_of(:option_text) }
  it { should validate_presence_of(:option_value) }
end
