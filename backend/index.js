const express = require("express");
const cors = require("cors");
require("dotenv").config();

const authRoutes = require("./routes/authroutes");
const readinessroutes = require("./routes/readinessroute");
const riskroutes = require("./routes/riskroute");
const profileRoutes = require("./routes/profileroutes");
const app = express();

app.use(cors());
app.use(express.json());

app.get("/", (req, res) => {
  res.json({
    message: "Welcome to FedaVest API",
    version: "1.0.0",
    status: "Healthy"
  });
});

app.use("/api/v1/auth", authRoutes);
app.use("/api/v1/ai", readinessroutes);
app.use("/api/v1/ai", riskroutes);
app.use("/api/profile", profileRoutes);

const port = process.env.PORT || 2000;

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
