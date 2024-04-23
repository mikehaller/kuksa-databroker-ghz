#/bin/sh

FILES="testcase*.json"
for f in $FILES
do
  echo "Processing $f file..."
  # take action on each file. $f store current file name
  ghz --config=$f $@ > "$f.output"

  uname -a >> "$f.output"
  cat /proc/cpuinfo >> "$f.output"
done