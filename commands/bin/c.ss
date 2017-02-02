#!/bin/bash

#start node server for development

forever start  -o ~/.forever/gitly_out.log -e ~/.forever/gitly_err.log -w --watchDirectory /Users/eggcaker/src/biz/gitly/api  /Users/eggcaker/src/biz/gitly/api/app.js


forever start  -o ~/.forever/mandian_out.log -e ~/.forever/mandian_err.log -w  --watchDirectory /Users/eggcaker/src/work/mandian_server/server  /Users/eggcaker/src/work/mandian_server/server/app.js

