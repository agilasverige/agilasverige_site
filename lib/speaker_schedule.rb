class SpeakerSchedule

  def initialize
    setup_schedule
  end

  def speaker(args)
    proposal = speaking_proposal(args)
    proposal ? proposal.attendant_full_name : ""
  end

  def title(args)
    proposal = speaking_proposal(args)
    proposal ? proposal.title : ""
  end

  def description(args)
    proposal = speaking_proposal(args)
    proposal ? proposal.description : ""
  end

  def organization(args)
    proposal = speaking_proposal(args)
    proposal ? proposal.attendant_organization : ""
  end


  private

  def speaking_proposal(args)
    sp_id = parse_id(args)
    SpeakingProposal.first(:id => sp_id)
  end

  def parse_id(args) 
    day = args[:day] - 1
    track = args[:track] - 1
    slot = args[:slot] - 1
    talk = args[:talk] - 1
    @schedule[day][track][slot][talk]
  end

  def setup_schedule
    slot1_1_1 = [49,5,16,54]
    slot1_1_2 = [46,2,65,14,61]
    slot1_1_3 = [64,35,41,48,77]
    slot1_2_1 = [66,69,10,70]
    slot1_2_2 = [38,62,50,34,67]
    slot1_2_3 = [71,31,30,72,73]
    slot2_1_1 = [37,74,39,57,8]
    slot2_1_2 = [60,52,59,24,27]
    slot2_1_3 = [68,15,4,47,58]
    slot2_2_1 = [56,6,26,76,28]
    slot2_2_2 = [18,11,17,20,78]
    slot2_2_3 = [36,63,40,25,29]
    track1_1 = [slot1_1_1, slot1_1_2, slot1_1_3]
    track1_2 = [slot1_2_1, slot1_2_2, slot1_2_3]
    track2_1 = [slot2_1_1, slot2_1_2, slot2_1_3]
    track2_2 = [slot2_2_1, slot2_2_2, slot2_2_3]
    day1 = [track1_1, track1_2]
    day2 = [track2_1, track2_2]
    @schedule = [day1, day2]
  end
end
