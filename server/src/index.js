import express from "express";
import dotenv from "dotenv";
import cookieParser from "cookie-parser";
import cors from "cors";
import multer from "multer";
import connectDB from "./config/db.js";
import { notFound, errorHandler } from "./middleware/errorMiddleware.js";
import utensilRoutes from "./routes/utensilRoutes.js";

dotenv.config();

const app = express();
const upload = multer();
const port = process.env.PORT || 5000;
const host = process.env.HOST || "localhost";

connectDB();

app.use(express.urlencoded({ extended: true }));
app.use(upload.array("files"));
app.use(express.json());

app.use(cookieParser());
app.use(cors());

app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.use("/utensils", utensilRoutes);

app.use(notFound);
app.use(errorHandler);

app.listen(port, host, () => {
  console.log(`Server running at http://${host}:${port}`);
});
