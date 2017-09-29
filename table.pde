//clase Tabla con secuencias de caracteres organizados por columnas y filas en una tabla
//y hay un entero para contar las filas
class Table {
  String[][] data;
  int rowCount;
  
  //se crea una tabla con una variable data que tiene secuencias de caracteres (string) en grupos de variables []
  Table() {
    data = new String[10][10];
  }


  //método para leer la información de la tabla creo
  Table(String filename) {
    String[] rows = loadStrings(filename);
    data = new String[rows.length][];
    
    for (int i = 0; i < rows.length; i++) {
      if (trim(rows[i]).length() == 0) {
        continue; // no tiene en cuenta los espacios vacíos
      }
      if (rows[i].startsWith("#")) {
        continue;  // salta las líneas comentadas creo
      }
      
      // separa las filas por tabs
      String[] pieces = split(rows[i], TAB);
     
      // copia al [array] de la tabla
      data[rowCount] = pieces;
      rowCount++;
      
      // ni idea: this could be done in one fell swoop via:
      // data[rowCount++] = split(rows[i], TAB);
    }
    // cambia el tamaño de data según sea necesario
    data = (String[][]) subset(data, 0, rowCount);
  }


  int getRowCount() {
    return rowCount;
  }
  
  //busca la fila por su nombre y retorna -1 si no la encuentra
  int getRowIndex(String name) {
    for (int i = 0; i < rowCount; i++) {
      if (data[i][0].equals(name)) {
        return i;
      }
    }
    println("No row named '" + name + "' was found");
    return -1;
  }
  
  
  String getRowName(int row) {
    return getString(row, 0);
  }


  String getString(int rowIndex, int column) {
    return data[rowIndex][column];
  }

  
  String getString(String rowName, int column) {
    return getString(getRowIndex(rowName), column);
  }

  
  int getInt(String rowName, int column) {
    return parseInt(getString(rowName, column));
  }

  
  int getInt(int rowIndex, int column) {
    return parseInt(getString(rowIndex, column));
  }

  
  float getFloat(String rowName, int column) {
    return parseFloat(getString(rowName, column));
  }

  
  float getFloat(int rowIndex, int column) {
    return parseFloat(getString(rowIndex, column));
  }
  
  
  void setRowName(int row, String what) {
    data[row][0] = what;
  }


  void setString(int rowIndex, int column, String what) {
    data[rowIndex][column] = what;
  }

  
  void setString(String rowName, int column, String what) {
    int rowIndex = getRowIndex(rowName);
    data[rowIndex][column] = what;
  }

  
  void setInt(int rowIndex, int column, int what) {
    data[rowIndex][column] = str(what);
  }

  
  void setInt(String rowName, int column, int what) {
    int rowIndex = getRowIndex(rowName);
    data[rowIndex][column] = str(what);
  }

  
  void setFloat(int rowIndex, int column, float what) {
    data[rowIndex][column] = str(what);
  }


  void setFloat(String rowName, int column, float what) {
    int rowIndex = getRowIndex(rowName);
    data[rowIndex][column] = str(what);
  }
  
  
// construye la tabla
  void write(PrintWriter writer) {
    for (int i = 0; i < rowCount; i++) {
      for (int j = 0; j < data[i].length; j++) {
        if (j != 0) {
          writer.print(TAB);
        }
        if (data[i][j] != null) {
          writer.print(data[i][j]);
        }
      }
      writer.println();
    }
    writer.flush();
  }
}

