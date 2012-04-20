# Programmer: Chris Bunch


require 'custom_exceptions'


# Infrastructure provides an interface that defines what services an
# infrastructure should provide. This abstracts away all the details of each
# individual infrastructure so that callers can use these services without
# having to know the particulars of each infrastructure (assuming they give
# us the proper credentials to interact with it).
class Infrastructure


  # Creates a new Infrastructure with the given credentials. It is this
  # method's responsibility to validate that the caller has given us all
  # the credentials needed to interact with this infrastructure and that they
  # are valid.
  def initialize(credentials)
    raise NotImplementedError
  end


  def require_credentials(required, given)
    required.each { |cred|
      if given[cred].nil?
        raise BadConfigurationException.new("#{cred} cannot be empty")
      end
    }
  end

end
