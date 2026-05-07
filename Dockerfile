FROM python:3.11-slim

WORKDIR /app

# Install dependencies
RUN pip install pandas scikit-learn joblib fastapi uvicorn

# Copy all files
COPY . .

# Train the model (generates model.pkl and metrics.json)
RUN python train.py

# Expose port 8000
EXPOSE 8000

# Run FastAPI app
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
