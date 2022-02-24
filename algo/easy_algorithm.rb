class EasyAlgorithm
  include Interactor

  def call
    projects = context.world.projects
    contributors = context.world.contributors

    projects.each do |project|
      assignment = ProjectAssignment.new(project: project, contributors: [])

      project.skills.each do |ps|
        contributor = contributors.find { |c| c.skills.any? { |cs| cs.name == ps.name && cs.level >= ps.level } }
        if contributor
          contributors.delete(contributor)
          assignment.contributors << contributor
        end
      end

      context.project_assignments << assignment
    end
  end
end
