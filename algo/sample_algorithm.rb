class SampleAlgorithm
  include Interactor

  def call
    numbers = context.world&.numbers

    if numbers
      context.sum = numbers.reduce(&:+)
    else
      context.fail!(message: 'There are no numbers!')
    end
  end
end
