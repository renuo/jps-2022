class SampleAlgorithm
  include Interactor

  def call
    b = Contributor.new(name: 'Bob')
    a = Contributor.new(name: 'Anna')
    p = Project.new(name: 'WebServer', duration_days: 7, score: 10)

    context.project_assignments = [ProjectAssignment.new(project: p, contributors: [b, a])]
  end
end
