ActiveAdmin.register Category do
  permit_params :name
  actions :all ,except:[:destroy]
end
