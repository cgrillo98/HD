
//el objetivo es crear una letra "y" utilizando datos de un archivo .tsv y del tiempo en segundos registrado por el computador 



//???????
Table locationTable;
int rowCount;



void setup(){

  //tamaño del lienzo
size (190,277);

//make a data table from a file that contains the coordinates of each state
locationTable = new Table ("locations.tsv");
rowCount =locationTable.getRowCount();

}


void draw(){
  
//variable que representa los segundos del computador. Solo varía en el draw  
int s = second(); 
background(255);
//anti-aliasing para suavizar la imagen
smooth();



//LINEAS DE FONDO: 
//for para pintar líneas del fondo
for(int i = 0; i < 277; i = i+5){  


//calibre de las líneas según la posición en Y del mouse
strokeWeight(mouseY*0.02);

//color de la línea y relleno con transparencia
stroke(60);
fill(115,50,80,20);

//declaración de los cuadros con las coordenadas del archivo en .tsv para dibujar en el fondo
line(0, i, 190, i);

}









//LETRA:
//for para pintar líneas con las coordenadas del archivo .tsv
//diferentes archivos tsv pueden reresentar diferentes letras del alfabeto

for(int row =0; row< rowCount;row++){  
float x1= locationTable.getFloat(row,1); //columna1
float y1= locationTable.getFloat(row,2); //columna2
float x2= locationTable.getFloat(row,3); //columna3
float y2= locationTable.getFloat(row,4); //columna4

//calibre de las líneas que definen la "y", según los segundos que pasan en el reloj del computador (cambia 60 veces)
strokeWeight(s*0.05);
//color de la línea verde
stroke(84,191,172);

//declaración de las líneas con las coordenadas del archivo en .tsv para dibujar la "y"
line(x1,y1,x2,y2);


}









}