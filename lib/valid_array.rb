# :include: ../README.rdoc

require 'valid_array/functions'

# Provides ValidArray functionality to a subclass of Array
# when extended in the class's definiton
module ValidArray
  # Hook the extension process in order to include the necessary functions
  # and do some basic sanity checks.
  def self.extended(mod)
    mod.module_exec(self::Functions) do |functions_module|
      include functions_module
    end
  end

  # Default validator.  Override this.
  def validate(element)
    raise NotImplementedError, "You must implement validate."
  end
end
