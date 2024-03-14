FROM node:20.11.1

WORKDIR /usr/src/app

# Install system dependencies.
RUN apt-get update                                  &&  \
    apt-get install -y --no-install-recommends          \
      pip                                               \
      sudo

# Install Python dependencies.
COPY requirements.txt .
RUN pip install --break-system-packages --upgrade pip setuptools wheel      &&  \
    pip install --break-system-packages --no-cache-dir -r requirements.txt  &&  \
    rm -rf /root/.cache/pip

# Copy application files.
COPY src .

# Create a user to run the app.
RUN adduser --system app

# Install Node Exporter.
COPY node_exporter/get-node_exporter.sh .
RUN ./get-node_exporter.sh
RUN tar -xvzf node_exporter-*.*-*.tar.gz

# Create a user to run Node Exporter.
RUN adduser --system node_exporter

# Copy the helper scripts.
COPY node_exporter/run-node_exporter.sh .
COPY start.sh .

RUN mkdir -p /mnt/web
