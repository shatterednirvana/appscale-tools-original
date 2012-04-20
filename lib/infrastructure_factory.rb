# Programmer: Chris Bunch


require 'infrastructure_ec2'


# InfrastructureFactory provides callers with a single interface to any
# of the infrastructures supported by AppScale.
class InfrastructureFactory


  def self.get_infrastructure(name, credentials)
    case name
    when InfrastructureEC2::NAME
      return InfrastructureEC2.new(credentials)
    else
      raise NotImplementedError
    end
  end

end
