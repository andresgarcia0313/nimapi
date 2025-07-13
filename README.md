
# 🐦 NimAPI - Una API REST sencilla en Nim

**NimAPI** es una pequeña pero robusta API REST construida con [Jester](https://github.com/dom96/jester), diseñada como ejemplo educativo o punto de partida para microservicios en **Nim**. Expone información de usuarios ficticios a través de dos endpoints simples y validaciones claras, junto con pruebas automatizadas para garantizar su correcto funcionamiento.

---

## 🚀 Características

- ✅ API REST con rutas `GET /usuarios` y `GET /usuario/:id`
- 🧠 Validaciones de entrada (números, errores y límites)
- 🔍 Respuestas en formato JSON
- 🧪 Suite de pruebas automatizadas con `unittest`
- 📦 Gestión de dependencias y tareas con `nimble`

---

## 📁 Estructura del proyecto

```

nimapi/
├── nimapi.nimble          # Archivo de configuración del paquete
├── src/
│   └── nimapi.nim         # Lógica principal de la API
├── tests/
│   └── api\_test.nim       # Pruebas automatizadas

````

---

## 🔧 Instalación y ejecución

### Requisitos

- [Nim](https://nim-lang.org/) >= 1.6.14
- Dependencias (`jester`, `jsony`), que se instalan automáticamente con `nimble`

### Pasos para ejecutar

1. Clona el repositorio:
   ```bash
   git clone https://github.com/andresgarcia0313/nimapi.git
   cd nimapi
   ```

2. Compila y ejecuta el servidor:

   ```bash
   nimble run
   ```

3. Accede a la API desde tu navegador o cliente HTTP:

   * [`GET /usuarios`](http://127.0.0.1:5000/usuarios)
   * [`GET /usuario/:id`](http://127.0.0.1:5000/usuario/1)

---

## 🧪 Ejecutar las pruebas

El proyecto incluye una tarea personalizada para compilar el servidor, ejecutar pruebas y finalizar el proceso automáticamente.

```bash
nimble test
```

Esto:

* Lanza el servidor en segundo plano
* Ejecuta las pruebas definidas en `api_test.nim`
* Mata el servidor al finalizar y limpia los archivos temporales

---

## 📚 Endpoints

| Método | Ruta           | Descripción                     |
| ------ | -------------- | ------------------------------- |
| GET    | `/usuarios`    | Devuelve todos los usuarios     |
| GET    | `/usuario/:id` | Devuelve un usuario por su `id` |

### Ejemplo de respuesta

```json
GET /usuario/1

{
  "id": 1,
  "nombre": "Ana"
}
```

---

## ❗ Manejo de errores

* `404` si el usuario no existe o el ID es ≤ 0
* `400` si el ID no es un número
* Respuestas en JSON con mensajes claros

---

## 🛠️ Futuras mejoras

* Añadir POST/PUT/DELETE para CRUD completo
* Persistencia en base de datos
* Documentación Swagger/OpenAPI
* Dockerización del proyecto

---

## 👨‍💻 Autor

Desarrollado con 💡 por **Andrés Eduardo García Márquez**
📜 Licencia: [GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.html)

---

## 🤝 Contribuciones

¡Eres bienvenido a mejorar este proyecto! Puedes abrir un issue o enviar un pull request si encuentras errores o tienes ideas.

---

## 🧭 Nota final

Este proyecto es ideal para quien desea aprender sobre servidores ligeros en **Nim** sin complicaciones. Un punto de partida simple, pero con base sólida y extensible.

---

