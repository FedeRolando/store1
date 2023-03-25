import express from "express";
import controller from "../controllers/products.js";

const router = express.Router();

router.get('/products', controller.getAll);
router.get('/products/:id', controller.get);
router.post('/products', controller.post);
router.delete('/products/:id', controller.delete);
router.put('/products/:id', controller.put);

export default router;