const express = require('express');
const app = express();
const router = express.Router();

const path = __dirname + '/views/';
const port = 80;

const multer = require('multer');
const storage = multer.memoryStorage();

const fileFilter = (req, file, cb) => {
    if (file.mimetype === 'image/jpeg' || file.mimetype === 'image/png') {
      cb(null, true);
    } else {
      cb(null, false);
    }
  };
  
const upload = multer({ storage: storage, fileFilter: fileFilter });

const AWS = require('aws-sdk');

const s3 = new AWS.S3({
    region: "ap-southeast-1",
    accessKeyId: process.env.AWS_ACCESS_KEY_ID, 
    secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY,
});

router.use(function (req,res,next) {
  console.log('/' + req.method);
  next();
});

router.get('/', function(req,res){
  res.sendFile(path + 'index.html');
});

app.post('/upload', upload.single('file'), async (req, res) => {
    const file = req.file;
  
    const params = {
      Bucket: "bucket-general-1",
      Key: file.originalname,
      Body: file.buffer,
      ContentType: file.mimetype
    };
  
    try {
      await s3.upload(params).promise();
      res.status(200).send('File uploaded to S3 successfully!');
    } catch (error) {
      console.error(error);
      res.status(500).send('Error uploading file to S3');
    }
  });

//router.get('/sharks', function(req,res){
//  res.sendFile(path + 'sharks.html');
//});

app.use(express.static(path));
app.use('/', router);

app.listen(port, function () {
  console.log('Example app listening on port 80!')
})