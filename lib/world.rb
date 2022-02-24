Skill = Struct.new(:name, :level, keyword_init: true) do
  def initialize(args)
    super(args)
  end
end

Contributor = Struct.new(:name, :skills, keyword_init: true) do
  def initialize(args)
    @skills = []
    super(args)
  end
end

Project = Struct.new(:name, :duration_days, :score, keyword_init: true) do
  def initialize(args)
    @skills = []
    super(args)
  end
end
    
ProjectAssignment = Struct.new(:name, :people, keyword_init: true) do
end

World = Struct.new(:contributors, :projects, keyword_init: true) do
  def initialize(args)
    @contributors = []
    @projects = []
    super(args)
  end
end

