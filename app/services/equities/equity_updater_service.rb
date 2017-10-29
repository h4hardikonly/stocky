class Equities::EquityUpdaterService
  attr_accessor :equity_record
  def initialize(equity_record)
    @equity_record = equity_record
  end

  def update_face_value(new_value)
    CasualLogger.info("Equity #{equity_name}'s facevalue changed from #{equity.face_value} to #{source_obj.face_value}")
    equity.update_attribute(:face_value, source_obj.face_value)
  end
end
