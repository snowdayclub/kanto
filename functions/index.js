const functions = require("firebase-functions");
const fetch = require("node-fetch")
// express
const express = require('express');
const cors = require('cors');

const radioStationServer = 'https://de1.api.radio-browser.info'
const weatherServer = 'https://dd.weather.gc.ca';

const app = express();
app.use(cors({ origin: true }));

app.get('/topclick/:count', async (request, response) => {
  const count = parseInt(request.params.count, 10);
  if(count === NaN || count < 1 || count > 100) {
    response.status(400).send('bad request')
  }
  
  let res = await fetch(
    `${radioStationServer}/json/stations/topclick/${count}`, {
      method: "GET",
    }
    );
    if (res.ok) {
      response.set('Access-Control-Allow-Origin', 'https://kanto-d580e.web.app');
      response.send(await res.json());
    } else {
      response.status(503).send('service unavailable');
    }
  })
  
// HTTP function yields ERROR in Mixed Content
exports.radioBrowserProxy = functions.https.onRequest(app);

// Callable function yields WARNING in Mixed Content
exports.getTopClickStations = functions.https.onCall(async(data, context) => {
  // number of stations to request
  const count = data.count;
  // get
  let res = await fetch(
    `${radioStationServer}/json/stations/topclick/${count}`, {
      method: "GET",
    }
  );
  // return data as a json format string
  return {
    stations: await res.json()
  };
});

exports.getStationsByUuid = functions.https.onCall(async(data, context) => {
  // list of uuid
  const uuids = data.uuids;
  // get
  let res = await fetch(
    `${radioStationServer}/json/stations/byuuid?uuids=${uuids}`, {
      method: "GET",
    }
  );
  // return data as a json format string
  return {
    stations: await res.json(),
  };
});

exports.getWeatherData = functions.https.onCall(async(data, context) => {
  // site code: https://dd.weather.gc.ca/citypage_weather/docs/siteList.xml
  const site = data.site;
  // get
  let res = await fetch(
    `${weatherServer}/citypage_weather/xml/ON/${site}_e.xml`, {
      method: "GET",
    }
  );
  // return data as a string
  return {
    weather: await res.text(),
  };
});