from flask import Flask, render_template, request, redirect, url_for, flash
from flask_mysqldb import MySQL
import MySQLdb.cursors

app = Flask(__name__)
app.secret_key = 'supersecretkey'

# Configuración de la base de datos
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'Armario_futbol'

mysql = MySQL(app)

# Carrito de compras (local en memoria)
carrito = []

@app.route('/')
def index():
    # Obtener productos desde la base de datos
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute("SELECT * FROM productos")
    productos = cursor.fetchall()
    return render_template('index.html', productos=productos)
@app.route('/producto/<int:id>', methods=['GET', 'POST'])
def producto_detalle(id):
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute("SELECT * FROM productos WHERE id = %s", (id,))
    producto = cursor.fetchone()
    
    if producto:
        if request.method == 'POST':
            talle_seleccionado = request.form.get('talle')
            carrito.append({'producto': producto, 'talle': talle_seleccionado})
            flash('Producto agregado al carrito!', 'success')
            return redirect(url_for('ver_carrito'))
        return render_template('producto_detalle.html', producto=producto)
    else:
        return "Producto no encontrado", 404

@app.route('/carrito')
def ver_carrito():
    total = sum(item['producto']['precio'] for item in carrito)
    return render_template('carrito.html', carrito=carrito, total=total)

@app.route('/eliminar/<int:index>', methods=['POST'])
def eliminar_producto(index):
    if 0 <= index < len(carrito):
        del carrito[index]  # Eliminar producto del carrito
        flash('Producto eliminado del carrito!', 'success')
    return redirect(url_for('ver_carrito'))

@app.route('/pago/<metodo>', methods=['GET', 'POST'])
def pago(metodo):
    if request.method == 'POST':
        # Aquí puedes procesar el pago según el método elegido
        return f"Has elegido pagar con {metodo}. ¡Gracias por tu compra!"
    
    return render_template('pago.html', metodo=metodo)

@app.route('/comprar', methods=['POST'])
def comprar():
    metodo_pago = request.form.get('metodo_pago')
    if metodo_pago:
        return redirect(url_for('pago', metodo=metodo_pago))
    return redirect(url_for('ver_carrito'))

if __name__ == '__main__':
    app.run(debug=True)