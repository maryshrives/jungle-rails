require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should create new user if given all correct fields' do
      @user = User.create!(first_name: 'Wedge', last_name: 'Antilles', email: 'x@x.co', password: 'chewie', password_confirmation: 'chewie')
      expect(@user).to be_valid
    end

    it 'should not be valid if given email is not unique, case insensitive' do
      @user1 = User.create!(first_name: 'Wedge', last_name: 'Antilles', email: 'x@x.co', password: 'chewie', password_confirmation: 'chewie')
      @user2 = User.new(first_name: 'Ben', last_name: 'Solo', email: 'X@x.co', password: 'amidala', password_confirmation: 'amidala')
      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages).to include('Email has already been taken')
    end

    it 'should not be valid if first name is missing' do
      @user = User.new(first_name: nil, last_name: 'Antilles', email: 'x@x.co', password: 'chewie', password_confirmation: 'chewie')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include('First name can\'t be blank')
    end

    it 'should not be valid if last name is missing' do
      @user = User.new(first_name: 'Wedge', last_name: nil, email: 'x@x.co', password: 'chewie', password_confirmation: 'chewie')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include('Last name can\'t be blank')
    end

    it 'should not be valid if email is missing' do
      @user = User.new(first_name: 'Wedge', last_name: 'Antilles', email: nil, password: 'chewie', password_confirmation: 'chewie')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include('Email can\'t be blank')
    end

    it 'should not be valid if password is missing' do
      @user = User.new(first_name: 'Wedge', last_name: 'Antilles', email: 'x@x.co', password: nil, password_confirmation: 'chewie')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include('Password can\'t be blank')
    end

    it 'should not be valid if password_confirmation is missing' do
      @user = User.new(first_name: 'Wedge', last_name: 'Antilles', email: 'x@x.co', password: 'chewie', password_confirmation: nil)
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include('Password confirmation is too short (minimum is 6 characters)')
    end

    it 'should not be valid if password is less than 6 chars' do
      @user = User.new(first_name: 'Wedge', last_name: 'Antilles', email: 'x@x.co', password: 'chew', password_confirmation: 'chew')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'should not be vaild is password is not equal to password_confirmation' do
      @user = User.new(first_name: 'Wedge', last_name: 'Antilles', email: 'x@x.co', password: 'chewie', password_confirmation: 'amidala')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include('Password confirmation doesn\'t match Password')
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should take in email and pass, authenticate the user, return instance of the user' do
      @user = User.create!(first_name: 'Wedge', last_name: 'Antilles', email: 'x@x.co', password: 'chewie', password_confirmation: 'chewie')
      @user2 = User.authenticate_with_credentials('x@x.co', 'chewie')
      expect(@user2).to be == @user
    end

    it 'should return nil if there isn\'t a user with that email' do
      @user = User.create!(first_name: 'Wedge', last_name: 'Antilles', email: 'x@x.co', password: 'chewie', password_confirmation: 'chewie')
      @user2 = User.authenticate_with_credentials('x@x.com', 'chewie')
      expect(@user2).to be nil
    end

    it 'should return nil if the password does not match the users password' do
      @user = User.create!(first_name: 'Wedge', last_name: 'Antilles', email: 'x@x.co', password: 'chewie', password_confirmation: 'chewie')
      @user2 = User.authenticate_with_credentials('x@x.co', 'amidala')
      expect(@user2).to be nil
    end

    it 'should return an instance of the user even if there is whitespace before or after the email' do
      @user = User.create!(first_name: 'Wedge', last_name: 'Antilles', email: 'x@x.co', password: 'chewie', password_confirmation: 'chewie')
      @user2 = User.authenticate_with_credentials('    x@x.co', 'chewie')
      expect(@user2).to be == @user
    end

    it 'should return an instance of the user even if the email\'s case is different than during registration' do
      @user = User.create!(first_name: 'Wedge', last_name: 'Antilles', email: 'x@x.co', password: 'chewie', password_confirmation: 'chewie')
      @user2 = User.authenticate_with_credentials('X@X.co', 'chewie')
      expect(@user2).to be == @user
    end
  end
end
