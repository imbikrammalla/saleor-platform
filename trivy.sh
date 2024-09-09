TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Define the output file name
OUTPUT_FILE="trivy_files/trivy_results_$TIMESTAMP.txt"

# Create the output directory if it doesn't exist
mkdir -p trivy_files

# Define the list of images to scan
IMAGES=("ghcr.io/saleor/saleor:latest" "ghcr.io/saleor/saleor-dashboard:latest" "jaegertracing/all-in-one" "postgres:15-alpine" "redis:7.0-alpine")

# Loop through each image and scan it using Trivy, saving output to the file
for IMAGE in "${IMAGES[@]}"; do
    echo "Scanning $IMAGE..." | tee -a $OUTPUT_FILE
    trivy image "$IMAGE" | tee -a $OUTPUT_FILE
    echo "-------------------------------------" | tee -a $OUTPUT_FILE
done

echo "Scan results saved to $OUTPUT_FILE"