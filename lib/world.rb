# Street = Struct.new(:length, :name, :start, :end, :cars, keyword_init: true) do
#   # TODO implement class methods
# end

World = Struct.new(:numbers, keyword_init: true) do
  def initialize(args)
    super(args)

    # Manipulate world setup starting from here:
    # …
  end
end

