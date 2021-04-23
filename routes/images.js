const express = require("express");
const aws = require("aws-sdk");
const multer = require("multer");
const multerS3 = require("multer-s3");
const shortid = require("shortid");
require("dotenv").config();

const db = require("../db");
const router = new express.Router();

const { NotFoundError, BadRequestError } = require("../expressError");

aws.config.update({
    secretAccessKey: process.env.SECRET_ACCESS_KEY,
    accessKeyId: process.env.ACCESS_KEY_ID,
    region: process.env.S3_REGION
});

const s3 = new aws.S3();

var upload = multer({
    storage: multerS3({
      s3: s3,
      acl: "public-read",
      bucket: 'docustore-bucket',
    //   metadata: function(req, file, cb) {
    //     cb(null, { fieldName: file.fieldname})
    //   },
      key: function(req, file, cb) {
        console.log(file);
        cb(null, file.originalname);
      }
    })
  });

/** GET /images get list of images*/
router.get("/", async function (req, res, next) {
    console.log("WE IN GET ROUTE YO!!!!!!")

    const results = await db.query(
        `SELECT id, name, location from images`
    );
    const images = results.rows;
    return res.json({images: images});
});

//INSERT NAME INTO DB
router.post("/", upload.array('upl', 1), async function (req, res, next) {

    console.log("YOU HIT THE POST ENDPOINT FOR DB INSERTION!")
    
    const {name} = req.body;

    let s3ImageLocation = process.env.S3_BASE_URL + name + ".jpg"

    res.send('uploaded!')

    const results = await db.query(
        `INSERT INTO images (name, location)
            values ($1, $2)
            RETURNING id, name, location`, [name, s3ImageLocation]
    )

    console.log("THE URL IMAGE WAS SENT TO: ", s3ImageLocation)

    const image = results.rows[0];
    if (!image) {
        //throw 400 error instead
        return next(new NotFoundError())
    }

    return res.json({image});
});

//INSERT IMAGE INTO S3
router.post("/images-upl", upload.array('upl', 1), async function (req, res, next) {
    console.log("YOU HIT THE POST ENDPOINT FOR S3 UPLOAD!")
    res.send('uploaded!')
});

router.get("/:id", async function (req, res, next) {

    const results = await db.query(
        `SELECT id, name, location FROM images
         WHERE id = $1`, [req.params.id]
    );

    const imageResults = results.rows;

    if (imageResults.length === 0) {
        return next(new BadRequestError())
    }
    
    return res.json({imageResults});
  });

router.put("/:id", async function (req, res, next) {
    const {name} = req.body;

    const result = await db.query(
        `UPDATE images
        SET name = $1
        WHERE id = $2
        RETURNING id, name, location
        `, [name, req.params.id]
    )
    const updatedImage = result.rows[0]
    if (!updatedImage) {
        return next(new NotFoundError())
    }
    return res.json({image: updatedImage});
});

router.delete("/:id", async function (req, res, next) {

    const result = await db.query(
        `DELETE FROM images
        WHERE id = $1`, [req.params.id]
    )
    if (result.rowCount == 0) {
        return next(new NotFoundError())
    }

    return res.json({ status: "Deleted" });
});

module.exports = router;