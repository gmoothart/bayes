require 'rubygems'
require 'Shoulda'
require '../bayes'

class DiscreteVar < Test::Unit::TestCase
  context "a random variable" do
    
    should "be boolean by default" do
      a = Bayes::RV.new
      assert_equal 2, a.domain.size, "default RV does not have 2 values in its domain!"
      assert_not_nil a[false], "default RV does not have false as one of its domain values"
      assert_not_nil a[true], "default RV does not have true as one of its domain values"
    end

    should "accept an array of domain values in ctor" do
      a = Bayes::RV.new [:yes, :no, :maybe]
      assert_equal 3, a.domain.size
    end

    should "accept domain and distribution in ctor as hash" do
      a = Bayes::RV.new :yes => 0.2, :no => 0.3, :maybe => 0.5
      assert_equal 3, a.domain.size
    end

    should "initialize domain values to nil if not specified" do
      a = Bayes::RV.new
      assert_nil a[false].val, "false probability not initialized to nil!"
      assert_nil a[true].val, "true probability not initialized to nil!"
    end

    should "use unary ~ as a shortcut for boolean false value" do
      a = bayes::RV.new 
      assert_same a[false], ~a, 'unary ~ is not the same as rv[false]!'
    end

    should "use unary+ as a shortcut for boolean true value" do
      a = bayes::RV.new 
      assert_same a[true], +a, 'unary + is not the same as rv[true]!'
    end
  end
end
