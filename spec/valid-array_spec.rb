require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe ValidArray do
  context 'when custom validator is used' do
    before :each do
      class MyArray < Array
        extend ValidArray
        
        def self.validate(e)
          e.to_s
        end
      end
      @typed_ary = MyArray.new(5) {|i| i}
    end
    
    it 'should convert all values to strings' do
      @typed_ary.each do |e|
        e.should be_an_instance_of(String)
      end
    end
  end
end
