module Admin::Iptraffic::SessionsHelper
    def session_status(session)
        if session.active?
            content_tag(:span, "Active", :class => "colorized green")
        elsif session.expired?
            content_tag(:span, "Expired", :class => "colorized red")
        else
            content_tag(:span, "Finished", :class => "colorized blue")
        end
    end

    def session_duration(session)
        from = session.started_at
        to = session.finished_at || Time.now
        short = distance_of_time_in_words(from, to, true)
        if to - from > 1
            content_tag(:span, short, :title => time_diff_in_natural_language(to, from))
        else
            content_tag(:span, short)
        end
    end

    def humanize_octets(bytes)
        if bytes >= 1073741824
            (bytes / 1024 / 1024 / 1024).to_s + " GiB"
        elsif bytes >= 1048576
            (bytes / 1024 / 1024).to_s + "MiB"
        elsif bytes >= 1024
            (bytes / 1024).to_s + "KiB"
        else bytes
        end
    end
end
