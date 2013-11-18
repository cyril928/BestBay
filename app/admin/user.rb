ActiveAdmin.register User do

  form do |f|
    f.inputs do
      f.input :active
    end
    f.buttons
  end
end
