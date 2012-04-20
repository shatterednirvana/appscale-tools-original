# Programmer: Chris Bunch


require 'infrastructure'


# Provides an implementation of Infrastructure that can be used to acquire
# virtual machines running in Amazon's Elastic Compute Cloud (EC2). VMs in
# EC2 are fully self-service and expose root-level access to users, allowing
# us to run any programs (assuming we've installed and configured any
# dependencies they may require).
class InfrastructureEC2 < Infrastructure


  # The name of this service - here, it's Amazon's Elastic Compute Cloud (EC2).
  NAME = "EC2"


  # A list of the credentials needed to access EC2 - just the access key and
  # secret key for EC2.
  REQUIRED_CREDENTIALS = ["EC2_ACCESS_KEY", "EC2_SECRET_KEY"]


  # The access key (equivalent to a username in Linux-speak) that is used
  # to access any of Amazon Web Services (including EC2).
  attr_accessor :ACCESS_KEY


  # The secret key (equivalent to a password in Linux-speak) that is used
  # to access any of Amazon Web Services (including EC2).
  attr_accessor :SECRET_KEY


  # Creates a new Infrastructure that can be used to interact with Amazon EC2.
  # For EC2, the user needs to give us their access key and their secret key.
  # TODO(cgb): what's the quickest way to validate that the credentials a
  # user gives us are actually valid?
  def initialize(credentials)
    require_credentials(REQUIRED_CREDENTIALS, credentials)

    @ACCESS_KEY = credentials['EC2_ACCESS_KEY']
    @SECRET_KEY = credentials['EC2_SECRET_KEY']
  end


end
