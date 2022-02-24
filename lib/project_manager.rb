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

    # Level up:
    skill_contributers = assignment.project.skills.zip(assignment.contributors.map(&:skills))
    skill_contributers.each do |(ps, c_skills)|
      master_skill = c_skills.find { |cs| cs.name == ps.name && cs.level > ps.level }
      good_skill = c_skills.find { |cs| cs.name == ps.name && cs.level == ps.level }
      rookie_skill = c_skills.find { |cs| cs.name == ps.name && cs.level == (ps.level - 1) }

      good_skill.level += 1 if good_skill
      rookie_skill.level += 1 if rookie_skill && (good_skill || master_skill)
    end
  end
end