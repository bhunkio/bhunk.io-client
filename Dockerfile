FROM pytorch/pytorch:1.12.1-cuda11.3-cudnn8-runtime
RUN apt-get update
RUN apt-get install python3.8 git -y

WORKDIR /app
RUN git clone  https://github.com/bfirsh/stable-diffusion.git
WORKDIR /app/stable-diffusion
RUN git checkout 69ae4b35e0a0f6ee1af8bb9a5d0016ccb27e36dc

SHELL ["/bin/bash", "-c"]
RUN conda env create -f environment.yaml
RUN conda init bash
RUN apt-get install libglib2.0-0 libsm6 libxrender1 -y
COPY weights/sd-v1-4.ckpt /app/stable-diffusion/models/ldm/stable-diffusion-v1/model.ckpt
COPY bhunkio.py /app/stable-diffusion/bhunkio.py