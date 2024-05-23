#!/bin/bash

# Вызов скрипта, который запускает все комбинации
/app/run_all.sh

# Запуск скрипта для сравнения результатов
python3 compare_results.py

cat /app/comparison_results/comparison_report.txt
