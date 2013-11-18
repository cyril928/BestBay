ActiveAdmin.register Item do
  form do |f|
    f.inputs do
      f.input :category
      f.input :description
      f.input :condition
      f.input :active
    end
    f.buttons
  end
end
