class Leave < ApplicationRecord

    TOTAL_PAID_LEAVES = 18
    TOTAL_SICK_LEAVES = 10

    # def self.leave_balance(user_id)
    #     (TOTAL_PAID_LEAVES + TOTAL_SICK_LEAVES)  - (paid_leaves(user_id) - )
    #     Leave.where(user_id: user_id).last.leave_balance
    # end

    def self.paid_leaves(user_id)
        TOTAL_PAID_LEAVES - Leave.where(user_id: user_id, leave_type: 'paid', leave_status: 'approved').pluck(:consumed_leave).sum
    end

    def self.sick_leaves(user_id)
        TOTAL_SICK_LEAVES - Leave.where(user_id: user_id, leave_type: 'sick', leave_status: 'approved').pluck(:consumed_leave).sum
    end

end
