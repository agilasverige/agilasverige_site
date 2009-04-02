class AttendantController < Ramaze::Controller

  def index(id)
    Attendant.get(id)
  end

  def new
    if request.get?
      AttendantNew.new.to_s
    elsif request.post?
      sanitize_request
      attendant = Attendant.new(request.params)
      attendant.save
      redirect("/attendant/#{attendant.id}")
    end
  end

  def sanitize_request
    checkbox("attending_dinner")
  end

  protected

  def checkbox( param )
    request.params[param] = request.params.has_key?(param.to_s)
  end

  
end
