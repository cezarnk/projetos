package main

import (
    "database/sql"
    "log"
    "net/http"
    "text/template"

    _ "github.com/go-sql-driver/mysql"
)

type Produtos struct {
    Id    int
    Codigo  string
    Nome string
    Categoria_id string
    Linha_id string
}

func dbConn() (db *sql.DB) {
    dbDriver := "mysql"
    dbUser := "root"
    dbPass := "a17m10t55"
    dbName := "db_equipamentos"
    db, err := sql.Open(dbDriver, dbUser+":"+dbPass+"@/"+dbName)
    if err != nil {
        panic(err.Error())
    }
    return db
}

var tmpl = template.Must(template.ParseGlob("form/*"))

func Index(w http.ResponseWriter, r *http.Request) {
    db := dbConn()
    selDB, err := db.Query("select p.id, p.codigo, p.nome,c.nome,l.nome from produtos as p join categorias as c on c.id = p.categoria_id join                             linhas as l on l.id = p.linha_id")
    if err != nil {
        panic(err.Error())
    }
    
    emp := Produtos{}
    res := []Produtos{}
    for selDB.Next() {
        var id int
        var codigo, nome, categoria_id, linha_id string
        err = selDB.Scan(&id, &codigo, &nome, &categoria_id, &linha_id)
        if err != nil {
            panic(err.Error())
        }
        emp.Id = id
        emp.Codigo = codigo
        emp.Nome = nome
        emp.Categoria_id = categoria_id
        emp.Linha_id = linha_id
        res = append(res, emp)
    }
    tmpl.ExecuteTemplate(w, "Index", res)
    defer db.Close()
}

func New(w http.ResponseWriter, r *http.Request) {
    tmpl.ExecuteTemplate(w, "New", nil)
}

func Insert(w http.ResponseWriter, r *http.Request) {
    db := dbConn()
    if r.Method == "POST" {
        codigo := r.FormValue("codigo")
        nome := r.FormValue("nome")
        categoria_id := r.FormValue("categoria_id")
        linha_id := r.FormValue("linha_id")
        insForm, err := db.Prepare("INSERT INTO Produtos(codigo, nome, categoria_id, linha_id) VALUES(?,?,?,?)")
        if err != nil {
            panic(err.Error())
        }
        insForm.Exec(codigo, nome, categoria_id, linha_id)
        log.Println("INSERT: Codigo: " + codigo + " | nome: " + nome + " | categoria: " + categoria_id + " | linha: " + linha_id)
    }
    defer db.Close()
    http.Redirect(w, r, "/", 301)
}


func main() {
    log.Println("Server started on: http://localhost:8080")
    http.Handle("/form/", http.StripPrefix("/form/", http.FileServer(http.Dir("form"))))
    http.HandleFunc("/", Index)
    http.HandleFunc("/new", New)
    http.HandleFunc("/insert", Insert)


    http.ListenAndServe(":8080", nil)
}