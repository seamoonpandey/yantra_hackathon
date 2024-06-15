import mongoose from "mongoose";

const utensilSchema = mongoose.Schema(
  {
    name: {
      type: String,
      required: true,
    },
    image: {
      type: String,
      required: true,
    },
    subImages: [
      {
        type: String,
      },
    ],
    description: {
      type: String,
    },
    uses: [
      {
        type: String,
      },
    ],
    material: [
      {
        type: String,
      },
    ],
  },
  {
    timestamps: true,
  }
);

const Utensil = mongoose.model("Utensil", utensilSchema);

export default Utensil;
