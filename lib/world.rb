Skill = Struct.new(:name, :level, keyword_init: true) do
  def initialize(**args)
    super(**args)
  end
end

Contributor = Struct.new(:name, :skills, keyword_init: true) do
  def initialize(**args)
    super(**args)
    self.skills ||= []
  end
end

Project = Struct.new(:name, :duration_days, :score, :skills, keyword_init: true) do
  def initialize(**args)
    super(**args)
    self.skills ||= []
  end
end

ProjectAssignment = Struct.new(:project, :contributors, keyword_init: true) do
end

ProjectManager = Struct.new(:project_assignments, :current_day, keyword_init: true) do
  def initialize
    super
    self.project_assignments ||= []
    self.current_day = 0
  end

  def add(assignment)
    self.project_assignments.append(assignment)
    self.current_day += assignment.project.duration_days
  end
end


World = Struct.new(:contributors, :projects, keyword_init: true) do
  def initialize(**args)
    super(**args)
    self.contributors ||= []
    self.projects ||= []
  end
end

