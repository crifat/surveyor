FactoryBot.define do
  factory :answer_option do
    question_id { nil }
    next_question_id { nil }
    option_text { Faker::Lorem.word }
    option_value { Faker::Lorem.word }
    order { 1 }
  end
end