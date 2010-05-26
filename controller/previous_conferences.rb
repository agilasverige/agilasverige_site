class PreviousConferencesController < Controller

  def index
    redirect '/previous_conferences/onezero'
  end

  def zeroeight
    presentations08 = Presentations08.new.presentations
    view = PreviousConferences::ZeroEight.new(:controller => self, :presentations => presentations08)
    view.to_s
  end

  def zeronine
    view = PreviousConferences::ZeroNine.new(:controller => self)
    view.to_s
  end

  def onezero
    view = PreviousConferences::OneZero.new(:controller => self)
    view.to_s
  end
end
