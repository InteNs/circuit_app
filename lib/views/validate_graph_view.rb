class ValidateGraphView < View
  def initialize(valid:)
    @valid = valid
    super
  end

  def show
    info "validating the circuit graph..."
    if @valid
      success "circuit graph is valid!"
    else
      error "cycle detected in circuit!"
    end
  end
end
