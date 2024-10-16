# Práctica-DAW-1.1
Documentación de como desplegar toda la pila LAMP

## Indice
1. [Creación de la instancia en AWS](#create-inst)
    1. [Iniciar laboratorio](#inicio-lab)
    2. [Panel de consola de AWS](#panel_cons)
    3. [Crear nueva instancia](#add-inst)
    4. [Modificar instancia](#mod-inst)
        * [Asignar IP elástica](#elast-ip)
        * [Modificación del grupo de seguridad](#mod-secure)


<div id='create-inst' />

## Creación de la instancia en AWS

<div id='inicio-lab' />

### Iniciar laboratorio
Para esto debemos de entrar en AWS Academy y __lanzar un laboratorio de Aprendizaje__, este se encuentra en ``Asignaturas > Contenido > lanzar un laboratorio de Aprendizaje``; hay encontraremos la siguiente interfaz donde crearemos la clave privada para la estancia que crearemos próximamente e iniciaremos el laboratorio de aprendizaje.

![Imagen del menú de lanzamiento del lab](img/lab_learn_inicio.png)

En la imagen anterior podemos ver en el apartado de __AWS Details__ que nos muestra la posibilidad de __descargar la clave PEM__, le pulsamos y le cambiamos el nombre por ``vokey.pem``, una vez hecho esto.

Una vez hecho esto le damos a __Start Lab__ y nos aparecerá a la derecha __AWS junto a un punto verde__(esto puede tardar unos segundos en cambiar de rojo a verde) y le pulsamos a este.

<div id='panel_cons' />

### Panel de consola de AWS

A continuación nos __redirigirá al panel de la consola de AWS__, en el buscador de esta __buscamos EC2__ y seleccionamos el que aparece en la imagen de abajo

![Buscador consola AWS con la palabra EC2](img/buscador_consola_aws.png)

Encontraremos gran cantidad de información sobre las instancias, pero nosotros nos centraremos en la creación de una nueva, para esto seleccionaremos el botón que inicia __Lanzar la instancia__

![Botón de lanzar nueva instancia](img/buton_lanzar_instacia.png)

<div id='add-inst' />

### Crear nueva instancia

En esta nos pedirá como queremos hacer nuestra instancia y nos pedirá varios aspectos de esta, nosotros seleccionaremos los siguientes apartados:

1. __Imagen__ ``Ubuntu``
2. __Tipo de instancia__ ``t2.small``
3. __Par de claves__ ``vokey`` (Esta es la clave que hemos descargado al inicio)
4. __Configuraciones de red__ seleccionaremos la creación de un nuevo grupo de seguridad con los siguientes apartados seleccionados
![Todos los apartados seleccionados](img/grupo_seguridad_1.png)

Una vez hecho esto seleccionaremos el botón de lanzar instancia

<div id='mod-inst' />

## Modificar instancia

<div id='elast-ip' />

### Asignar IP elástica

Para la asignación de esta debemos de ir a ``Red y seguridad > Direcciones de IP elástica``

![Ruta de la dirección de las IP elásticas](img/ruta_ip_elastica.png)

Aquí seleccionaremos el botón __Asignar dirección IP elástica__ y le daremos a __asignar__, posteriormente volveremos al panel con una IP que se nos abra creado.

Seleccionamos esta IP y en el apartado de ``acción > Asociar la dirección IP elástica``, buscamos nuestra instancia y le damos a __asignar__, de esta forma habremos logrado asignar una IP fija a nuestra instancia anteriormente creada

![Asignación de la IP elástica](img/acciones_ip_elastica.png)

<div id='mod-secure' />

### Modificación del grupo de seguridad

Debemos de editar el grupo de seguridad de este para no tener futuros problemas en nuestra práctica, para esto iremos al apartado de ``Red de Seguridad > Security Groups`` y aquí __seleccionaremos al grupo de seguridad que creamos anteriormente__ para nuestra instancia y aquí seleccionaremos __editar reglas de entrada__, se nos abrirá un panel con los puertos que hemos abierto y deberemos de tener los siguientes:

* __HTTP__ - Puerto __80__ - __0.0.0.0/0__
* __HTTPS__ - Puerto __403__ - __0.0.0.0/0__
* __SSH__ - Puerto __22__ - __0.0.0.0/0__
* __PUERTO PARA GOACCESS__ - Puerto __80__ - __0.0.0.0/0__

Una vez añadidos guardaremos los cambios

![Puertos abiertos](img/grupo_seguridad.png)

Con esto ya hemos terminado la configuración de nuestra instancia

