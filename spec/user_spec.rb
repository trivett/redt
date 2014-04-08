require "spec_helper"

describe User do
  subject(:user){User.new({
    name: "Patrick",
    email: "pat@gmail.com",
    password: "abcd",
    password_confirmation: "abcd"
  })}


  it { should have_many(:posts) }
  it { should validate_presence_of(:name) }
  it { should have_secure_password }
  it { should have_many(:posts) }

  it do
    patrick = User.create!(name: "Patrick", email: "pat@gmail.com",password: "abcd", password_confirmation: "abcd")
    should validate_uniqueness_of(:email)
  end

end
