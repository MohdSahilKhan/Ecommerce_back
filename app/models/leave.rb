class Leave < ApplicationRecord

    TOTAL_PAID_LEAVES = 18
    TOTAL_SICK_LEAVES = 10

 def self.leavebalance(userid)
    Leave.where(user_id: userid).pluck(:leave_balance).last
 end

 def self.paidleaves(userid)
    TOTAL_PAID_LEAVES - Leave.where(user_id: userid, leave_type: 'paid', leave_status: 'approved').count
 end

 def self.sickleaves(userid)
    TOTAL_SICK_LEAVES - Leave.where(user_id: userid, leave_type: 'sick', leave_status: 'approved').count
 end

end
