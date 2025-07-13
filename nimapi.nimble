# Package

version       = "0.1.0"
author        = "Andrés Eduardo García Márquez"
description   = "A new awesome nimble package"
license       = "GPL-3.0-or-later"
srcDir        = "src"
bin           = @["nimapi"]


# Dependencies

requires "nim >= 1.6.14", "jester", "jsony"

# Task de prueba
task test, "Ejecuta el servidor API y las pruebas automatizadas":
  let serverCmd = "nimble c -r src/nimapi.nim"
  exec serverCmd & " > server.log 2>&1 & echo $! > server.pid"
  exec "sleep 2 || true"
  exec "nim c -r tests/api_test.nim"
  try:
    let pid = readFile("server.pid").strip()
    exec "kill " & pid
    exec "rm server.pid server.log"
    echo "Servidor cerrado (PID: " & pid & ")"
  except:
    echo "Error al cerrar el servidor"

