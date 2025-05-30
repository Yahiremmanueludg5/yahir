from flask import Flask, render_template, url_for,request, redirect,flash
from config import config
from models.entities.User import User
from models.ModelUser import ModelUser
from flask_mysqldb import MySQL
from werkzeug.security import generate_password_hash
from datetime import datetime
from flask_login import LoginManager, logout_user, login_user, current_user
from flask_mysqldb import MySQL

antojo = Flask(__name__)
db      = MySQL(antojo)
adminSesion = LoginManager(antojo)

@adminSesion.user_loader
def load_user(id):
    return ModelUser.get_by_id(db,id)

@antojo.route('/')
def home():
    return render_template('home.html')

@antojo.route('/signup',methods=['POST','GET'])
def signup():
    if request.method == 'POST':
        nombre = request.form['nombre']
        correo = request.form['correo']
        clave = request.form['clave']
        claveCifrada = generate_password_hash(clave)
        telefono = request.form['telefono']
        fechareg = datetime.now()
        regUsuario = db.connection.cursor()
        regUsuario.execute("INSERT INTO usuario(nombre,correo,clave,telefono,fechareg) VALUES (%s,%s,%s,%s,%s)",(nombre,correo,claveCifrada,telefono,fechareg))
        db.connection.commit()
        regUsuario.close()
        return redirect(url_for('home'))
    else:
        return render_template('signup.html')

@antojo.route('/signin',methods=['POST','GET'])
def signin():
    if request.method == 'POST':
        usuario = User(0, None, request.form['correo'], request.form['clave'], None, None, None)
        usuarioAutenticado = ModelUser.signin(db, usuario)
        if usuarioAutenticado is not None:
            if usuarioAutenticado.clave:
                login_user(usuarioAutenticado)
                if usuarioAutenticado.perfil == 'A':
                    return render_template('admin.html')
                else:
                    return render_template('user.html')
            else:
                flash('contraseña incorrecta')
                return redirect(request.url)
        else:
            flash('usuario inexistente')
            return redirect(request.url)
    else:
        return render_template('signin.html')
    
@antojo.route('/sUsuario',methods=['GET','POST'])
def sUsuario():
    selUsuario = db.connection.cursor()
    selUsuario.execute("SELECT * FROM usuario")
    u = selUsuario.fetchall()
    selUsuario.close()
    return render_template('users.html',usuarios=u)

@antojo.route('/iUsuario',methods=['GET','POST'])
def iUsuario():
    nombre = request.form['nombre']
    correo = request.form['correo']
    clave = request.form['clave']
    claveCifrada = generate_password_hash(clave)
    telefono = request.form['telefono']
    fechareg = datetime.now()
    regUsuario = db.connection.cursor()
    regUsuario.execute(
    "INSERT INTO usuario(nombre,correo,clave,telefono,fechareg) VALUES (%s,%s,%s,%s,%s)", 
    (nombre, correo, claveCifrada, telefono, fechareg)
)

    db.connection.commit()
    regUsuario.close()
    return redirect(url_for('sUsuario'))

@antojo.route('/uUsuario/<int:id>',methods=['GET','POST'])
def uUsuario(id):
    nombre = request.form['nombre']
    correo = request.form['correo']
    clave = request.form['clave']
    claveCifrada = generate_password_hash(clave)
    telefono = request.form['telefono']
    fechareg = datetime.now()
    perfil= request.form['perfil']
    actUsuario = db.connection.cursor()
    actUsuario.execute("UPDATE usuario SET nombre=%s,correo=%s,clave=%s,telefono=%s,fechareg=%s,perfil=%s WHERE id=%s",(nombre,correo,claveCifrada,telefono,fechareg,perfil,id))
    db.connection.commit()
    actUsuario.close()
    flash('usuario actualizado')
    return redirect(url_for('sUsuario'))

@antojo.route('/dUsuario/<int:id>', methods=['GET','POST'])
def dUsuario(id):
    delUsuario = db.connection.cursor()
    delUsuario.execute("DELETE FROM usuario WHERE id=%s",(id,))
    db.connection.commit()
    delUsuario.close()
    flash('Usuario Eliminado')
    return redirect(url_for('sUsuario'))

@antojo.route('/uProductos/<int:id>',methods=['GET','POST'])
def uProductos(id):
    nombre = request.form['nombre']
    correo = request.form['correo']
    clave = request.form['clave']
    claveCifrada = generate_password_hash(clave)
    telefono = request.form['telefono']
    fechareg = datetime.now()
    perfil= request.form['perfil']
    actUsuario = db.connection.cursor()
    actUsuario.execute("UPDATE usuario SET nombre=%s,correo=%s,clave=%s,telefono=%s,fechareg=%s,perfil=%s WHERE id=%s",(nombre,correo,claveCifrada,telefono,fechareg,perfil,id))
    db.connection.commit()
    actUsuario.close()
    flash('usuario actualizado')
    return redirect(url_for('sUsuario'))


if __name__ == '__main__':
    antojo.config.from_object(config['development'])
    antojo.run(port=3300,debug=True)