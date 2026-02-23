const express = require("express");
const router = express.Router();
const auth = require("../middleware/authmiddleware");
const investorController = require("../controllers/investorcontroller");

/* Profile */
router.post("/profile", auth, investorController.createOrUpdateProfile);
router.get("/profile/me", auth, investorController.getMyProfile);

/* Preferences */
router.post("/preferences", auth, investorController.setPreferences);
router.get("/preferences/me", auth, investorController.getPreferences);

module.exports = router;