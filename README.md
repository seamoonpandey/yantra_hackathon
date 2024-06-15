# Yantra Hackathon Backend

This repository contains the backend for the Yantra Hackathon project. It is built with Node.js and Express, providing RESTful APIs for managing utensils.

## Table of Contents

- [Getting Started](#getting-started)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Environment Variables](#environment-variables)
- [Running the Server](#running-the-server)
- [API Endpoints](#api-endpoints)
- [Error Handling](#error-handling)

## Getting Started

To get started with the backend of this project, follow the instructions below.

## Prerequisites

- Node.js
- MongoDB

## Installation

1. Clone the repository:

   ```sh
   git clone https://github.com/seamoonpandey/yantra_hackathon.git
   cd yantra_hackathon
   ```

2. Install dependencies:

   ```sh
   npm install
   ```

## Environment Variables

Create a `.env` file in the root directory and add the following environment variables:

```sh
PORT=5000
MONGO_URI=your_mongodb_connection_string
HOST=localhost
```

## Running the Server

Start the server with the following command:

```sh
npm start
```

The server will run at `http://localhost:5000`.

## API Endpoints

### Utensils

- **Create a new utensil**

  - `POST /utensils`
  - Request Body: `{ name, image, subImages, description, uses, material }`

- **Get all utensils**

  - `GET /utensils`

- **Get a specific utensil by ID**

  - `GET /utensils/:id`

- **Update a specific utensil by ID**

  - `PUT /utensils/:id`
  - Request Body: `{ name, image, subImages, description, uses, material }`

- **Delete a specific utensil by ID**
  - `DELETE /utensils/:id`

### Search

- **Search utensil by name**
  - `GET /search`
  - Query Parameter: `query`

## Error Handling

Custom error handling middleware is used to catch and handle errors in the application. Errors are returned in JSON format with appropriate HTTP status codes.
