require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'validates all presence ' do
      @user = User.new(first: "first", last: "last", email: "123@123.com", password: "1234", password_confirmation: "1234")
      @user.save!
      expect(@user.id).to be_present
    end
    it 'validates password presence ' do
      @user = User.new(first: "first", last: "last", email: "123@123.com", password: nil, password_confirmation: "1234")
      @user.validate
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'validates password_confirmation presence ' do
      @user = User.new(first: "first", last: "last", email: "123@123.com", password: "1234", password_confirmation: [nil])
      @user.validate
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "will not validate if email has been registered" do
      @user = User.new(first:"name", last:"last", email:"sample@email.com", password: "password1234", password_confirmation: "password1234")
      @user.save!
      @user2 = User.new(first:"name", last:"last", email:"sample@email.com", password: "password1234", password_confirmation: "password1234")
      @user2.validate
      expect(@user2.errors.full_messages).to include("Email has already been taken") 
    end
    it 'validates first name presence ' do
      @user = User.new(first: nil, last: "last", email: "123@123.com", password: "1234", password_confirmation: "1234")
      @user.validate
      expect(@user.errors.full_messages).to include("First can't be blank")
    end
    it 'validates last name presence ' do
      @user = User.new(first: "first", last: nil, email: "123@123.com", password: "1234", password_confirmation: "1234")
      @user.validate
      expect(@user.errors.full_messages).to include("Last can't be blank")
    end
    it 'validates email presence ' do
      @user = User.new(first: "first", last: "last", email: nil, password: "1234", password_confirmation: "1234")
      @user.validate
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'validates password lenth ' do
      @user = User.new(first: "first", last: "last", email: "123@123.com", password: "12", password_confirmation: "12")
      @user.validate
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
    end
  end
  describe '.authenticate_with_credentials' do
    it "nil if no user is found" do
      @result = User.authenticate_with_credentials("123@123.com", "1234")
      expect(@result).to be_nil
    end

    it "return user if user is found" do
      @user = User.new(first:"name", last: "last", email: "123@123.com", password: "1234", password_confirmation: "1234")
      @user.save!
      @result = User.authenticate_with_credentials("123@123.com", "1234")
      expect(@result).to eq(@user)
    end

    it "return user even if email is in a different case" do
      @user = User.new(first:"name", last: "last", email: "123@123.cOm", password: "1234", password_confirmation: "1234")
      @user.save!
      @result = User.authenticate_with_credentials("123@123.com", "1234")
      expect(@result).to eq(@user)
    end
  end

end
