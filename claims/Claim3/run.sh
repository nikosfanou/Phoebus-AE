RUN_SCRIPT="./scripts/run.sh"
ARTIFACT_PATH="../../artifact"
CONFIG_PATH="configs/example-csp-img-src.json"

cd $ARTIFACT_PATH
$RUN_SCRIPT --config $CONFIG_PATH
