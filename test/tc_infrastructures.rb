$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'custom_exceptions'
require 'infrastructure_factory'


require 'flexmock/test_unit'


class TestInfrastructures < Test::Unit::TestCase


  def setup

  end

  
  def test_factory_for_ec2
    name = InfrastructureEC2::NAME

    # if we don't give all the right credentials, an exception should
    # be thrown
    empty_creds = {}
    assert_raises(BadConfigurationException) {
      InfrastructureFactory.get_infrastructure(name, empty_creds)
    }

    missing_secret_key = {'EC2_ACCESS_KEY' => 'access'}
    assert_raises(BadConfigurationException) {
      InfrastructureFactory.get_infrastructure(name, missing_secret_key)
    }

    # test when we give all the right credentials
    creds = {'EC2_ACCESS_KEY' => 'access', 'EC2_SECRET_KEY' => 'secret'}
    ec2 = InfrastructureFactory.get_infrastructure(name, creds) 

    assert_equal('access', ec2.ACCESS_KEY)
    assert_equal('secret', ec2.SECRET_KEY)
  end


end
