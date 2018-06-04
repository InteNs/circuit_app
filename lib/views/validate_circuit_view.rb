class ValidateCircuitView < View
  def initialize(valid:)
    @valid = valid
    super
  end

  def show
    info "validating the circuit connections..."
    if @valid
      success "circuit is fully connected"
    else
      error "circuit if not fully connected"
    end
  end
end
