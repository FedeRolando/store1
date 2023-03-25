const controller = {};

controller.getAll = (req,res)=> {
    console.log(req.query.category)
    let ids = '('+req.query.category+')'
    req.getConnection((error, conn)=>{
        if(error) throw error;
        conn.query(`
            select product.*
            from product_category
            join product on product.id = product_category.product_id
            where product_category.category_id in ${ids}`
        ,(err,results,fields)=>{
            if(err) throw error;
            res.send(results)
        })
    });
}

controller.get = (req,res)=> {
    req.getConnection((error, conn)=>{
        if(error) throw error;
        conn.query('SELECT * FROM product WHERE id=?',req.params.id,(err,results,fields)=>{
            if(err) throw error;
            res.send(results)
        })
    });
}

controller.post = (req, res)=>{
    req.getConnection((error, conn)=>{
        if(error) throw error;
        conn.query('INSERT INTO product set ?',[req.body],(err, rows)=>{
            if(err) throw error;
            res.send('Registro creado correctamente')
        })
    })
}

controller.delete = (req, res)=>{
    req.getConnection((error, conn)=>{
        if(error) throw error;
        conn.query(`DELETE FROM product_category WHERE product_id=?`, req.params.id, (err)=>{if(err) throw err});
        conn.query(`DELETE FROM product WHERE id=?`,req.params.id,(err, rows)=>{
            if(err) throw err;
            if(rows.affectedRows == 0) res.send('No existe registro donde id=='+req.params.id);
            else res.send('Registro eliminado correctamente');
        })
    })
}

controller.put = (req, res)=>{
    req.getConnection((error, conn)=>{
        if(error) throw error;
        conn.query('UPDATE product SET ? WHERE id=?',[ req.body, req.params.id ],(err, rows)=>{
            if(err) throw err;
            if(rows.affectedRows == 0) res.send('No existe registro donde id=='+req.params.id);
            else res.send('Registro editado correctamente');
        })
    })
}

export default controller;