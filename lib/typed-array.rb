# Provides compatibility with https://github.com/yaauie/typed-array

require 'valid_array/typed_array'

TypedArray = ValidArray::TypedArray
def TypedArray(*args)
	ValidArray::TypedArray *args
end
