class ValidateComponentView < View
  def initialize(valid:)
    @valid = valid
    super
  end

  def show
    info "scanning components..."
    if @valid
      success "components recognized!"
    else
      error "some components are not recognized"
    end
    
  end
end
