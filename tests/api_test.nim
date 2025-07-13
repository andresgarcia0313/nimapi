import unittest, httpclient
import std/json           # para parseJson

const baseUrl = "http://127.0.0.1:5000"

suite "API usuarios":
  # Pruebas para /usuarios
  test "GET /usuarios → formato JSON válido":
    let client = newHttpClient()
    let resp = client.request(baseUrl & "/usuarios", HttpGet)
    check resp.code == Http200
    check resp.headers["Content-Type"].contains("application/json")
    let arr = parseJson(resp.body).getElems()
    check arr.len > 0

  test "GET /usuarios → estructura correcta de usuarios":
    let arr = parseJson(newHttpClient().getContent(baseUrl & "/usuarios")).getElems()
    for usuario in arr:
      check usuario.hasKey("id")
      check usuario.hasKey("nombre")
      check usuario["id"].kind == JInt
      check usuario["nombre"].kind == JString
      check usuario["nombre"].getStr().len > 0

  # Pruebas para /usuario/{id}
  test "GET /usuario/1 → usuario existente":
    let obj = parseJson(newHttpClient().getContent(baseUrl & "/usuario/1"))
    check obj["id"].getInt() == 1
    check obj["nombre"].getStr().len > 0

  test "GET /usuario con IDs límite":
    var client = newHttpClient()
    # ID negativo
    let respNeg = client.request(baseUrl & "/usuario/-1", HttpGet)
    check respNeg.code == Http404
    
    # ID cero
    let respZero = client.request(baseUrl & "/usuario/0", HttpGet)
    check respZero.code == Http404

  test "GET /usuario con ID inválido":
    var client = newHttpClient()
    # ID no numérico
    let resp = client.request(baseUrl & "/usuario/abc", HttpGet)
    check resp.code == Http400 or resp.code == Http404
