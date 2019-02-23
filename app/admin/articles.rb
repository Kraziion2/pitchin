ActiveAdmin.register Article do
	actions :all ,except:[:update,:edit,:new,:destroy]
end
