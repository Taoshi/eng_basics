class Fib < ActiveRecord::Base
  serialize :sequence

  before_save :generate_sequence
  before_save :sum_of_squares

  validates :sequence_length, presence: true
  validates_length_of :sequence_length, maximum: 2
  validates_numericality_of :sequence_length, greater_than: 0

  def generate_sequence
    seq = []
    a = 0
    b = 1
    loop do
      break if seq.size >= sequence_length
      seq << a
      a, b = b, a + b
    end
    self.sequence = seq
    seq
  end

  def sum_of_squares
    square_sum = generate_sequence.inject(0) { |sum, n| sum + n**2 }
    self.square_sum = square_sum
  end

  def is_known_fib?(input)
    sequence.include?(input)
  end

  def all_fibs?(seq)
    sequence == seq
  end
end
