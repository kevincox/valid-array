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
  
  # Exception to raise to silently skip insertion.
  #
  # Raising this from validate will prevent the item from being inserted.  Use
  # with caution as it may break assumptions that coders are making about how
  # your array works.
  class DontInsertException < Exception; end

  # Default validator.  Override this.
  #
  # Translates the provided item to insert to the new item.  Raise an exception
  # to prevent insertion.  DontInsertException will be handled and ignored,
  # other exceptions will be propergated.
  #
  # @param element [Object] The element being added to the array.
  # @return [Object] The element to actualy insert into the array.
  def validate(element)
    raise NotImplementedError, "You must implement validate."
  end
end
