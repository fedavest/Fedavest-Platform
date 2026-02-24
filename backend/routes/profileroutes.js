const express = require("express");
const router = express.Router();
const auth = require("../middleware/authmiddleware");
const profileController = require("../controllers/profilecontroller");

router.post("/create", auth, profileController.createProfile);
router.get("/me", auth, profileController.getMyProfile);
router.put("/update", auth, profileController.updateProfile);
router.delete("/delete", auth, profileController.deleteProfile);

console.log("auth:", auth);
console.log("controller:", profileController);
module.exports = router;