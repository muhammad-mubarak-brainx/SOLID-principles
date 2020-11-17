class FinancialReportMailer
  def initialize(report, account)
    @report = report
    @account = account
  end

  def deliver
    Mailer.deliver(
            from: 'report@example.com',
            to: @account.email,
            subject: 'Financial Report',
            body: @report
    )
  end
end

class FinancialReportGenerator
  def initialize(transactions)
    @transactions = transactions
  end

  def generate
    @transactions.map { |t| "amount: #{t.amount} type: #{t.type} date: #{t.created_at}"}.join("\n")
  end
end

report = FinancialReportGenerator.new(transactions).generate
FinancialReportMailer.new(report, account).deliver
