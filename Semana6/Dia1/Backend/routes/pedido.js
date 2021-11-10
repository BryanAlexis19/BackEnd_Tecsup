const express = require("express");

const router = express.Router();

const mysqlConnection = require("../lib/mysql");

router.get("/pedido", (req, res) => {
  mysqlConnection.query("select * from tbl_pedido", (err, rows, fields) => {
    if (!err) {
      res.json({
        ok: true,
        content: rows,
      });
    } else {
      console.log(err);
    }
  });
});

router.post('/pedido',(req,res) => {
    const pedido = req.body;
    let pedidoId = 0;
    
    let status = false;
    console.log("nro :" + pedido.pedido_nro);
    console.log("fecha :" + pedido.pedido_fech);
    console.log("estado :" + pedido.pedido_est);
    console.log("mesa :" + pedido.mesa_id);
    console.log("empleado :" + pedido.usu_id);
    pedido.pedidoplatos.forEach(item => console.log(item));
    mysqlConnection.query(
        'insert into tbl_pedido(pedido_nro,pedido_fech,pedido_est,mesa_id,empleado_id) values(?,?,?,?,?)'
        ,[pedido.pedido_nro,pedido.pedido_fech,pedido.pedido_est,pedido.mesa_id,pedido.usu_id],(err,rPedidoId,fields) => {
        if(!err){
            //consultar ultimo id
            pedidoId = rPedidoId.insertId;
            let pedido_plato_precio;
            console.log(pedidoId);
            //registrar detalle
            pedido.pedidoplatos.forEach(item => {
                console.log("registando pedido plato:"  + item); 
                pedido_plato_precio = item.plato_precio * item.pedido_plato_cant;
                    mysqlConnection.query(
                    'insert into tbl_pedido_plato(pedido_plato_cant,pedido_plato_pre,pedido_id,plato_id) values(?,?,?,?)'
                    ,[item.pedidoplato_cant,pedidoId,pedido_plato_precio,item.plato_id]
                    ,(err,rows,fields) => {
                        if(!err){
                            
                        }else{
                            console.log(err);
                        }
                    });
            }  
            );
            res.json(
                { 
                    "ok":true,
                }
                );
        
        
        
        
              }else{
            console.log(err);
        }
    });
});

module.exports = router;