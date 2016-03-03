class Money < ActiveRecord::Base

  def self.balance
    positive = []
    negative = []
    self.all.each do |x|
      positive << x.amount.to_f if x.deposit == "t"
      negative << x.amount.to_f if x.deposit == "f"
    end
      total = positive.sum - negative.sum
  end


  def self.total_transactions
    self.count
  end

  def self.current_monthly_spent
    current = Time.now.mon
    money_spent = []
    self.all.each do |x|
      money_spent << x.amount.to_f if x.date.mon == current && x.deposit == "f"
    end
    money_spent.sum
  end

  def self.previous_monthly_spent
    previous = Time.now.mon - 1
    money_spent = []
    self.all.each do |x|
      money_spent << x.amount.to_f if x.date.mon == previous && x.deposit == "f"
    end
    money_spent.sum
  end

  def self.current_largest_spent_amount
    money_spent = []
    current = Time.now.mon
    self.all.each do |x|
      money_spent << x.amount.to_f if x.date.mon == current && x.deposit == "f"
    end
    largest = Money.find_by amount: money_spent.max
    largest.amount
  end

  def self.current_largest_spent_amount_id
    money_spent = []
    current = Time.now.mon
    self.all.each do |x|
      money_spent << x.amount.to_f if x.date.mon == current && x.deposit == "f"
    end
    largest = Money.find_by amount: money_spent.max
    largest.id
  end

  def self.total_largest_spent_amount
    money_spent = []
    self.all.each do |x|
      money_spent << x.amount.to_f if x.deposit == "f"
    end
    largest = Money.find_by amount: money_spent.max
    largest.amount
  end

  def self.total_largest_spent_amount_org
    money_spent = []
    self.all.each do |x|
      money_spent << x.amount.to_f if x.deposit == "f"
    end
    largest = Money.find_by amount: money_spent.max
    largest.organization
  end

  # def self.overall_most_money_spent
  #   money_spent = []
  #   byebug
  #   self.all.each do |x|
  #     byebug
  #   end
  # end


end
