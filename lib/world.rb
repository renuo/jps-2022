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

ProjectAssignment = Struct.new(:name, :contributors, keyword_init: true) do
end

World = Struct.new(:contributors, :projects, keyword_init: true) do
  def initialize(**args)
    super(**args)
    self.contributors ||= []
    self.projects ||= []
  end
end

