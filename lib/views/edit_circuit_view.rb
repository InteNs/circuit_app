class EditCircuitView < View
  def initialize(name:)
    @name = name
    super
  end

  def show
    info "you are editing circuit #{@name}"
  end
end
