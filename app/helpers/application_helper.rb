module ApplicationHelper
    def bootstrap_class_for flash_type # New flash type to be used with bootstrap alerts
        case flash_type
          when "success"
            "alert-success"   # Green
          when "error"
            "alert-danger"    # Red
          when "alert"
            "alert-warning"   # Yellow
          when "notice"
            "alert-info"      # Blue
          else
            flash_type.to_s
        end
    end
end
