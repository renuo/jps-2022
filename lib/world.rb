Skill = Struct.new(:name, :level, keyword_init: true) do
  def initialize(**args)
    super(**args)
  end
end

Contributor = Struct.new(:name, :skills, :working_til, :used, keyword_init: true) do
  def initialize(**args)
    super(**args)
    self.skills ||= []
    self.working_til = 0
    self.used = false
  end
end

Project = Struct.new(:name, :duration_days, :score, :skills, :day_score, keyword_init: true) do
  def initialize(**args)
    super(**args)
    self.skills ||= []
  end

  def day_score
    score.to_f / duration_days.to_f
  end

  def cost_score
    day_score / skills.length
  end
end

ProjectAssignment = Struct.new(:project, :contributors, keyword_init: true) do
  def initialize(**args)
    super(**args)
    self.contributors ||= []
  end
end

World = Struct.new(:contributors, :projects, keyword_init: true) do
  def initialize(**args)
    super(**args)
    self.contributors ||= []
    self.projects ||= []
  end
end

