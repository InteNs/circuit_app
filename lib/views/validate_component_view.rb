class ValidateComponentView < View
  def initialize(not_found:)
    @not_found = not_found
    super
  end

  def show
    info "scanning components..."
    if @not_found.empty?
      success "components recognized!"
    else
      error "#{@not_found.count} components are not recognized"
    end
  end
end
