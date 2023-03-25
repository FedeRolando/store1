import Express from "express";
import controller from "../controllers/categories.js";

const router = Express.Router();

router.get('/', controller.getAll);
router.get('/:id', controller.get);
router.post('/categories', controller.post);
router.delete('/:id', controller.delete);
router.put('/:id', controller.put);

export default router;