import express from "express";
import { searchUtensilByName } from "../controllers/searchController.js";

const router = express.Router();

router.route("/").get(searchUtensilByName);

export default router;
