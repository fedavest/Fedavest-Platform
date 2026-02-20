const ort = require("onnxruntime-node");
const fs = require("fs");
const path = require("path");

const MODEL_PATH = path.join(__dirname, "../models/riskmodel.onnx");
const META_PATH = path.join(__dirname, "../models/risk.json");

let session;
let metadata;

// ===== Load Model + Metadata Once =====
async function initializeModel() {
  if (!session) {
    session = await ort.InferenceSession.create(MODEL_PATH);
    metadata = JSON.parse(fs.readFileSync(META_PATH));
    console.log("✅ ONNX Model Loaded");
  }
}

// ===== One-hot encode SME Type =====
function encodeSMEType(type) {
  return [
    type === "processor" ? 1 : 0,
    type === "retailer" ? 1 : 0,
    type === "trader" ? 1 : 0,
  ];
}

// ===== Prediction =====
async function predictRisk(inputData) {
  if (!session) await initializeModel();

  const {
    profit_margin,
    funding_ratio,
    expense_ratio,
    supplier_fragility_score,
    largest_supplier_percentage,
    data_inconsistency_count,
    sme_type,
  } = inputData;

  const smeEncoded = encodeSMEType(sme_type);

  const features = [
    Number(profit_margin),
    Number(funding_ratio),
    Number(expense_ratio),
    Number(supplier_fragility_score),
    Number(largest_supplier_percentage),
    Number(data_inconsistency_count),
    ...smeEncoded,
  ];

  const tensor = new ort.Tensor(
    "float32",
    Float32Array.from(features),
    [1, 9]
  );

  const feeds = {};
  feeds[session.inputNames[0]] = tensor;

  const results = await session.run(feeds);

  /*
    Most sklearn ONNX exports return:
    outputNames[0] = label
    outputNames[1] = probabilities
  */

  const labelIndex = results[session.outputNames[0]].data[0];
  const probabilitiesArray =
    results[session.outputNames[1]].data;

  const classNames = metadata.classes;

  const probabilities = {
    Low: probabilitiesArray[0],
    Medium: probabilitiesArray[1],
    High: probabilitiesArray[2],
  };

  const riskLabel = classNames[labelIndex];

  // Risk score based on probability of High class
  const riskScore = Math.round(probabilities.High * 100);

  return {
    risk_score: riskScore,
    risk_label: riskLabel,
    probabilities,
  };
}

module.exports = {
  predictRisk,
  initializeModel,
};