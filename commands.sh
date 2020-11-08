# Create and import virtual env
python3 -m venv ~/.azure-devops-proj
source ~/.azure-devops-proj/bin/activate

# Install, lint and test
make all

# Deploy using Azure Upservice
az webapp up -n azure-devops-proj --sku F1

# Make prediction
./make_predict_azure_app.sh

# Check logs
az webapp log tail