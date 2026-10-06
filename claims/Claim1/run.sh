CURRENT_PATH=$(pwd)
ARTIFACT_PATH="../../artifact/"
CONFIG="claim1-config.json"
OUTPUT_FILE="claim1-output.json"

cp $CONFIG $ARTIFACT_PATH
cd $ARTIFACT_PATH
python3 generator.py --config $CONFIG --json $OUTPUT_FILE
rm $CONFIG
mv $OUTPUT_FILE $CURRENT_PATH
