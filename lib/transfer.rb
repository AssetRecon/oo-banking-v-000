class Transfer
attr_reader :sender
attr_accessor :sender, :receiver, :amount, :status

def initialize(sender,receiver, amount)
  @sender = sender
  @receiver = receiver
  @status = "pending"
  @amount = amount
end

def valid?
  @sender.valid? && @receiver.valid? && @sender.balance >= @amount
end

def execute_transaction
  if @status == "pending" && @sender.valid? == true
 @sender.balance -= @amount
 @receiver.balance += @amount
 @status = "complete"
 elsif @sender.valid? == false
   @status = "rejected"
   "Transaction rejected. Please check your account balance."

 end
end

end
