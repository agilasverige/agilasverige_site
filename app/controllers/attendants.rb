class Attendants < Application
  provides :html
  
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
    @wants_to_speak = params['speaker']
    @attendant = Attendant.new
    @speaking_proposal = SpeakingProposal.new
    render
  end

  def edit
    only_provides :html
    @attendant = Attendant.first(params[:id])
    raise NotFound unless @attendant
    render
  end

  def create
    @attendant = Attendant.find_or_create({:email => params[:attendant][:email]}, params[:attendant])
    if(@attendant.wants_to_speak)
      @speaking_proposal = @attendant.speaking_proposals.create(params[:speaking_proposal]) 
    end
    if(@attendant.save)
      send_mail(ConfirmationMailer, :confirm, {
        :from => "info@agilasverige.se",
        :to => @attendant.email,
        :subject => "Din anmälan till Agila Sverige 2008 är mottagen"
      }, { :attendant => @attendant, :speaking_proposal => @speaking_proposal })
      send_mail(ConfirmationMailer, :notify, {
        :from => "info@agilasverige.se",
        :to => "registrar@agilasverige.se",
        :subject => "En anmälan till Agila Sverige 2008 är mottagen"
      }, { :attendant => @attendant, :speaking_proposal => @speaking_proposal })
      redirect url(:thanks_for_signing_up)
    else
      @speaking_proposal = SpeakingProposal.new
      render @attendant, :template => '/attendants/new.html'
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
