const express = require("express");

const db = require("../db");
const router = new express.Router();

//to be removed in production
const BASE_FILE_URL = "C:/Users/19258/Desktop/Code/RithmSchool/week-10/docustore/backend/local_file_store/";

const { NotFoundError, BadRequestError } = require("../expressError");

/** GET /images get list of images*/ 
router.get("/", async function (req, res, next) {

    const results = await db.query(
        `SELECT id, name, location from images`
    );
    const images = results.rows;
    return res.json({images: images});
});

router.post("/", async function (req, res, next) {
    const {name} = req.body;

    const results = await db.query(
        `INSERT INTO images (name, location)
            values ($1, $2)
            RETURNING id, name, location`, [name, BASE_FILE_URL+name+".jpg"]
    )

    const image = results.rows[0];
    if (!image) {
        //throw 400 error instead
        return next(new NotFoundError())
    }

    return res.json({image});
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