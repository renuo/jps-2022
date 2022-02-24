ProjectManager = Struct.new(:project_assignments, :current_day, keyword_init: true) do
  def initialize
    super
    self.project_assignments ||= []
    self.current_day = 0
  end

  def add(assignment)
    self.project_assignments.append(assignment)
    self.current_day += assignment.project.duration_days
    assignment.contributors.each do |c|
      c.working_til = self.current_day
      c.used = false
    end
    assignment.project.done = true

    # level up if skills have been used at the edge
    assignment.project.skills.each do |ps|
      team_skills = assignment.contributors.flat_map(&:skills)

      exceed_skill = team_skills.any? { |cs| ps.name == cs.name && ps.level < cs.level }
      good_skills = team_skills.select { |cs| ps.name == cs.name && ps.level == cs.level }
      rookie_skills = team_skills.select { |cs| ps.name == cs.name && ps.level == (cs.level + 1) }

      good_skills.each { |cs| cs.level += 1 }
      rookie_skills.each { |cs| cs.level += 1 } if good_skills.any? || exceed_skill
    end
  end
end