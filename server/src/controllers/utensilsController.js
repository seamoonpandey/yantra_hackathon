const express = require('express');
const Utensil = require('../models/utensil');

const router = express.Router();

// Create a new utensil
router.post('/', async (req, res) => {
  try {
    const utensil = new Utensil(req.body);
    await utensil.save();
    res.status(201).send(utensil);
  } catch (error) {
    res.status(400).send(error);
  }
});

// Get all utensils
router.get('/', async (req, res) => {
  try {
    const utensils = await Utensil.find();
    res.status(200).send(utensils);
  } catch (error) {
    res.status(500).send(error);
  }
});

// Get a specific utensil by ID
router.get('/:id', async (req, res) => {
  try {
    const utensil = await Utensil.findById(req.params.id);
    if (!utensil) {
      return res.status(404).send();
    }
    res.status(200).send(utensil);
  } catch (error) {
    res.status(500).send(error);
  }
});

// Update a specific utensil by ID
router.patch('/:id', async (req, res) => {
  const updates = Object.keys(req.body);
  const allowedUpdates = ['name', 'image', 'subImages', 'description', 'uses', 'material'];
  const isValidOperation = updates.every((update) => allowedUpdates.includes(update));

  if (!isValidOperation) {
    return res.status(400).send({ error: 'Invalid updates!' });
  }

  try {
    const utensil = await Utensil.findById(req.params.id);

    if (!utensil) {
      return res.status(404).send();
    }

    updates.forEach((update) => utensil[update] = req.body[update]);
    await utensil.save();
    res.status(200).send(utensil);
  } catch (error) {
    res.status(400).send(error);
  }
});

// Delete a specific utensil by ID
router.delete('/:id', async (req, res) => {
  try {
    const utensil = await Utensil.findByIdAndDelete(req.params.id);

    if (!utensil) {
      return res.status(404).send();
    }

    res.status(200).send(utensil);
  } catch (error) {
    res.status(500).send(error);
  }
});

module.exports = router;

