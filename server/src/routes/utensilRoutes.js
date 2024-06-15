import express from "express";
import {
  createUtensil,
  getUtensils,
  getUtensilById,
  updateUtensil,
  deleteUtensil,
} from "../controllers/utensilsController.js";

const router = express.Router();

router.route("/").post(createUtensil).get(getUtensils);

router
  .route("/:id")
  .get(getUtensilById)
  .put(updateUtensil)
  .delete(deleteUtensil);

export default router;
