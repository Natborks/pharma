require 'test_helper'

class PharmacyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @pharmacy = Pharmacy.new(name: "Brobson", email: "brobson@example.com",
                  password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @pharmacy.valid?
  end

  test "name should be present" do
    @pharmacy.name = "     "
    assert_not @pharmacy.valid?
  end

  test "email should be present" do
    @pharmacy.email = "     "
    assert_not @pharmacy.valid?
  end

  test "name should not be too long" do
    @pharmacy.name = "a" * 51
    assert_not @pharmacy.valid?
  end

  test "email should not be too long" do
    @pharmacy.email = "a" * 244 + "@example.com"
    assert_not @pharmacy.valid?
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @pharmacy.email = invalid_address
      assert_not @pharmacy.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @pharmacy.dup
    duplicate_user.email = @pharmacy.email.upcase
    @pharmacy.save
    assert_not duplicate_user.valid?
 end

 test "password should be present (nonblank)" do
    @pharmacy.password = @pharmacy.password_confirmation = " " * 6
    assert_not @pharmacy.valid?
  end

  test "password should have a minimum length" do
    @pharmacy.password = @pharmacy.password_confirmation = "a" * 5
    assert_not @pharmacy.valid?
  end
end
