$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'infrastructure_factory'


require 'flexmock/test_unit'


class TestInfrastructures < Test::Unit::TestCase


  def setup

  end

  
  def test_factory_for_ec2
    name = InfrastructureEC2::NAME
    creds = {'EC2_ACCESS_KEY' => 'access', 'EC2_SECRET_KEY' => 'secret'}
    ec2 = InfrastructureFactory.get_infrastructure(name, creds) 

    assert_equal('access', ec2.ACCESS_KEY)
    assert_equal('secret', ec2.SECRET_KEY)
  end


end
