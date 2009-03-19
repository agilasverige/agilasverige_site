class AttendantController < Ramaze::Controller

  def new
    AttendantNew.new.to_s
  end
end
