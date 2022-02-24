class SampleAlgorithm
  include Interactor

  def call
    numbers = context.world&.numbers

    b = Person.new(name: 'Bob')
    a = Person.new(name: 'Anna')
    context.project_assignments = [ProjectAssignment.new(name: 'WebServer', people: [b, a])]

    if numbers
      context.sum = numbers.reduce(&:+)
    else
      context.fail!(message: 'There are no numbers!')
    end
  end
end
