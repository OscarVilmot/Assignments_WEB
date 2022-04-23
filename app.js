const express = require('express')
const fs = require('fs')
const fetch = require('node-fetch')
const path = require('path')
require('dotenv'). config()

const app = express()
app.set('view engine', 'pug')
const port = 3000

app.use('/css', express.static(path.join(__dirname, 'node_modules/bootstrap/dist/css')))
app.use('/js', express.static(path.join(__dirname, 'node_modules/bootstrap/dist/js')))
app.use('/js', express.static(path.join(__dirname, 'node_modules/jquery/dist')))


let initialRequest = 'https://api.coincap.io/v2/exchanges?'
            + 'limit=20'

fetch(initialRequest)
.then(resp => resp.json())
.then(json => {
    fs.writeFile("data/exchanges.json", JSON.stringify(json, undefined, 2), (err) =>{
      if (err) { 
        console.log(err); 
      }
    })
}) 

app.get("/", (req, res) => {
  fs.readFile('data/map.json', (err, data) => {
    if(err){
      console.log(err)
    } else {
      let arrayVal = [], packet
      packet = JSON.parse(data)
      for(let a = 0; a < 30; a++){
        arrayVal.push(
          {
            'id' : a,
            'name' : packet.data[a].name,
            'symbol' : packet.data[a].symbol
          }
        )
      }
      res.render(path.join(__dirname,"template/index"), {list:arrayVal})
    }
  })
})

app.get("/about", (req, res) => {
  res.sendFile(path.join(__dirname, 'view/about.html'))
})

function getRank(json, symbol){
  let rank = -1
  for(a in json.data){
    if(json.data[a].symbol == symbol){
      rank = a
    }
  }
  return rank
}

app.get("/info/:crypto", (req, res) => {
  const raw = fs.readFileSync("data/map.json")
  const json = JSON.parse(raw)
  let rank = getRank(json, req.params.crypto)
  res.render(path.join(__dirname, "template/crypto"), {'crypto':json.data[rank]})
})

/*
app.get("/dev/test", (req, res) => {
  const raw = fs.readFileSync("data/map.json")
  console.log(raw)
  const json = JSON.parse(raw)
  res.jsonp(JSON.stringify(json, undefined, 2))
})
*/

app.listen(port, () => {
    console.log(`listening on port ${port}`)
})