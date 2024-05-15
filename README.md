# Self-Supervised Learning for Time Series: Contrastive or Generative?

#### Authors: Ziyu Liu (ziyu.liu2@student.rmit.edu.au), Azadeh Alavi, Minyi Li, Xiang Zhang  
### [Paper Link](https://github.com/AI4TS/AI4TS.github.io/blob/main/CameraReadys%201-22%202/5%5CCameraReady%5CIJCAI23_TSworkshop_Jun29.pdf)

### Инструкция по запуску

1. Скачайте данные по ссылке: https://figshare.com/ndownloader/articles/19930244/versions/1 и перенесите их по пути Datasets/HAR/

2. Сборка контейнера sudo docker build -t ssl_comparison .

3. Выполните предобучение моделей

sudo docker run -e PRETRAIN="" -e SCRIPT_NAME=Contrastive/SimCLR/SimCLR_pretrain.py ssl_comparison

sudo docker run -e PRETRAIN="" -e SCRIPT_NAME=Generative/MAE/MAE_pretrain.py ssl_comparison

4. Выполните дообучение моделей

sudo docker run -e PRETRAIN=true -e SCRIPT_NAME=Contrastive/SimCLR/SimCLR_finetune_test.py ssl_comparison

sudo docker run -e PRETRAIN=false -e SCRIPT_NAME=Contrastive/SimCLR/SimCLR_finetune_test.py ssl_comparison

sudo docker run -e PRETRAIN=true -e SCRIPT_NAME=Generative/MAE/MAE_finetune_test.py ssl_comparison

sudo docker run -e PRETRAIN=false -e SCRIPT_NAME=Generative/MAE/MAE_finetune_test.py ssl_comparison