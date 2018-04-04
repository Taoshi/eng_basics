# generates, stores and calculates retained fibonacci sequence numbers

class Fibs
  attr_accessor :generated_fibs

  def initialize
    @generated_fibs = []
  end

  def generate x
    raise ArgumentError, 'Should be more or equal 0' if x < 0
    generate_fibs x
  end

  def is_known_fib? num
    @generated_fibs.include?(num)
  end

  def all_fibs? seq_array
    @generated_fibs == seq_array
  end

  def known_fibs_sum_of_squares
    return 0 if @generated_fibs.empty?
    @generated_fibs.inject(0) { |sum, n| sum + n ** 2 }
  end


  private

  def generate_fibs x
    # this method should do the work of generating the sequence
  a, b = 0, 1
    loop do
      break if @generated_fibs.size >= x
      @generated_fibs << a
      a, b = b, a + b
    end
    @generated_fibs
  end
end


