const ort = require("onnxruntime-node");
const fs = require("fs");
const path = require("path");

// Load scaler
const scaler = JSON.parse(
  fs.readFileSync(path.join(__dirname, "../models/scaler.json"))
);

// Load ONNX model 
let session;

async function loadModel() {
  session = await ort.InferenceSession.create(
    path.join(__dirname, "../models/readiness_model.onnx")
  );
  console.log("AI Model Loaded");
}

loadModel();

function scaleFeatures(features) {
  if (!scaler.min || !scaler.max) {
    throw new Error("Scaler JSON must contain min and max arrays");
  }

  if (features.length !== scaler.min.length) {
    throw new Error(
      `Feature length mismatch. Expected ${scaler.min.length}, got ${features.length}`
    );
  }

  return features.map((value, i) => {
    const min = scaler.min[i];
    const max = scaler.max[i];

    // avoid divide by zero safety
    if (max - min === 0) return 0;

    return (value - min) / (max - min);
  });
}


async function predictReadiness(inputFeatures) {
  try {
    const scaled = scaleFeatures(inputFeatures);

    const tensor = new ort.Tensor(
      "float32",
      Float32Array.from(scaled),
      [1, scaled.length]
    );

    const feeds = { float_input: tensor };

    const results = await session.run(feeds);

    // predicted class (0,1,2)
    const predictedClass = Number(results.label.cpuData[0]);

    // probabilities array
    const probsArray = Array.from(results.probabilities.cpuData);
    const confidence = probsArray[predictedClass];

    //  class → category
    const categories = ["Low", "Medium", "High"];
    const category = categories[predictedClass];

    //  convert class → 0–100 score
    const scoreRanges = [
      { min: 0, max: 40 },   // Low
      { min: 40, max: 70 },  // Medium
      { min: 70, max: 100 }  // High
    ];

    const range = scoreRanges[predictedClass];
    const score = range.min + confidence * (range.max - range.min);
    const readinessScore = Math.round(score);

    // label for UI
    let label = "Needs Improvement";
    if (predictedClass === 1) label = "Good";
    if (predictedClass === 2) label = "Excellent";

    return {
      score: readinessScore,
      category,
      label,
      confidence
    };

  } catch (err) {
    console.error(err);
    throw err;
  }
}

module.exports = { predictReadiness };
