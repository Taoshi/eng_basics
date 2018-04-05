# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fib do
    sequence_length 10
  end
end
