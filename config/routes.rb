Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  #Roles
  get 'roles'               ,to: 'roles#listar'   ,as: 'roles' #as 'roles' es para darle un alias.
  get 'roles/nuevo'         ,to: 'roles#crear'    ,as: 'nuevo_rol'
  get 'roles/:id/editar'    ,to: 'roles#editar'   ,as: 'editar_rol'
  post 'roles'              ,to: 'roles#guardar'
  patch 'roles/:id'         ,to: 'roles#actualizar' ,as: 'rol'
  delete 'roles/:id'        ,to: 'roles#eliminar'


  #Ciudades
  get 'ciudades'              ,to: 'ciudades#listar'                   , as: 'ciudades'
  get 'ciudades/nuevo'        ,to: 'ciudades#mostrar_formulario_crear' , as: 'nueva_ciudad'
  get 'ciudades/:id/editar'   ,to: 'ciudades#editar'                   , as: 'editar_ciudad'
  post 'ciudades'             ,to: 'ciudades#guardar'
  patch 'ciudades/:id'        ,to: 'ciudades#actualizar'               , as: 'ciudad'
  delete 'ciudades/:id'       ,to: 'ciudades#eliminar'
end