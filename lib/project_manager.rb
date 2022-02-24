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
      # edge
      good_skill = assignment.contributors.flat_map(&:skills).find { |cs| ps.name == cs.name && ps.level == cs.level }
      good_skill.level += 1 if good_skill

      # mentored
      if good_skill
        skill = assignment.contributors.flat_map(&:skills).find { |cs| ps.name == cs.name && ps.level == (cs.level + 1) }
        skill.level += 1 if skill
      end
    end
  end
end