require 'spec_helper'

describe SpeakingEngagement do

  it {should belong_to :user}
  it {should belong_to :speaking_proposal}
end
