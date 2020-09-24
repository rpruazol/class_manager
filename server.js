'use strict';

const express = require('express');
const pg = require('pg');
const methodOverride = require('method-override');

require('dotenv').config();


const PORT = process.env.PORT;
const app = express();
const client = new pg.Client(process.env.DATABASE_URL);

// express configs
app.set('view engine', 'ejs');
app.use(express.urlencoded({extended:true}));
app.use(methodOverride('_method'));
app.use(express.static('public'));

// routes
app.get('/', homeHandler);
app.get('/pairs', pairsHandler);
app.get('/randomizer', randomizerHandler);
app.get('/edit', editHandler);
app.get('/randomizer/results', randomizerResultsHandler);
app.put('/randomizer/reset', resetHandler);
app.post('/add', addHandler);
app.delete('/remove/:id', deleteHandler);


// misc functions
function randomStudent(arr) {
    return arr[Math.floor(Math.random() * arr.length)];
}

// function handlers

function homeHandler(req, res) {
    res.render('index');
}

function pairsHandler(req, res){
    res.render('pairs');
}

function randomizerHandler(req, res){
    res.render('randomizer', {student: null})
}

function editHandler(req, res) {
    let SQL = 'SELECT * FROM students';
    client
        .query(SQL)
        .then( result => {
            res.render('edit', {students: result.rows})
    })
}

function resetHandler(req, res){
    let SQL = 'UPDATE students SET available = true';
    client
        .query(SQL)
        .then(() => {
            res.render('randomizer', {student: null});
        })
}

function randomizerResultsHandler(req, res) {
    let SQL = 'SELECT * FROM students WHERE available = true;';
    client
        .query(SQL)
        .then( results => {
            let chosenOne = randomStudent(results.rows);
            let SQL = 'UPDATE students SET available = FALSE WHERE id = $1';
            if (chosenOne){
                console.log(chosenOne, SQL);
                client
                    .query(SQL, [chosenOne.id])
                    .then( (results) => {
                        console.log(results);
                        res.render('randomizer', {student: chosenOne});
                    })
            } else {
                res.render('randomizer', {student: {first_name: 'everyone has been picked!'}});
            }
        })
    }

function addHandler(req, res){

    console.log(`firstname: ${req.body.first_name.toLowerCase().trim()}`);
    console.log(`lastname: ${req.body.last_name.toLowerCase().trim()}`);
    let SQL = 'INSERT INTO students (first_name, last_name) VALUES($1, $2) RETURNING *;'
    let params = [req.body.first_name.toLowerCase().trim(), req.body.last_name.toLowerCase().trim()];

    client
        .query(SQL, params)
        .then( results => {
            console.log(results.rows[0]);
            res.redirect('/edit')
        })
}

function deleteHandler(req, res){
    
    let SQL = 'DELETE FROM students where id=$1 RETURNING *;'
    let params = [req.params.id];
    console.log(params);
    client
        .query(SQL, params)
        .then( () => {
            res.redirect('/edit');
        })

}

client.connect() 
    .then(() => {
        app.listen(PORT, () => {
            console.log(`listening on port ${PORT}`)
        })
    })
    .catch(err => console.log(err));
