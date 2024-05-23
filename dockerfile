FROM ubuntu:22.04 as base

RUN apt update
RUN apt install python3 python3-pip -y 

WORKDIR /app

COPY . /app

RUN pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
RUN pip3 install -r requirements.txt
RUN chmod +x entrypoint.sh
RUN chmod +x run_all.sh

ENTRYPOINT ["/app/entrypoint.sh"]

CMD ["echo", ""]