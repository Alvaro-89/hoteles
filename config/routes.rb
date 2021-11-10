Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  

  # Principal
  root 'paginas#principal'

  #Roles
  get 'roles'               ,to: 'roles#listar'     ,as: 'roles' #as 'roles' es para darle un alias.
  get 'roles/nuevo'         ,to: 'roles#crear'      ,as: 'nuevo_rol'
  get 'roles/:id/editar'    ,to: 'roles#editar'     ,as: 'editar_rol'
  post 'roles'              ,to: 'roles#guardar'
  patch 'roles/:id'         ,to: 'roles#actualizar' ,as: 'rol'
  delete 'roles/:id'        ,to: 'roles#eliminar'


  #Ciudades
  get 'ciudades'              ,to: 'ciudades#listar',                   as: 'ciudades'
  get 'ciudades/nuevo'        ,to: 'ciudades#mostrar_formulario_crear', as: 'nueva_ciudad'
  get 'ciudades/:id/editar'   ,to: 'ciudades#editar',                   as: 'editar_ciudad'
  get 'ciudades/:id'          ,to: 'ciudades#mostrar',                  as: 'ciudad'

  post    'ciudades',         to: 'ciudades#guardar'
  patch   'ciudades/:id',     to: 'ciudades#actualizar'
  #put   'ciudades/:id',      to: 'ciudades#actualizar' #Hace casi lo mismo que el patch (")actualizar)
  delete  'ciudades/:id',     to: 'ciudades#eliminar'

  # Hoteles
  get 'hoteles',                    to: 'hoteles#listar',     as: 'hoteles'
  get 'hoteles/nuevo',              to: 'hoteles#nuevo',      as: 'nuevo_hotel'
  get 'hoteles/nuevo/:id_ciudad',   to: 'hoteles#nuevo',      as: 'nuevo_hotel_con_ciudad'
  get 'hoteles/:id/editar',         to: 'hoteles#editar',     as: 'editar_hotel'
  get 'hoteles/:id',                to: 'hoteles#mostrar',    as: 'hotel'

  post 'hoteles',           to: 'hoteles#guardar'
  patch 'hoteles/:id',      to: 'hoteles#actualizar'
  delete 'hoteles/:id',     to: 'hoteles#eliminar'

  # Habitaciones
  get 'habitaciones',           to:'habitaciones#listar',       as:'habitaciones'
  get 'habitaciones/nuevo',     to:'habitaciones#nuevo',        as:'nueva_habitacion'
  get 'habitaciones/nuevo/:id_hotel',   to: 'habitaciones#nuevo',      as: 'nueva_habitacion_con_hotel'
  get 'habitaciones/:id/nuevo', to:'habitaciones#editar',   as:'editar_habitacion'
  get 'habitaciones/:id',       to: 'habitaciones#mostrar',  as: 'habitacion'

  post 'habitaciones',          to: 'habitaciones#guardar'
  patch 'habitaciones/:id',     to: 'habitaciones#actualizar'
  delete 'habitaciones/:id',    to: 'habitaciones#eliminar'
end