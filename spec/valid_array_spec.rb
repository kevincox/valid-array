require_relative 'spec_helper'
require 'valid_array'

class StringArray < Array
  extend ValidArray
  def self.validate(e)
    e.to_s
  end
end

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
  
  context 'when array is modified' do
    it 'should convert contat arguments' do
      a = StringArray.new
      
      a.concat [1,2,3]
      a.should eql(['1','2','3'])
      
      a.concat [4,5,6]
      a.should eql(['1','2','3','4','5','6'])
    end
  end

  context 'when custom validator is used' do
    before :each do
      class MyArray < Array
        extend ValidArray
        
        def self.validate(e)
          if e%2 == 0
            e
          else
            raise ValidArray::DontInsertException
          end
        end
      end
      
      @typed_ary = MyArray.new(10) {|i| i}
    end
    
    it 'should drop when DontInsertException is raised' do
      @typed_ary.should eql([0,2,4,6,8])
    end
  end
end
