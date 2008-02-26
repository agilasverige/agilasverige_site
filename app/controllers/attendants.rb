class Attendants < Application
  # provides :xml, :yaml, :js
  
  def index
    @attendants = Attendant.all
    display @attendants
  end

  def show
    @attendant = Attendant.first(params[:id])
    raise NotFound unless @attendant
    display @attendant
  end

  def new
    only_provides :html
    @attendant = Attendant.new
    render
  end

  def edit
    only_provides :html
    @attendant = Attendant.first(params[:id])
    raise NotFound unless @attendant
    render
  end

  def create
    @attendant = Attendant.new(params[:attendant])
    if @attendant.save
      redirect url(:attendant, @attendant)
    else
      render :action => :new
    end
  end

  def update
    @attendant = Attendant.first(params[:id])
    raise NotFound unless @attendant
    if @attendant.update_attributes(params[:attendant])
      redirect url(:attendant, @attendant)
    else
      raise BadRequest
    end
  end

  def destroy
    @attendant = Attendant.first(params[:id])
    raise NotFound unless @attendant
    if @attendant.destroy!
      redirect url(:attendants)
    else
      raise BadRequest
    end
  end
  
end
