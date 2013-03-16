class CleanUpDuplicateRegistrations < ActiveRecord::Migration
  def self.up

    conf_id_2012 = Conference.where(year: 2012).first.try(:id)
    if conf_id_2012
      User.all.each do |user|
        regs = user.registrations.where(conference_id: conf_id_2012)
        if regs.size > 1
          real_reg = regs[0]
          delete_reg_ids = regs[1, regs.length].map{|r|r.id}

          SpeakingProposal.where("registration_id in (?)", delete_reg_ids).each do |sp|
            sp.registration_id = real_reg.id
            sp.save!
            print "Set reg id to #{real_reg.id} for proposal #{sp.id} and user #{user.email}\n"
          end
          print "Deleting regs #{delete_reg_ids.join(',')}\n"
          Registration.where("id in (?)", delete_reg_ids).destroy_all
        end
      end
    end
  end

  def self.down
  end
end
