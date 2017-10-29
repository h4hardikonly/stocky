class LoggerService
  include Singleton
  attr_reader :casual_logger, :critical_logger

  def initialize
    # debug|info|warn|error|fatal
    @casual_logger = Logger.new("#{Rails.root}/log/casual.log")
    @critical_logger = Logger.new("#{Rails.root}/log/critical.log")
  end
end
