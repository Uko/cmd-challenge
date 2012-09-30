FactoryGirl.define do
  factory :user do
    email "some@e.mail"
    password  "some_pass"
    
    factory :user_with_tasks do
      
      ignore do
        tasks_count 5
      end
      
      after(:create) do |user, evaluator|
          FactoryGirl.create_list(:task, evaluator.tasks_count, user: user)
      end
      
    end
    
  end
end
