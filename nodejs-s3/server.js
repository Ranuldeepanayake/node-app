const express = require('express');
const file = require('fs');
const app = express();

const router = express.Router();
app.use('/', router);
const port = 80;

const path = __dirname + '/views/';
app.use(express.static(path));

//Global config file.
var s3_config_data = JSON.parse(file.readFileSync('./configuration.json'));

const multer = require('multer');
const storage = multer.memoryStorage();

//File type filter.
const fileFilter = (req, file, cb) => {
    if (file.mimetype === 'image/jpeg' || file.mimetype === 'image/png') {
      cb(null, true);
    } else {
      cb(new Error('Invalid file type!'), false);
    }
  };
 
//File property restrictions.  
const upload = multer({ 
  storage: storage, 
  fileFilter: fileFilter ,
  limits: { fileSize: 1024 * 1024 * 10 } // Limiting file size to 10 MB
});

const AWS = require('aws-sdk');

const s3 = new AWS.S3({
    region: s3_config_data.s3_conf.region,
    accessKeyId: process.env.AWS_AKID, 
    secretAccessKey: process.env.AWS_SAK,
});

//Error handling.
app.use((error, req, res, next) => {
  if (error instanceof multer.MulterError) {
    res.status(400).send('Error uploading file: ' + error.message);
  } else if (error) {
    res.status(400).send('Error: ' + error.message);
  } else {
    next();
  }
});

//This function gets called for each request.
router.use(function (req,res,next) {
  //console.log('/' + req.method);
  console.log('Request received at: ', Date.now());
  next();
});

router.get('/', function(req,res){
  res.sendFile(path + 'index.html');
});

app.post('/upload', upload.single('file'), async (req, res) => {
    const file = req.file;
  
    const params = {
      Bucket: s3_config_data.s3_conf.bucket_name,
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

router.get('/list', function(req,res){
  res.sendFile(path + 'list.html');
});

app.listen(port, function () {
  console.log('Example app listening on port 80!')
})