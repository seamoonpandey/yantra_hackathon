const mongoose = require('mongoose');

const utensilSchema = new mongoose.Schema(
{
    name: {
        type: String,
        required: true
    },
    image: {
        type: String,
        required: true
    },
    subImages: {
        type: [String],
        default: []
    },
    description: {
        type: String,
        default: ''
    },
    uses: {
        type: [String],
        default: []
    },
    material: {
        type: [String],
        default: []
    }
},
    {
        timestamps: true
    }
);

const Utensil = mongoose.model('Utensil', utensilSchema);

module.exports = Utensil;

