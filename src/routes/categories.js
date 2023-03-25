import Express from "express";
import controller from "../controllers/categories.js";

const router = Express.Router();

router.get('/categories', controller.getAll);
router.get('/categories/:id', controller.get);
router.post('/categories', controller.post);
router.delete('/categories/:id', controller.delete);
router.put('/categories:id', controller.put);

export default router;