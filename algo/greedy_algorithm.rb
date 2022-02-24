# frozen_string_literal: true

class GreedyAlgorithm
  include Interactor

  def call
    projects = context.world&.projects
    contributors = context.world&.contributors

    projects_sorted = projects.sort { |a, b| b[:day_score] <=> a[:day_score] }

    manager = ProjectManager.new
    projects_sorted.each do |project|
      c_list = []
      project.skills.each do |p_skill|
        contributor = contributors.find_all { |c| c.used == false }.find { |c| c.skills.any? { |c_skill| c_skill.level >= p_skill.level && c_skill.name == p_skill.name } }
        if contributor
          c_list.append(contributor)
          contributor.used = true
        else
          break
        end
      end

      valid = c_list.length == project.skills.length
      manager.add(ProjectAssignment.new(project: project, contributors: c_list)) if valid
      # puts contributors
    end

    context.project_assignments = manager.project_assignments
  end
end
