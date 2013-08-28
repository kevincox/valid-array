# Provides compatibility with https://github.com/yaauie/typed-array

require 'valid_array/typed_array'

# Alias for compatibility.
# see {ValidArray::TypedArray}
TypedArray = ValidArray::TypedArray


# Alias for compatibility.
# see {ValidArray::TypedArray}
def TypedArray(*args)
	ValidArray::TypedArray *args
end
