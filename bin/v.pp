#!/bin/sh
#perl -0007 -MJSON -ne'print to_json(from_json($_, {allow_nonref=>1}),{pretty=>1})."\n"'
python -c "import sys, json; data = sys.stdin.read(); print json.dumps(json.loads(data), sort_keys=True, indent=4, separators=(',', ': '))"
