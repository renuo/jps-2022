class SampleAlgorithm
  include Interactor

  def call
    b = Contributor.new(name: 'Bob')
    a = Contributor.new(name: 'Anna')
    p = Project.new(name: 'WebServer', duration_days: 7)

    manager = ProjectManager.new
    manager.add(ProjectAssignment.new(project: p, contributors: [b, a]))

    context.project_manager = manager
  end
end
