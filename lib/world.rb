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

Project = Struct.new(:name, :duration_days, :score, :skills, :day_score, keyword_init: true) do
  def initialize(**args)
    super(**args)
    self.skills ||= []
    self.day_score = self.score / self.duration_days
  end
end

ProjectAssignment = Struct.new(:project, :contributors, keyword_init: true) do
end

World = Struct.new(:contributors, :projects, keyword_init: true) do
  def initialize(**args)
    super(**args)
    self.contributors ||= []
    self.projects ||= []
  end
end

