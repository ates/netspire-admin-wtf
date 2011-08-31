class Iptraffic::Session < ActiveRecord::Base
    belongs_to :account

    default_scope order("started_at DESC").includes(:account)

    def self.filter(filter_by, page = nil)
        scope = case filter_by
                when "active"
                    where(["finished_at IS NULL AND (expired IS NULL OR expired = ?)", false])
                when "finished"
                    where("finished_at IS NOT NULL")
                when "expired"
                    where(:expired => true)
                else
                    scoped
                end
        scope.paginate(:page => page)
    end

    def active?
        finished_at.blank? && !expired?
    end
end
