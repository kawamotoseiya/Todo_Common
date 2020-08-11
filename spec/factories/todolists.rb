FactoryBot.define do
  factory :todolist do
    group_id { 1 }
    head { "MyString" }
    body { "MyText" }
  end
end
