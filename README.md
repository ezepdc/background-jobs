# Configuración

## Clonar el repositorio
Para clonar el repositorio, utilizar el siguiente comando en la terminal:

bash
Copy code
git clone https://github.com/usuario/repo.git
Iniciando el servidor y Sidekiq
En su terminal, navegue hasta la carpeta del proyecto y ejecute los siguientes comandos:

Copy code
rails s
python
Copy code
bundle exec sidekiq
Iniciando sesión como administrador
Para iniciar sesión como administrador, vaya a http://localhost:3000/users/sign_in e ingrese las siguientes credenciales:

java
Copy code
Correo electrónico: admin.user@not_mail.com
Contraseña: 123456
Agregando estudiantes, cursos e inscripciones
Antes de ejecutar los cálculos, debe agregar estudiantes, cursos e inscripciones subiendo archivos CSV. Para hacer esto, siga estos pasos:

Inicie sesión como administrador.
Vaya a la página "Estudiantes" y cargue un archivo CSV con los datos de los estudiantes.
Vaya a la página "Cursos" y cargue un archivo CSV con los datos de los cursos.
Vaya a la página "Inscripciones" y cargue un archivo CSV con los datos de las inscripciones.
Ejecutando los cálculos
Una vez que haya agregado estudiantes, cursos e inscripciones, puede ejecutar los cálculos siguiendo estos pasos:

Inicie sesión como administrador.
Vaya a la página "Cálculos".
Haga clic en el botón "Calcular" y espere 10 segundos.
Haga clic en el botón "Visualizar los últimos cálculos" para ver los resultados.
Descargue los resultados en formato CSV haciendo clic en el botón "Descargar".
Notas
La implementación actual no considera los IDs de los archivos CSV, por lo que si carga un nuevo archivo CSV con los mismos datos, los cálculos no se actualizarán. Deberá modificar el código para actualizar los datos de inscripción.
Para volver a ejecutar la solución, siga estos pasos:
En la terminal, detenga el servidor presionando Ctrl + C.
Detenga Sidekiq presionando Ctrl + C.
Ejecute rails db:drop db:create db:migrate db:seed para restablecer la base de datos.
Vuelva a iniciar el servidor y Sidekiq ejecutando los comandos respectivos.
