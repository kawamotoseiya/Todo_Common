FactoryBot.define do
  factory :user do
  	name {'factorybot'}
    email {'example@example'}
    password {'password'}
    password_confirmation {'password'}
  end
  factory :user2 do
  	name {'factorybot2'}
    email {'example2@example'}
    password {'password2'}
    password_confirmation {'password2'}
  end
 end