set -e

filename=./src/cpp/main
input=tools/in/0000.txt
output=/dev/null

echo "now compiling..."
/usr/bin/g++-10 -pg -g -fdiagnostics-color=always $filename.cpp -o $filename -std=c++17 -Wall -Wextra -O3

echo "now running..."
# tools/target/release/tester $filename < $input > $output
$filename < $input > $output
gprof $filename gmon.out > gprof.profile
rm gmon.out
