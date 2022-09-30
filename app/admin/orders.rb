ActiveAdmin.register Order do
    permit_params :client_id, product_ids: []
    config.remove_action_item(:destroy)

    member_action :mark_as_sended, method: :post do
        resource.sended!
        redirect_to resource_path, notice: "Marked as sended!"
    end

    action_item :delete, only: :show do
        link_to "Delete Order", admin_order_path, method: :delete, 
            class: "button-danger", data: { confirm: "Are you sure you want to delete this order?" }
    end

    

    index do
        selectable_column
        id_column
        column :client
        column :created_at
        column :status do |o|
            status_tag o.status, class: o.sended? ? "yes" : "no"
        end
        column :product_count
        column :total_price do |o|
            "#{o.total_price} zł"
        end
        actions
    end

    show do
        attributes_table do
            row :client
            row :status do |o|
                status_tag o.status, class: o.sended? ? "yes" : "no"
            end
            row :created_at
            row :updated_at

            row 'Products' do |o|
                o.products
            end

            row :total_price do |o|
                "#{o.total_price} zł"
            end
          end
    end

    filter :created_at
    filter :client
    filter :status, as: :select, collection: Order.statuses.map{|k, v| { k.titleize => v }  }.reduce(:merge)

    form do |f|
        f.inputs do
            f.input :client
            f.input :products
        end
        f.actions
    end
  
end
  