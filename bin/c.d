#!/usr/bin/env node 

var moment = require('moment');

var time_stamp = process.argv[2];

if (time_stamp) {
  if(time_stamp > 6489546000) {
    time_stamp /= 1000;
  }

  console.log(moment.unix(time_stamp).toString());
} else {
    console.log(moment().unix());
}

