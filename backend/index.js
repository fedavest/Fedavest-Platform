const express = require("express");
const cors = require("cors");
require("dotenv").config();

const authRoutes = require("./routes/authroutes");
const userRoutes = require("./routes/userroutes");
const smeRoutes = require("./routes/smeroutes");
const investorRoutes = require("./routes/investorroutes");
const adminRoutes = require("./routes/adminroutes");
const testRoutes = require("./routes/testroutes");

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
app.use("/api/v1/users", userRoutes);
app.use("/api/v1/sme", smeRoutes);
app.use("/api/v1/investors", investorRoutes);
app.use("/api/v1/admin", adminRoutes);
app.use("/api/v1/test", testRoutes);

const port = process.env.PORT || 2000;

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
