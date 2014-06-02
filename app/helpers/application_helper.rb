module ApplicationHelper
    def full_title(pt)
        base = "Quomp"
        if pt.empty?
            base
        else
            "#{base} | #{pt}"
        end
    end
end
