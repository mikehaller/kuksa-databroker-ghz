#/bin/sh

FILES="testcase*.json"
for f in $FILES
do
  echo "Processing $f file..."
  # take action on each file. $f store current file name
  ./ghz --config=$f --import-paths=kuksa-databroker/proto/ $@
done