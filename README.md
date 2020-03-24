# ImageAlter
Implementación de filtros y detección facial en *Processing* haciendo uso de *OpenCV*.

# Ejecución 
* Descarga el repositorio
* Son necesarias las librerías [OpenCV v4](https://drive.google.com/file/d/1QhF6hyN5PhdL06tKf6qkDH_88M_zEzRo/view) y [Processing Video R5](https://github.com/processing/processing-video/releases/tag/r5-v2.0-beta3). Para su instalación [aquí](https://github.com/processing/processing/wiki/How-to-Install-a-Contributed-Library) la explicación oficial de *Processing*.
* Abre el archivo ImageAlter.pde con Processing-IDE (Versión 3.x)

**Nota:** El sketch solo ha sido probado en linux, se desconoce su funcionamiento en otros sistemas operativos.
Para asegurar su funcionamiento en Linux es obligatorio el uso de la versión de *Processing Video* enlazada, para su funcionamiento se requiere tener instalado *tesseract-ocr* que puede obtenerse mediante el gestor de paquetes de la mayoría de distros.

# Implementación
**Imagealter.pde** gestiona el dibujado y modificación de la imagen.
**CVFaces.pde** detecta las caras usando OpenCV.
Se ha optado por solo detectar una cara dado que OpenCV detecta numerosas caras inexistentes si las condiciones no son óptimas.

Se hace uso de un timer de Java para la redimensión y recarga de la imagen de la televisión ya que en *Processing* si se efectua un *resize* de forma constante sobre una imagen hace que esta pierda definición pero si esta se recargase en cada frame generaría una carga innecesaria que disminuiría de forma drástica el *framerate* del
 *Sketch*.

# Funcionamiento
Aquí puede verse el programa en ejecución:
![Ejecución del programa](https://github.com/audepe/ImageAlter/blob/master/demo.gif)

# Referencias
* [OpenCV](https://docs.opencv.org/4.0.0/)
* [Processing](https://processing.org/reference/)
* [Ejemplos del libro 'Pro Processing for Images and Computer Vision with OpenCV' de Bryan WC Chung ](https://github.com/Apress/pro-processing-images-and-computer-vision-opencv)