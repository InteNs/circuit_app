class FileView < View
  def show
    input = ask "please type the path to the circuit"
    path = Pathname.new(input)

    if path.exist?
      success "circuit file found!"
      return path
    else
      error "circuit file not found, check the path and try again"
      return nil
    end
  end
end
