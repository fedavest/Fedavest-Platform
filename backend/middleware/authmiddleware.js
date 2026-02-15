const jwt = require("jsonwebtoken");

exports.verifyToken = (req, res, next) => {
  try {
    // get token from header
    const authHeader = req.headers["authorization"];

    if (!authHeader) {
      return res.status(401).json({ message: "Access denied. No token provided." });
    }

    // remove "Bearer "
    const token = authHeader.split(" ")[1];

    // verify token
    const decoded = jwt.verify(token, process.env.JWT_SECRET);

    // attach user info to request
    req.user = decoded;

    next();

  } catch (error) {
    res.status(401).json({ message: "Invalid or expired token" });
  }
};
