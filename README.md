# Configuración

## Clonar el repositorio
Para clonar el repositorio, utilizar el siguiente comando en la terminal:

```
git clone https://github.com/ezepdc/background-jobs.git
```

## Migrar base de datos y crear usuario administrador
En la terminal, ejecutar el siguiente comando:

```
rails db:migrate db:seed
```

## Iniciar el servidor y Sidekiq
En la terminal, navegar hasta la carpeta del proyecto y ejecutar los siguientes comandos:

```
rails s
```

```
sidekiq
```

## Iniciar sesión como administrador
Para iniciar sesión como administrador, ir a http://localhost:3000/users/sign_in e ingresar las siguientes credenciales:

*Usuario: admin.user@not_mail.com* <br />
*Contraseña: 123456*

## Agregar estudiantes, cursos e inscripciones
Desde la pantalla actual

1. Agregar el archivo users.csv con los datos de los estudiantes.
2. Agregar el archivo courses.csv con los datos de los cursos.
3. Agregar el archivo enrollments.csv con los datos de las incscripciones.

## Ejecutar los cálculos
Una vez agregados los estudiantes, cursos e inscripciones, se pueden ejecutar los cálculos cliqueando el botón <br />
**Calcular**

Luego de 10 segundos refresque la página para visualizar los cálculos con el botón <br />
**Refrescar página**

## Descargar los resultados.
Una vez realizados los calculos se pueden descargar los mismos en formato CSV haciendo clic en el botón <br />
**Descargar**

## Notas
La implementación actual no considera los IDs de los archivos CSV, por lo que si se agrega un nuevo archivo enrollments.csv con nuevos datos, no funcionará.

Para una funcionalidad de tal tipo se debe modificar el código.

## Volver a ejecutar la solución
Para volver a ejecutar la solución, seguir estos pasos:
Desde la terminal:

1. Detener el servidor presionando Ctrl + C.
2. Detener Sidekiq presionando Ctrl + C.
3. Para restablecer la base de datos ejecutar
    ```
    rails db:drop db:create db:migrate db:seed
    ```
4. Puede repetir los pasos desde el apartado ***Iniciar el servidor y Sidekiq***
