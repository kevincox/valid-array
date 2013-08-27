# :include: ../README.rdoc

require 'valid-array/functions'

# Provides ValidArray functionality to a subclass of Array
# when extended in the class's definiton
module ValidArray
  # Hook the extension process in order to include the necessary functions
  # and do some basic sanity checks.
  def self.extended(mod)
    unless mod <= Array
      raise UnexpectedTypeException.new([Array], mod.class)
    end
    mod.module_exec(self::Functions) do |functions_module|
      include functions_module
    end
  end

  # Default validator.  Override this.
  def validate(element)
    raise NotImplementedError, "You must implement validate."
  end

  # The exception that is raised when an Unexpected Type is reached during validation
  class UnexpectedTypeException < Exception
    # Provide access to the types of objects expected and the class of the object received
    attr_reader :expected, :received

    def initialize(expected_one_of, received)
      @expected = expected_one_of
      @received = received
    end

    def to_s
      %{Expected one of #{@expected.inspect} but received a(n) #{@received}}
    end
  end
end
