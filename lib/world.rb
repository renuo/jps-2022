Person = Struct.new(:name, keyword_init: true) do
end

ProjectAssignment = Struct.new(:name, :people, keyword_init: true) do
end

World = Struct.new(:numbers, keyword_init: true) do
  def initialize(args)
    super(args)

    # Manipulate world setup starting from here:
    # …
  end
end

