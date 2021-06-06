const express = require('express')
const app = express()
const date = require('date-and-time');
var bodyParser = require('body-parser')
const { default: axios } = require('axios')
app.use(bodyParser.json())
var mysql = require('mysql');
const port = 3000

app.get('/', (req, res) => {
  res.send('Hello World!')
})
app.post('/login', async(req, res) => {
    const {email,password}=req.body
const login=await axios.get(`http://localhost/api.php/records/users?filter=email,eq,${email}&filter=password,eq,${password}&exclude=password&join=product`)
if(login.data.records.length==0){
    res.send({"error":1,"message":"Wrong Login","data":null})

}else{

    res.send({"error":0,"message":"login success","data":login.data.records[0]})

}
  })
app.post('/signUp',async(req,res)=>{
    const {email,password,phone,name}=req.body
const register=await axios.post(`http://localhost/api.php/records/users`,req.body)
res.send({"error":0,"message":"signup success","data":null})
})
app.post('/AssignProduct/:qr_code/:name/:owner_id',async (req,res)=>{
const check=await axios.get(`http://localhost/api.php/records/product?filter=qr_code,eq,${req.params.qr_code}`)
if(check.data.records.length==0){
  console.log(req.params);

  const register=await axios.post(`http://localhost/api.php/records/product`,req.params)
  res.send({
    "error":0,"message":"prodcut added successfully","data":register.data
  })
}
else{
  console.log(check.data.records[0].id);

  const register=await axios.put(`http://localhost/api.php/records/product/${check.data.records[0].id}`,req.params)

  res.send({
    "error":0,"message":"prodcut added successfully","data":check.data.records[0].id
  })

  res.send(check.data)

}




  
})
const now = new Date();
console.log(now);
async function addStatsMonthly(){
  time="";
  for(let i=1;i<31;i++){
    day = date.addDays(now, i);
    day=date.format(day,'D')
  

    data={

      "year":2021,
      "month":1,
      "day":day,
      "production":Math.floor(Math.random() * 10),
      "id_product":2
  
    }
console.log(data);

  await axios.post("http://localhost/api.php/records/production",data)
  
  }
  


}
//sum by month where year 
//SELECT `id_product`,`month`,`year`, SUM(production) AS monthProduction FROM production where year=2021 GROUP BY month ORDER by month
//sum by day where year and month 
//SELECT `id_product`, `day`,`month`,`year`, SUM(production) AS dayProduction FROM production where year=2021 and month=1 GROUP BY day ORDER by day
//sum by year 
//SELECT `id_product`,`year`, SUM(production) AS yearProduction FROM production where year=2021 and month=1 GROUP BY year ORDER by day


function splitToChunks(array, parts) {
  let result = [];
  for (let i = parts; i > 0; i--) {
      result.push(array.splice(0, Math.ceil(array.length / i)));
  }
  return result;
}
 const graphWeek=(id)=>{
   axios.get(`http://localhost/api.php/records/production?filter=id_product,eq,${id}&size=500`).then(
   async (resp)=>{
     var devideValue=parseInt(resp.data.records.length/7)
     console.log(devideValue);
     var consomation=[]
     var stats=[]
     var time=[]
     resp.data.records.forEach(production => {
      const nows = new Date(production.time);
      date.format(nows, 'YYYY/MM/DD HH:mm:ss');
       consomation.push(parseInt(production.production))
       time.push(nows)

     });
  
     splitToChunks(consomation,devideValue).forEach(elements=>{
      
    //  console.log(elements.reduce(add,0));
      stats.push(elements.reduce(add,0))
   
     })
     console.log(stats);
    }
 )


}
const graphDaily=(id)=>{
  axios.get(`http://localhost/api.php/records/production?filter=id_product,eq,${id}`).then(
  async (resp)=>{
    var consomation=[]
    var time=[]
    resp.data.records.forEach(production => {
     const nows = new Date(production.time);
     date.format(nows, 'YYYY/MM/DD HH:mm:ss');
      consomation.push(parseInt(production.production))
      time.push(nows)

    });
 
  
  // console.log(consomation);
    return consomation
   }
)


}
const graphYearly=(id)=>{

  con.connect(function(err) {
    if (err) throw err;
    con.query(`SELECT id_product,year, SUM(production) AS yearProduction FROM production where year=2021 and month=1 GROUP BY year ORDER by day`, function (err, result, fields) {
      if (err) throw err;
      console.log(result);
    });
  });
  axios.get(`http://localhost/api.php/records/production?filter=id_product,eq,${id}&size=8000`).then(
  async (resp)=>{
    var devideValue=parseInt(resp.data.records.length/365)
    var consomation=[]
    var stats=[]
    var time=[]
    resp.data.records.forEach(production => {
     const nows = new Date(production.time);
     date.format(nows, 'YYYY/MM/DD HH:mm:ss');
      consomation.push(parseInt(production.production))
      time.push(nows)

    });
 
    splitToChunks(consomation,devideValue).forEach(elements=>{
   
     stats.push(elements.reduce(add,0))
  
    })
    console.log(stats);
   }
)


 }

//graphWeek()
//graphDaily()
//graphYearly()
app.get('/graphDay/:id',async (req,res)=>{
  var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "flutter"
  });
var days=[];
var values=[];
var profit=[];
getMonth=date.format(now,'M');
getDay=date.format(now,'DD');

console.log({getMonth});
  con.connect(function(err) {
    if (err) throw err;
    con.query(`SELECT id_product, day,month,year, SUM(production) AS dayProduction,280 * SUM(production) AS profit FROM production where year=2021 and month=${getMonth} and id_product=${req.params.id} and day<=${getDay} GROUP BY day ORDER by day`, function (err, result, fields) {
      if (err) throw err;
      result.forEach((stat)=>{
        days.push(stat.day)
        values.push(stat.dayProduction)
        profit.push(stat.profit)


      })
   
    //  res.send({
    //    "days":days,
    //    "Values":values,
    //    'profit':profit
    //  });
     res.send(result)
    });
  });

})
app.get('/YearlyGen',(req,res)=>{
  
})
app.get('/graphMonth/:id',async (req,res)=>{
  var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "flutter"
  });
      
        getMonth=date.format(now,'M');
        console.log({getMonth});
  con.connect(function(err) {
    if (err) throw err;
    con.query(`SELECT id_product,month,year, SUM(production) AS monthProduction,280 * SUM(production) As win FROM production where year=2021 and  id_product=${req.params.id} and month<=${getMonth} GROUP BY month ORDER by month`, function (err, result, fields) {
      if (err) throw err;
      // result.forEach(stat=>{
      //   let date = new Date(2020, stat['month'], 21);
      //   let longMonth = date.toLocaleString('en-us', { month: 'long' });
      //   stat['month']= longMonth
      //   console.log(stat['month']);
        
      // })
     res.send(result);
    });
  });

})
app.get('/graphYear/:id',async (req,res)=>{
  var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "flutter"
  });
  con.connect(function(err) {
    if (err) throw err;
    con.query(`SELECT id_product,year, SUM(production) AS yearProduction ,280 * SUM(production) As win FROM production where month=1 and id_product=${req.params.id} GROUP BY year`, function (err, result, fields) {
      if (err) throw err;
      result.unshift({
        "id_product": 1,
        "year": 2021,
        "yearProduction": 0,
        "win": 0
        })
     res.send(result);
    });
  });

})
app.get('/AllgraphYear',async (req,res)=>{
  var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "flutter"
  });
  con.connect(function(err) {
    if (err) throw err;
    con.query(`SELECT id_product,year, SUM(production) AS yearProduction ,280 * SUM(production) As win FROM production where year=2021 and month=1 GROUP BY id_product`, function (err, result, fields) {
      if (err) throw err;
     res.send(result);
    });
  });

})
app.get('/graphMonth',async (req,res)=>{
  var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "flutter"
  });
  con.connect(function(err) {
    if (err) throw err;
    con.query(`SELECT month, SUM(production) AS monthProduction,280 * SUM(production) As win FROM production where year=2021 GROUP BY month `, function (err, result, fields) {
      if (err) throw err;
     res.send(result);
    });
  });

})
app.put('/updateProfile/:id',async(req,res)=>{
  const userId=req.params.id;
  console.log(req.body);
  if(req.body.email!=='' && req.body.password!=='' && req.body.name!==""){
    const update=await axios.put(`http://localhost/api.php/records/users/${userId}`,req.body)

  }else if(req.body.email!=='' && req.body.password=='' && req.body.name==""){
    data={
      "email":req.body.email
    }
    const update=await axios.put(`http://localhost/api.php/records/users/${userId}`,data)

  }
  else if(req.body.email=='' && req.body.password!=='' && req.body.name==""){
    data={
      "password":req.body.password
    }
    const update=await axios.put(`http://localhost/api.php/records/users/${userId}`,data)

  }
  else if(req.body.email=='' && req.body.password=='' && req.body.name!==""){
    data={
      "name":req.body.name
    }
    const update=await axios.put(`http://localhost/api.php/records/users/${userId}`,data)

  }
  else if(req.body.email!=='' && req.body.password!=='' && req.body.name==""){
    data={
      "email":req.body.email,
      "password":req.body.password
    }
    const update=await axios.put(`http://localhost/api.php/records/users/${userId}`,data)

  }
  else if(req.body.email=='' && req.body.password!=='' && req.body.name!==""){
    data={
      "name":req.body.name,
      "password":req.body.password
    }
    const update=await axios.put(`http://localhost/api.php/records/users/${userId}`,data)

  }
  else{
    data={
      "name":req.body.name,
      "email":req.body.email
    }
    const update=await axios.put(`http://localhost/api.php/records/users/${userId}`,data)
  }

console.log(userId);
})
 function add(accumulator, a) {
  return accumulator + a;
}

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})
