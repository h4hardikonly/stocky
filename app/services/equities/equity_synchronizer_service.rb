module Equities::EquitySynchronizerService
  def self.sync_from_nse
    NSE::Equity.get_list.each do |source_obj|
      begin
        equity = Equity.find_by(symbol: source_obj.symbol)
        if equity.present?
          EquityUpdaterService.new(equity, source_obj).update
        else
          Equity.create!(symbol: source_obj.symbol, name: source_obj.name_of_company, face_value: source_obj.face_value)
        end
      rescue => e
        error_message = "while doing sync from nse for equity we encountered error\n"
        error_message << "#{e.class} - #{e.message}\n"
        error_message << "#{e.backtrace.join("\n")}"
        CriticalLogger.error(error_message)
      end
    end
  end
end
