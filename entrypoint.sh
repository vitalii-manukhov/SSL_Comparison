#!/bin/bash

# Изменение конфигурационного файла в зависимости от переменной окружения
if [ "$PRETRAIN" = "true" ]
then
    sed -i 's/# pretrain: False/pretrain: True/g' config/HAR_config_MAE.yaml
else
    sed -i 's/pretrain: True/# pretrain: False/g' config/HAR_config_MAE.yaml
fi

# Запуск выбранного Python скрипта
python3 $SCRIPT_NAME
