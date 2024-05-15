#!/bin/bash

# Выбор конфигурационного файла в зависимости от запускаемого Python скрипта
if [ "$SCRIPT_NAME" = "Contrastive/SimCLR/SimCLR_finetune_test.py" ]
then
    CONFIG_FILE="Contrastive/SimCLR/config/HAR_config.yaml"
elif [ "$SCRIPT_NAME" = "Generative/MAE/MAE_finetune_test.py" ]
then
    CONFIG_FILE="Generative/MAE/config/HAR_config_MAE.yaml"
elif [ "$SCRIPT_NAME" = "Contrastive/SimCLR/SimCLR_pretrain.py" ] || [ "$SCRIPT_NAME" = "Generative/MAE/MAE_pretrain.py" ]
then
    CONFIG_FILE=""
else
    echo "Неизвестное имя скрипта: $SCRIPT_NAME"
    exit 1
fi

# Изменение конфигурационного файла в зависимости от переменной окружения, если файл конфигурации указан
if [ -n "$CONFIG_FILE" ]
then
    if [ "$PRETRAIN" = "true" ]
    then
        sed -i 's/# pretrain: False/pretrain: True/g' $CONFIG_FILE
    else
        sed -i 's/pretrain: True/# pretrain: False/g' $CONFIG_FILE
    fi
fi

# Запуск выбранного Python скрипта
python3 $SCRIPT_NAME