class EasyAlgorithm
  include Interactor

  def call
    projects = context.world.projects
    contributors = context.world.contributors

    projects.each do |project|
      assignment = ProjectAssignment.new(project: project, contributors: [])

      project.skills.each do |ps|
        contributor = contributors.find { |c| c.skills.any? { |cs| cs.level >= (ps.level - 1) } }
        assignment.contributors << contributor if contributor

      end

      context.project_assignments << assignment
    end
  end
end
