import asyncHandler from "express-async-handler";
import Utensil from "../models/utensil.js";

// @desc    Search utensil by name
// @route   GET /api/search
// @access  Public
const searchUtensilByName = asyncHandler(async (req, res) => {
  const { query } = req.query;

  if (!query) {
    res.status(400);
    throw new Error("Query parameter is required");
  }

  const utensil = await Utensil.findOne({
    name: { $regex: new RegExp(`^${query}$`, "i") },
  });

  if (utensil) {
    res.status(200).json(utensil);
  } else {
    res.status(404);
    throw new Error("Utensil not found");
  }
});

export { searchUtensilByName };
