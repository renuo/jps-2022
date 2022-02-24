# frozen_string_literal: true

class ParallelGreedyAlgorithm
  include Interactor

  def call
    projects = context.world&.projects
    contributors = context.world&.contributors

    projects_sorted = projects.sort { |a, b| b[:day_score] <=> a[:day_score] }

    manager = ProjectManager.new
    project_added = 1000
    current_day = 0
    searching = true
    while searching
      if project_added.zero?
        min_wo_ti = contributors.min(&:working_til).working_til
        current_day += 1
        current_day = min_wo_ti if current_day < min_wo_ti
      end
      project_added = 0

      projects_sorted.find_all { |p| p.done == false }.each do |project|
        contributors.each do |c|
          c.used = false
        end
        c_list = []
        project.skills.each do |p_skill|
          contributor = contributors.find_all { |c| c.used == false && current_day >= c.working_til }.find do |c|
            c.skills.any? { |c_skill| c_skill.level >= p_skill.level && c_skill.name == p_skill.name }
          end
          if contributor
            c_list.append(contributor)
            contributor.used = true
          else
            break
          end
        end

        valid = c_list.length == project.skills.length
        if valid
          manager.add(ProjectAssignment.new(project: project, contributors: c_list))
          project_added += 1
        end
      end

      searching = false if projects_sorted.all? { |p| p.done == true } || current_day > 10_000
    end

    context.project_assignments = manager.project_assignments
  end
end
