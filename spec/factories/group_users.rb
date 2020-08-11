FactoryBot.define do
  factory :group_user do
    user_id { 1 }
    group_id { 1 }
    permit_status { false }
    join_status { 1 }
  end
end
