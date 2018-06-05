class LoadView < View
  def initialize(count:)
    @count = count
    super
  end

  def show
    if @count.zero?
      error "there are #{@count} circuits available in memory"
    else
      info "there are #{@count} circuits available in memory"
    end
  end
end
