const controller = {};

controller.getAll = (req,res)=> {
    req.getConnection((error, conn)=>{
        if(error) throw error;
        conn.query('SELECT * FROM personas',(err,results,fields)=>{
            if(err) throw error;
            res.send(results)
        })
    });
}

controller.get = (req,res)=> {
    req.getConnection((error, conn)=>{
        if(error) throw error;
        conn.query('SELECT * FROM personas WHERE id=?',req.params.id,(err,results,fields)=>{
            if(err) throw error;
            res.send(results)
            console.log(fields)
        })
    });
}

controller.post = (req, res)=>{
    console.log(req.body)
    req.getConnection((error, conn)=>{
        if(error){
            throw error;
        } 
        conn.query('INSERT INTO category set ?',[req.body],(err, rows)=>{
            if(err){
                console.log('es aca')
                throw error;
            } 
                console.log(rows)
            res.send('Registro creado correctamente')
        })
    })
}

controller.delete = (req, res)=>{
    req.getConnection((error, conn)=>{
        if(error) throw error;
        conn.query(`DELETE FROM personas WHERE id=?`,req.params.id,(err, rows)=>{
            if(err) throw err;
            if(rows.affectedRows == 0) res.send('No existe registro donde id=='+req.params.id);
            else res.send('Registro eliminado correctamente');
        })
    })
}

controller.put = (req, res)=>{
    req.getConnection((error, conn)=>{
        if(error) throw error;
        conn.query('UPDATE personas SET ? WHERE id=?',[ req.body, req.params.id ],(err, rows)=>{
            if(err) throw err;
            if(rows.affectedRows == 0) res.send('No existe registro donde id=='+req.params.id);
            else res.send('Registro editado correctamente');
        })
    })
}

export default controller;