import mongoose from "mongoose";

const connectDB = async () => {
  try {
    await mongoose.connect(process.env.MONGO_URI).then(() => {
      console.log("Database connected");
    });
  } catch (error) {
    console.error(`Error: ${error.message}`);
    process.exit(1);
  }
};