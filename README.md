# Self-Supervised Learning for Time Series: Contrastive or Generative?

#### Authors: Ziyu Liu (ziyu.liu2@student.rmit.edu.au), Azadeh Alavi, Minyi Li, Xiang Zhang  
### [Paper Link](https://github.com/AI4TS/AI4TS.github.io/blob/main/CameraReadys%201-22%202/5%5CCameraReady%5CIJCAI23_TSworkshop_Jun29.pdf)

Self-Supervised Learning (SSL) - подход к изучению представлений на основе больших немаркированных данных. Рассматривается применение SSL для решения задачи классификации активности людей. Данные представлены временными рядами.

Self-Supervised Learning можно разделить на два основных направления: контрастивное и генеративное. В данной работе проводится сравнение методов SSL разных направлений для временных рядов. Контрастивное обучение представлено моделью SimCLR, а генеративное MAE.

Для каждого метода параметр "Pretrained" означает, что мы использовали обученный кодер
для SimCLR или MAE. Иначе веса кодера инициализируются случайно. Столбец "Ratio" в таблице результатов означает соотношение меток, т. е. долю меток, используемых на этапе тонкой настройки.

Мы оцениваем модели на базе данных HAR (Human Activity Recognition Using Smartphones).

### Инструкция по запуску

1. Установите git и docker

2. Склонируйте репозиторий

3. Скачайте данные по ссылке: https://figshare.com/ndownloader/articles/19930244/versions/1 и перенесите их по пути Datasets/HAR/

4. Выполните сборка контейнера:
- docker build -t ssl_comparison .

5. Выполните дообучение моделей (finetuning) для предтренированных моделей и нет
- docker run ssl_comparison

Результатом запуска контейнера станет вывод в консоль текстового документа с таблицами с разностью между эталонными значениями метрик качества и вашими.