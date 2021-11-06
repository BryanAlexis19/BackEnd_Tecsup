const express = require('express');

const router = express.Router();

const mysqlConnection = require('../lib/mysql');

router.get('/categoria',(req,res) =>  {
    mysqlConnection.query('CALL getAllCategorias()',(err,rows,fields) => {
        if(!err){
            res.json(rows[0]);
        }else{
            console.log(err);
        }
    });
});

router.get('/categoria/:id', (req,res) => {
    const { id } = req.params;
    mysqlConnection.query('CALL getCategoriaById(?)',[id],(err,rows,fields) => {
        if(!err){
            res.json(rows[0]);
        }else{
            console.log(err);
        }
    });
});

router.get('/categoria/:id/plato',(req,res) =>{
    const { id } = req.params;
    mysqlConnection.query('CALL getPlatoByCategoria(?)', [id] ,(err,rows)=>{
        if(!err){
            res.json(rows[0]);
        }else{
            console.log(err);
        }
    });    
})
module.exports = router;