DROP IF EXISTS user;
DROP IF EXISTS categoria;
DROP IF EXISTS proveedor;
DROP IF EXISTS venta;
DROP IF EXISTS pedido;


CREATE TABLE user(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    nombres TEXT NOT NULL,
    apellidoP TEXT NOT NULL,    
    apellidoM TEXT NOT NULL,
    rol TEXT NOT NULL
);

CREATE TABLE categoria(
    id INTEGER PRIMARY KEY AUTOINCREMENT,    
    categoria TEXT NOT NULL,            
);

CREATE TABLE proveedor(
    id INTEGER PRIMARY KEY AUTOINCREMENT,    
    nombre TEXT NOT NULL,            
);

CREATE TABLE producto(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    cantidad INTEGER,
    precio FLOAT,
    categoria_id int DEFAULT NULL,
    proveedor_id int DEFAULT NULL,
    FOREIGN KEY (categoria_id) REFERENCES categoria(id),
    FOREIGN KEY (proveedor_id) REFERENCES proveedor(id)
);

CREATE TABLE venta(
    id INTEGER PRIMARY KEY AUTOINCREMENT,    
    id_user INTEGER DEFAULT NULL,
    monto FLOAT,
    FOREIGN KEY (id_user) REFERENCES user(id)    
);

CREATE TABLE pedido(
    id_venta INTEGER,    
    id_producto INTEGER,    
    cantidad TEXT NOT NULL,            
    FOREIGN KEY (id_venta) REFERENCES venta(id),
    FOREIGN KEY (id_producto) REFERENCES producto(id)
);