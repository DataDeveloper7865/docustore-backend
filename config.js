"use strict";

/** Common config for message.ly */

// read .env files and make environmental variables
require("dotenv").config();

const DB_URI = (process.env.NODE_ENV === "test")
    ? `postgresql://${process.env.USER_NAME}:${process.env.DB_PASSWORD}@127.0.0.1/docustore_test`
    : `postgresql://${process.env.USER_NAME}:${process.env.DB_PASSWORD}@127.0.0.1/docustore`;

const SECRET_KEY = process.env.SECRET_KEY || "secret";

const BCRYPT_WORK_FACTOR = 12;

module.exports = {
  DB_URI,
  SECRET_KEY,
  BCRYPT_WORK_FACTOR,
};