class Equities::EquityUpdaterService
  attr_reader :equity_record, :source_obj
  def initialize(equity_record, source_obj)
    @equity_record = equity_record
    @source_obj = source_obj
  end

  def update
    update_face_value if facevalue_different?
  end

  def facevalue_different?
    equity_record.face_value != source_obj.face_value
  end

  def update_face_value
    CasualLogger.info("Equity #{equity_record.name}'s facevalue changed from #{equity_record.face_value} to #{source_obj.face_value}")
    equity_record.update_attribute(:face_value, source_obj.face_value)
  end
end
