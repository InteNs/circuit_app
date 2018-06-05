class SavedView < View
  def initialize(name:)
    @name = name
    super
  end

  def show
    success "the circuit has been stored under the name: #{@name}"
  end
end
