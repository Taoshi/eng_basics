require 'spec_helper'

describe Fib do
  let(:fib) { create(:fib) }

  it 'should be valid factory' do
    expect(fib).to be_valid
  end

  describe 'before_save' do
    context 'invoke callback' do
      it 'generate_sequence' do
        expect(fib.sequence).to eq([0, 1, 1, 2, 3, 5, 8, 13, 21, 34])
      end

      it 'sum of squares' do
        expect(fib.sum_of_squares).to eq(1870)
      end
    end
  end

  context 'validations' do
    it { should validate_length_of(:sequence_length) }
    it { should validate_presence_of(:sequence_length) }
    it { should validate_numericality_of(:sequence_length).is_greater_than(0) }
  end

  it 'is known fib?' do
    expect(fib.is_known_fib?(1)).to be(true)
  end

  it 'all fibs?' do
    expect(fib.all_fibs?([123, 4])).to be(false)
  end
end
