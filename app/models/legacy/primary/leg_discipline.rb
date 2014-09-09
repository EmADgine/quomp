class LegDiscipline < ActiveRecord::Base
    establish_connection :legacy_primary
    self.table_name = "discipline"
end
