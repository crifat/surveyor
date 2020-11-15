AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

survey = Survey.create!(name: 'Test Survey 1', description: 'Test Survey 1 description.')
q1 = survey.questions.create!(question_text: 'Test Survey 1 Question 1', order: 1, question_type: 'single_choice')
q2 = survey.questions.create!(question_text: 'Test Survey 1 Question 2', order: 2, question_type: 'single_choice')
q3 = survey.questions.create!(question_text: 'Test Survey 1 Question 3', order: 3, question_type: 'multiple_choice')
q4 = survey.questions.create!(question_text: 'Test Survey 1 Question 4', order: 4, question_type: 'free_text')

q1o1 = q1.answer_options.create!(
    option_text: 'Test Survey 1 Question 1 Option 1 Label',
    option_value: 'Test Survey 1 Question 1 Option 1 Value',
    order: 1,
    next_question_id: q3.id
)
q1o2 = q1.answer_options.create!(
    option_text: 'Test Survey 1 Question 1 Option 2 Label',
    option_value: 'Test Survey 1 Question 1 Option 2 Value',
    order: 1,
    next_question_id: q4.id
)

q2o1 = q2.answer_options.create!(
    option_text: 'Test Survey 1 Question 2 Option 1 Label',
    option_value: 'Test Survey 1 Question 2 Option 1 Value',
    order: 1
)
q2o2 = q2.answer_options.create!(
    option_text: 'Test Survey 1 Question 2 Option 2 Label',
    option_value: 'Test Survey 1 Question 2 Option 2 Value',
    order: 2
)

q3o1 = q3.answer_options.create!(
    option_text: 'Test Survey 1 Question 3 Option 1 Label',
    option_value: 'Test Survey 1 Question 3 Option 1 Value',
    order: 1
)
q3o2 = q3.answer_options.create!(
    option_text: 'Test Survey 1 Question 3 Option 2 Label',
    option_value: 'Test Survey 1 Question 3 Option 2 Value',
    order: 2
)