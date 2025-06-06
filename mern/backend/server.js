import express from "express";
import cors from "cors";
import records from "./routes/record.js";
import dotenv from "dotenv";
dotenv.config();

const PORT = process.env.PORT || 5010;
const app = express();

app.use(cors());
app.use(express.json());
app.use("/record", records);

// start the Express server
app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`);
});
