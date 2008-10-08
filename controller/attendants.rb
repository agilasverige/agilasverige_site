class Attendants < Application
  provides :html, :text
  
  before :authenticate

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
    @attendant = flash[:attendant] || Attendant.new
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
    
    wants_to_speak = (params[:attendant][:wants_to_speak] == "1")
    @attendant = Attendant.first(:email => params[:attendant][:email]) || Attendant.new(params[:attendant])

    if(@attendant.new_record?)
      if(wants_to_speak)
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
        flash[:attendant_name] = @attendant.first_name
        flash[:speaking_proposal_title] = @speaking_proposal.title if @speaking_proposal
        redirect url(:thanks_for_signing_up)
      else
        flashify_error_messages_for_attendant
        redirect "#{url(:attendants)}/new"
      end 
    elsif(wants_to_speak)
      @speaking_proposal = @attendant.speaking_proposals.create(params[:speaking_proposal])
      flash[:attendant_name] = @attendant.first_name
      flash[:speaking_proposal_title] = @speaking_proposal.title
      redirect url(:thanks_for_signing_up)
    else
      flash[:error_message_email_taken] = "Den emailadressen är redan registrerad"
      redirect "#{url(:attendants)}/new"
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
    # @attendant = Attendant.first(params[:id])
    #     raise NotFound unless @attendant
    #     if @attendant.destroy!
    #       redirect url(:attendants)
    #     else
    #       raise BadRequest
    #     end
      end

  def all_emails
    only_provides :text
    emails = ""
    Attendant.each do |attendant|
      emails << "#{attendant.email} ,"
    end
    emails.chop
  end

  def speaker_emails
    emails = ""
    Attendant.each(:wants_to_speak => true) do |attendant|
      emails << "#{attendant.email} ,"
    end
    emails.chop
  end
  private
  
  def flashify_error_messages_for_attendant
    ["first_name", "last_name", "email", "street_address", "zip_code", "postal_address"].each do |attribute|
      flash["error_message_#{attribute}"] = @attendant.errors.on(attribute)
    end
  end
  
  def authenticate
    basic_authentication { |u, p| Digest::SHA1.hexdigest(p) == "633f55e2df0c9cb68e634c465715476adc559c0e" }
  end
end
