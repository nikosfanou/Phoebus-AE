CURRENT_PATH=$(pwd)
ARTIFACT_PATH="../../artifact"
USE_CASES_PATH="use-cases"
CONFIG="claim2-config.json"
EXAMPLES="claim2-examples"

cp $CONFIG "$ARTIFACT_PATH/"
cp -r $EXAMPLES "$ARTIFACT_PATH/$USE_CASES_PATH/"
cd $ARTIFACT_PATH
python3 testGenerator.py --config $CONFIG
rm $CONFIG
mv "$USE_CASES_PATH/$EXAMPLES/tests/"* "$CURRENT_PATH/$EXAMPLES/tests/"
rm -rf "$USE_CASES_PATH/$EXAMPLES"