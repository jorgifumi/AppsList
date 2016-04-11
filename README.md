# AppsList


##Características

AppsList es una aplicación que se conecta al servicio de rss de Itunes y se descarga en formato JSON las 20 aplicaciones gratuitas más populares.
Si no hay conexión, busca la ultima versión que se haya descargado, y si nunca se ha descargado utiliza una versión incluida en el propio bundle.
Los iconos se los descarga en segundo plano y los guarda en el directorio de cachés de la sandbox, a menos que tuviera guardada una versión anterior que entonces la carga directamente. Trabaje paralelamente en una versión con CoreData pero finalmente lo deje con ficheros ya que había solo dos entidades y una relación y veía más inconvenientes que ventajas.


##Compatibilidad

Es universal, en iPad presenta la lista en forma de Tabla y solo con orientación portrait, y en iPhone en una lista y orientación landscape. Se puede filtrar por categorías.

Está escrita íntegramente en Swift 2.2 y compatible desde IOS7


##Arquitectura

La arquitectura utilizada es MVVM+Wireframe, y se han aprovechado ventajas de programación orientada a protocolos.

Gracias a ello se ha podido hacer un único ViewModel que comparten ambos controladores y que permite que la capa de almacenamiento sea totalmente independiente de la de presentación. De esta forma es un código escalable, modular y facilmente testable.


##Presentación

El apartado visual es el menos trabajado, no obstante se ha utilizado autolayout y algunas size classes para aprovechar una única vista de detalle para todos los tamaños de pantalla.
