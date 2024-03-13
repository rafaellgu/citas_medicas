from  . import app, db
from .models import Medico, Paciente, Consultorio, Cita 
from flask import render_template, request, flash, redirect

#crear ruta para ver el listado de los medicos 
@app.route("/medicos")
def get_all_medicos():
    medicos = Medico.query.all()
    return render_template("medicos.html" , medicos=medicos )

@app.route("/consultorios")
def get_all_consultorios():
    consultorios = Consultorio.query.all()
    return render_template("consultorios.html" , consultorios=consultorios )

@app.route("/pacientes")
def get_all_pacientes():
    pacientes = Paciente.query.all()
    return render_template("pacientes.html" , pacientes = pacientes )

@app.route("/citas")
def get_all_citas():
    citas = Cita.query.all()
    return render_template("citas.html" , citas=citas )

#crear ruta traer el medico por id (get)
@app.route("/medicos/<int:id>")
def get_medico_by_id(id):
    #return "id del medico:" + str(id)
    #taer el medico ppo id utilizando la entidad Medico
    medico = Medico.query.get(id)
    #y meterlo a una vista
    return render_template("medico.html", 
                           med = medico)

@app.route("/paciente/<int:id>")
def get_paciente_by_id(id):
    #return "id del medico:" + str(id)
    #taer el medico ppo id utilizando la entidad Paciente
    paciente = Paciente.query.get(id)
    #y meterlo a una vista
    return render_template("paciente.html", 
                           p = paciente)

#crear una ruta para crear nuevo medico 
@app.route("/medicos/create", methods =['GET', 'POST'])
def crate_medico():
    #mostrar el formulario: metodo GET
    if( request.method == 'GET' ):
        #el usuario ingreso con navegador con http://localhost:5000/medicos/create
        especialidades = [
            "Cardiologia",
            "Pediatria",
            "Ontologia"
        ]
        return render_template("medico_form.html", 
                                especialidades = especialidades )
    
    ##cuando el usuario presiona el boton de guardar
    ## los datos del formulario viaja al servidor 
    ##utilizando el metodo POST
    elif(request.method == 'POST'):
        #cuando se presiona'guardar'
        #crear un objeto de tipo medico 
        new_medico = Medico(nombre = request.form ["nombre"],
                            apellidos = request.form["apellidos"],
                            tipo_identificacion = request.form["ti"],
                            numero_identificacion = request.form["ni"],
                            registro_medico = request.form["rm"],
                            especialidad = request.form["es"]
                            )
        #añadirlo a la sesion sqllchemy
        db.session.add(new_medico)
        db.session.commit()
        flash("Medico registrado correctamente")
        return redirect("/medicos")
    
@app.route("/medicos/update/<int:id>", methods=["POST" , "GET"])
def update_medico(id):
    especialidades = [
            "Cardiologia",
            "Pediatria",
            "Ontologia"
        ]
    medico_update = Medico.query.get(id)
    if(request.method == "GET"):
         return render_template("medico_update.html" , 
                           medico_update = medico_update,
                           especialidades = especialidades)
    elif(request.method == "POST"):
        #actualizar el medico, con los datos de form
        medico_update.nombre = request.form["nombre"]
        medico_update.apellidos = request.form["apellidos"]
        medico_update.tipo_identificacion = request.form["ti"]
        medico_update.numero_identificacion = request.form["ni"]
        medico_update.registro_medico = request.form["rm"]
        medico_update.especialidad = request.form["es"]
        db.session.commit()
        return "medico actualizado"
    
@app.route("/medicos/delete/<int:id>")
def delete_medico(id):
    medico_delete = Medico.query.get(id)
    db.session.delete(medico_delete)
    db.session.commit()
    return redirect("/medicos")
    
       
@app.route("/pacientes/create", methods =['GET', 'POST'])
def create_paciente():
    if( request.method == 'GET' ):
        #el usuario ingreso con navegador con http://localhost:5000/pacientes/create
        tipos_sangre = [
            "A+",
            "O+",
            "B+",
            "AB+",
            "A-",
            "O-",
            "AB-"
            ]
        return render_template("paciente_form.html", 
                                tipos_sangre = tipos_sangre )
    elif(request.method == 'POST' ):  
        new_paciente=Paciente(nombre = request.form ["nombre"],
                            apellidos = request.form["apellidos"],
                            tipo_identificacion = request.form["ti"],
                            numero_identificacion = request.form["ni"],
                            altura = request.form["al"],
                            tipo_sangre = request.form["ts"]
                            )
        
                
        db.session.add(new_paciente)
        db.session.commit()
        return "paciente registado"
    
    
@app.route("/consultorios/create", methods =['GET', 'POST'])
def create_consultorio():
    if( request.method == 'GET' ):
        #el usuario ingreso con navegador con http://localhost:5000/consultorios/create
        consultorios=[
            "31",
            "32",
            "33",
            "34",
            "35",
            "36",
            "37",
            "38",
            "39",
            "310",
            "311",
            "312"
            ]
        return render_template("consultorio_form.html",
                           consultorios=consultorios)
    
    elif(request.method =='POST'):
        new_consultorio=Consultorio(numero = request.form ["numero"])

        db.session.add(new_consultorio)
        db.session.commit()
        return "consultorio registrado"
    
