const express = require("express");
const cors = require("cors");
require("dotenv").config();

const authRoutes = require("./routes/authroutes");
const testRoutes = require("./routes/testroutes");

const app = express();

app.use(cors());
app.use(express.json());

app.use("/api/v1/auth", authRoutes);
app.use("/api/v1/test", testRoutes);

const port = process.env.PORT || 2000;

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
