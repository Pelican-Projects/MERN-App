import { MongoClient, ServerApiVersion } from "mongodb";
import dotenv from "dotenv";

dotenv.config(); // Load .env if it exists

const URI = process.env.MONGO_URI || "mongodb://mongo:27017/mern_db";

const client = new MongoClient(URI, {



try {
  await client.connect();
  await client.db("admin").command({ ping: 1 });
  console.log("Connected to MongoDB!");
} catch (err) {
  console.error("MongoDB connection error:", err);
}

let db = client.db("employees");

export default db;
