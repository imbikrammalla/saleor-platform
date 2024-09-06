REPO="gcr.io/moonlit-sphinx-433913-h6"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

OUTPUT_FILE="scan_results/trivy_scan_results_$TIMESTAMP.txt"

IMAGES=$(gcloud container images list --repository=$REPO --format='value(NAME)')

for IMAGE in $IMAGES; do
    echo "Scanning $IMAGE..." | tee -a $OUTPUT_FILE
    trivy  $IMAGE | tee -a $OUTPUT_FILE
    echo "-------------------------------------" | tee -a $OUTPUT_FILE
done

echo "Trivy results has been saved to $OUTPUT_FILE"