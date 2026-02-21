# Pake image NVIDIA yang udah ada CUDA + Python
FROM nvidia/cuda:12.1.1-cudnn8-runtime-ubuntu22.04

# Install Python dan pip
RUN apt-get update && apt-get install -y python3-pip python3-dev

# Install JupyterLab dan library AI dasar
RUN pip3 install --no-cache-dir jupyterlab torch torchvision torchaudio

# Set folder kerja
WORKDIR /workspace

# Expose port Jupyter (default 8888)
EXPOSE 8888

# Perintah buat jalanin Jupyter tanpa token (biar gampang, tapi nanti set password di Northflank ya!)
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
