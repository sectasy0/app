ActiveAdmin.register Product do
    permit_params :name, :description, :price
    config.remove_action_item(:destroy)

    action_item :delete, only: :show do
        link_to "Delete Product", admin_product_path, method: :delete, 
            class: "button-danger", data: { confirm: "Are you sure you want to delete this product?" }
    end

    show do
        attributes_table do
            row :name
            row :description
            row :created_at
            row :updated_at
            row :price do |o|
                "#{o.price} zł"
            end
          end
    end

    index do
        selectable_column
        id_column
        column :name
        column :description
        column :created_at
        column :price do |product| 
            "#{product.price} zł"
        end
        actions
    end

    filter :name
    filter :description
    filter :created_at
    filter :price

    form do |f|
        f.inputs do
        f.input :name
        f.input :description
        f.input :price
        end
        f.actions
    end
  
end
  