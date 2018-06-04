class FileView < View
  def show
    @file = nil
    until @file
      input = ask "please type the path to the circuit"
      path = Pathname.new(input)

      if path.exist?
        @file = path
        success "circuit file found!"
      else
        error "circuit file not found, check the path and try again"
      end
    end

    @file
  end
end
