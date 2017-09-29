/* codigo original está en: 
Fry, Ben. “Mapping.” In Visualizing Data: Exploring and Explaining Data with the Processing Environment, 1 edition. Sebastopol, CA: O’Reilly Media, 2008.



el objetivo es crear una letra "y" utilizando datos de un archivo en formato .tsv 
*/


// se declara una tabla y una variable entera 
Table locationTable;
int rowCount;


void setup(){

//tamaño del lienzo
size (190,277);

//se crea una tabla de datos con el archivo .tsv que contiene las coordenadas para dibujar la "y"
locationTable = new Table ("locations.tsv");
//la variable rowCount usa la tabla con los datos y el número total de filas
rowCount =locationTable.getRowCount();

}


void draw(){
  
//variable que representa los segundos del computador. Solo varía si se declara en en el draw  
int s = second(); 
//fondo gris cálido
background(216,214,201);
//anti-aliasing para suavizar la imagen
smooth();



//LINEAS DE FONDO: 
//for para pintar líneas en el fondo
for(int i = 0; i < 277; i = i+5){  

//calibre de las líneas según la posición en Y del mouse
strokeWeight(mouseY*0.02);

//color de la línea es morado y cambia a coral después del segundo 30 del reloj
if (s < 30) {
    stroke(111,71,116);
  } else {
    stroke(217,77,66);
  }
  

//declaración de líneas para dibujarlas en el fondo
line(0, i, 190, i);

}



//LETRA:
//for para obtener las coordenadas del archivo .tsv
// los datos empiezan en 0, son menores que la cantidad total de las filas del archivo .tsv y se incrementan de 1 en 1
//se declaran 4 variales float correspondientes a los datos de cada columna del archivo
for(int row =0; row< rowCount;row++){  
float x1= locationTable.getFloat(row,1); //columna1
float y1= locationTable.getFloat(row,2); //columna2
float x2= locationTable.getFloat(row,3); //columna3
float y2= locationTable.getFloat(row,4); //columna4

//el valor del calibre de las líneas que definen la "y" resulta de multiplicar 60 por números aleatorios entre 0.05 y 0,3
strokeWeight(60*random(0.05,0.3));

//color de la línea amarillo
stroke(225,175,103);

//declaración de las líneas de la "y" que se generan con las variables del for
line(x1,y1,x2,y2);

}


}
