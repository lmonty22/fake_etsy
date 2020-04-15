module ApplicationHelper
    def avatar(id, table_to_search)
        table_item = table_to_search.find(id)
        if table_item.image.attached?
            image_tag table_item.image, style: "width:100px"
        else
            image_tag 'no_image_placeholder_1.jpg', style: "width:100px"
        end
    end
end
