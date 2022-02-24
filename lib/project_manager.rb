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
  end
end