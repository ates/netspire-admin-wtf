module Admin::RadiusRepliesHelper
    def radius_replies_fields(form)
        form.fields_for(:assigned_radius_replies) do |f|
            concat(radius_reply_row(f))
        end
    end

    def radius_reply_row_template(form)
        object = AssignedRadiusReply.new
        options = { :class => "template hidden", "data-name" => "replies" }
        form.fields_for(:assigned_radius_replies, object, :child_index => "NEW_ROW") do |f|
            concat(radius_reply_row(f, options))
        end
    end

    def radius_reply_row(form, options = {})
        content_tag(:tr, options) do
            [
                content_tag(:th, :scope => "row") do
                    form.collection_select(:radius_reply_id, RadiusReply.all, :id, :name, {}, :style => "width: 250px")
                end,
                content_tag(:td) do
                    form.text_field(:value, :style => "width: 250px")
                end,
                content_tag(:td) do
                    if form.object.new_record?
                        link_to("Remove", "#", :class => "remove")
                    else
                        form.check_box(:_destroy, :title => "Mark for deletion")
                    end
               end
            ].join.html_safe
        end
    end

    def radius_reply_groups_fields(form)
        form.fields_for(:assigned_radius_reply_groups) do |f|
            concat(radius_reply_group_row(f))
        end
    end

    def radius_reply_group_row_template(form)
        object = AssignedRadiusReplyGroup.new
        options = { :class => "template hidden", "data-name" => "reply_groups" }
        form.fields_for(:assigned_radius_reply_groups, object, :child_index => "NEW_ROW") do |f|
            concat(radius_reply_group_row(f, options))
        end
    end

    def radius_reply_group_row(form, options = {})
        content_tag(:tr, options) do
            [
                content_tag(:th, :scope => "row") do
                    form.collection_select(:radius_reply_group_id, RadiusReplyGroup.all, :id, :name, {}, :style => "width: 250px")
                end,
                content_tag(:td) do
                    if form.object.new_record?
                        link_to("Remove", "#", :class => "remove")
                    else
                        form.check_box(:_destroy, :title => "Mark for deletion")
                    end
                end
            ].join.html_safe
        end
    end
end
