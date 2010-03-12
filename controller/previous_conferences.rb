class PreviousConferencesController < Controller

  def index
    redirect '/previous_conferences/zeroeight'
  end

  def zeroeight
    presentations08 = Presentations08.new.presentations
    view = PreviousConferences::ZeroEight.new(:controller => self, :presentations => presentations08)
    view.to_s
  end
end
