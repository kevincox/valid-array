# Provides the validation functions that get included into a ValidArray

# Namespace ValidArray
module ValidArray

  # The functions that get included into ValidArray
  module Functions
    # Validates outcome. See Array#initialize
    def initialize(*args, &block)
      ary = Array.new *args, &block
      self.replace ary
    end

    # Validates outcome. See Array#replace
    def replace(other_ary)
      _ensure_array_is_valid other_ary
      super
    end

    # Validates outcome. See Array#&
    def &(ary)
      self.class.new super
    end

    # Validates outcome. See Array#*
    def *(int)
      self.class.new super
    end

    # Validates outcome. See Array#+
    def +(ary)
      self.class.new super
    end

    # Validates outcome. See Array#<<
    def <<(item)
      self.class.validate length, item
      super
    end

    # Validates outcome. See Array#[]
    def [](idx)
      self.class.new super
    end

    # Validates outcome. See Array#slice
    def slice(*args)
      self.class.new super
    end

    # Validates outcome. See Array#[]=
    def []=(idx, item)
      self.class.validate idx, item
      super
    end

    # Validates outcome. See Array#concat
    def concat(other_ary)
      _ensure_array_is_valid other_ary, length
      super
    end

    # Validates outcome. See Array#eql?
    #def eql?(other_ary)
    #  _ensure_all_items_in_array_are_allowed other_ary
    #  super
    #end

    # Validates outcome. See Array#fill
    def fill(*args, &block)
      ary = self.to_a
      ary.fill *args, &block
      self.replace ary
    end

    # Validates outcome. See Array#push
    def push(*items)
      items = items.dup
      _ensure_array_is_valid items, length
      super
    end

    # Validates outcome. See Array#unshift
    def unshift(*items)
      items = items.dup
      _ensure_array_is_valid items
      super *items
    end

    # Validates outcome. See Array#map!
    def map!(&block)
      self.replace(self.map &block)
    end

    protected

    # Ensure that all items in the passed Array are allowed
    def _ensure_array_is_valid(ary, offset=0)
      ary.each_with_index do |e, i|
       # pp self, self.class.methods
        ary[i] = self.class.validate(i+offset, e)
      end
    end
  end
end
