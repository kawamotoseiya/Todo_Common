FactoryBot.define do
  factory :group do
    user_id { 1 }
    name { "MyString" }
    group_key_flag { true }
  end
  factory :group2 do
    user_id { 2 }
    name { "MyString2" }
    group_key_flag { true }
   end
end
