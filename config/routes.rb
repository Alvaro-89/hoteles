Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'roles',        to: 'roles#listar', as: 'roles' #as 'roles' es para darle un alias.
  get 'roles/nuevo',  to: 'roles#crear'
  post 'roles',       to: 'roles#guardar'


  #Ciudades
  get 'ciudades',       to: 'ciudades#listar'                   , as: 'ciudades'
  get 'ciudades/nuevo', to: 'ciudades#mostrar_formulario_crear' , as: 'nueva_ciudad'
  post 'ciudades',      to: 'ciudades#guardar'
end
