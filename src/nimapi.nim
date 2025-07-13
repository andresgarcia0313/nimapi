import jester, jsony, strutils, sequtils

type
  Usuario = object
    id: int
    nombre: string

let usuarios = @[
  Usuario(id: 1, nombre: "Ana"),
  Usuario(id: 2, nombre: "Luis"),
  Usuario(id: 3, nombre: "Carlos"),
  Usuario(id: 4, nombre: "Marta"),
  Usuario(id: 5, nombre: "Sofía"),
  Usuario(id: 6, nombre: "Pedro"),
  Usuario(id: 7, nombre: "Lucía")
]

routes:
  get "/usuarios":
    resp Http200, {"Content-Type": "application/json"}, usuarios.toJson()

  get "/usuario/@id":
    try:
      let id = request.params["id"].parseInt()
      if id <= 0:
        resp Http404, {"Content-Type": "application/json"}, """{"error":"ID inválido"}"""
      
      let user = usuarios.filterIt(it.id == id)
      if user.len > 0:
        resp Http200, {"Content-Type": "application/json"}, user[0].toJson()
      else:
        resp Http404, {"Content-Type": "application/json"}, """{"error":"Usuario no encontrado"}"""
    except ValueError:
      resp Http400, {"Content-Type": "application/json"}, """{"error":"ID debe ser un número"}"""

runForever()
