FROM ubuntu:22.04 as base

RUN apt update
RUN apt install python3 python3-pip -y

WORKDIR /app

COPY . /app

RUN pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
RUN pip install -r requirements.txt

CMD ["python", "Contrastive/SimCLR/SimCLR_finetune_test.py"]