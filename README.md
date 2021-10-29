
            <table>
                <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Acciones</th>
                </tr>
                <% @lista_ciudades.each do |c| %>
                    <tr>
                        <td>
                            <%= c.id %>
                        </td>            
                        <td>
                            <%= c.nombre %>
                        </td>
                        <td>
                            <span>Editar</span>
                            <span>Eliminar</span>
                        </td>
                    </tr>
                <% end %>
            </table>
            ```

    - [x] Validar que no se puedan crear ciudades SIN nombre y tampoco repetidas

        - [x] Agregar las validaciones necesarias al modelo

            ```ruby
            class Ciudad < ApplicationRecord
                has_many :hoteles # una ciudad tiene muchos hoteles
                validates :nombre, presence: true
                validates :nombre, uniqueness: true
            end
            ```

        - [x] Asegurarnos de tener el método `.save` en un `if` en el controlador para pedirnos prestado una vista (con `render`) en caso de fallar

            ```ruby
            def guardar
                # extraer los datos del formulario 📦
                datos_formulario = params.require(:ciudad).permit(:nombre) # Hash
                # datos_formulario = {nombre: "Tokio"}
                # Guardando los datos 💾
                @ciudad = Ciudad.new
                @ciudad.nombre = datos_formulario[:nombre]
                if @ciudad.save
                    # Mostrar la confirmación ✅
                    puts "✅GUARDARDO✅".center(20, "*")
                else
                    render :mostrar_formulario_crear
                end
            end
            ```

        - [x] Mostrar los errores (si los hubiera) en la vista

            ```ruby
            <h2>Registro de una ciudad</h2>
            <%= form_with(model: @ciudad) do |formulario| %>
                
                <!-- <label id="nombre" >Nombre</label> -->
                <%= formulario.label :nombre %>
                <!-- <input type="text" id="nombre" name="nombre"> -->
                <%= formulario.text_field :nombre %>
                <% if @ciudad.errors[:nombre].any? %>
                    <div>
                        <%= @ciudad.errors[:nombre].first %>
                    </div>
                <% end %>
                <button>Cancelar</button> <!-- link_to -->
                <!-- <input type="submit" value="Registrar"> -->
                <%= formulario.submit 'Registrar' %>
            <% end %>
            ```

    - [x] Redirigir a la vista de `listar` cuando el formulario sea exitoso

        - [x] Agregar el método `redirect_to` en el controlador

            ```ruby
            # app/controllers/ciudades_controller.rb
            def guardar
                # extraer los datos del formulario 📦
                datos_formulario = params.require(:ciudad).permit(:nombre) # Hash
                # datos_formulario = {nombre: "Tokio"}
                # Guardando los datos 💾
                @ciudad = Ciudad.new
                @ciudad.nombre = datos_formulario[:nombre]
                if @ciudad.save
                    # redirect_to "/ciudades"
                    redirect_to ciudades_path
                else
                    render :mostrar_formulario_crear
                end
            end
            ```

        - [x] Agregar el alias a la ruta de ciudades

            ```ruby
            # config/routes.rb
             # Ciudades
            get   'ciudades',       to: 'ciudades#listar', as: 'ciudades'
            ```

    - [ ] Mostrar un formulario para editar el nombre de una ciudad

      - [x] Experimentar con la etiqueta `link_to` que me permite generar etiquetas `<a>`

        ```html
        <!-- app/views/ciudades/listar.html.erb -->
        <%= link_to "Crear nueva ciudad", nueva_ciudad_path %>
        ```

        ```ruby
        # config/routes.rb
        get   'ciudades/nuevo', to: 'ciudades#mostrar_formulario_crear',  as: 'nueva_ciudad'
        ```

      - [x] Convertir el texto "Editar" en un link para mostrar la vista de editar

      - [x] Entender cómo funciona una actualización de datos

        ```ruby
        # primera forma de actualizar un dato
        ciudad = Ciudad.find_by(id: 18)         # 1. Buscar el registro por ID
        ciudad.nombre = "arequipa"              # 2. Cambiar el dato de los campos que me interesa
        ciudad.save                             # 3. Guardar los cambios en la BD
        # segunda forma de actualizar un dato
        ciudad = Ciudad.find_by(id: 16)         # 1. Buscar el registro por ID
        ciudad.update(nombre: 'Seul')           # 2. Actualizar el registro con el método .update
        ```

      - [x] Habilitar la ruta para mostrar el formulario para editar una ciudad

        ```ruby
        # config/routes.rb
         get   'ciudades/:id/editar',  to: 'ciudades#editar'
        ```

      - [x] Definir el método en el controlador de ciudades que se haga cargo de la vista de editar

        ```ruby
        # app/controllers/ciudades_controller.rb
        def editar
            
        end
        ```

      - [x] Crear el archivo `editar.html.erb` que muestre el formulario para editar el nombre de la ciudad

      - [x] Entender cómo enviar variables por la URL (para qué sirve el ciudades/:id/editar) y recibirlas

        ```ruby
        def editar
            # recuperamos el :id de la URL 📦 
            id = params[:id]
            puts "#{id}".center(50, "-")
        end
        ```

      - [ ] Definir la lógica para mostrar el formulario con datos cargados de la BD

        - [x] Obtener el :id que llega desde la URL
        - [x] Buscar la ciudad en la base de datos

            ```ruby
            def editar
                # recuperamos el :id de la URL 📦 y lo buscamos en la base de datos
                @ciudad = Ciudad.find_by(id: params[:id])
            end
            ```

        - [x] Mostrar la información de la búsqueda

            ```html
            <h1>Editar</h1>

            <%= @ciudad.id %>
            <%= @ciudad.nombre %>
            ```

        - [x] Mostrar la información dentro de un formulario

            ```ruby
            # config/routes.rb
              patch 'ciudades/:id',   to: 'ciudades#actualizar', as: 'ciudad'
            ```

            ```html
            <!-- app/views/ciudades/editar.html.erb -->
            <h1>Editar</h1>

            <%= form_with(model: @ciudad) do |formulario| %>

                <%= formulario.label        :nombre %>
                <%= formulario.text_field   :nombre %>
                <% if @ciudad.errors[:nombre].any? %>
                    <div>
                        <%= @ciudad.errors[:nombre].first %>
                    </div>
                <% end %>

                <button>Cancelar</button>
                
                <%= formulario.submit "Actualizar" %>
            <% end %>
            ```

    - [ ] Eliminar una ciudad

   1.2. Formulario que me permita introducir los datos del hotel con 1 ciudad registrada en la BD

      - [ ] Consultar todas las ciudades de la BD
      - [ ] Diseñar el formulario para el registro de hotel (¿qué componentes necesitamos?)
      - [ ] Implementar la lógica que me permita guardar los datos del hotel con una ciudad

2. Registrar Habitaciones
3. Buscar hoteles (por nombre) 🔁
4. Reservar una habitación

### Opcionales

1. Iniciar sesión
2. Tener vistas de administrador
3. Buscador de hoteles por nombre en la página principal 🔁