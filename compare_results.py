import os
import pandas as pd

def compare_csv_files(file1, file2):
    # Чтение CSV файлов в DataFrame
    df1 = pd.read_csv(file1)
    df2 = pd.read_csv(file2)
    
    # Проверка, что DataFrame имеют одинаковую форму
    if df1.shape != df2.shape:
        raise ValueError(f"Файлы {file1} и {file2} имеют разные формы")

    # Вычисление разности значений
    df_diff = df1 - df2
    
    return df_diff

def main():
    # Задание путей к папкам
    dir1 = 'results_for_compare'
    dir2 = 'results'
    output_dir = 'comparison_results'
    report_file = os.path.join(output_dir, 'comparison_report.txt')
    
    # Создание папки для сохранения результатов, если она не существует
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    # Список файлов для сравнения
    filenames = [
        "MAEHAR0.1seed42pretrain-False.csv",
        "MAEHAR0.1seed42pretrain-True.csv",
        "SimCLRHAR0.1seed42pretrain-False.csv",
        "SimCLRHAR0.1seed42pretrain-True.csv"
    ]
    
    # Открытие файла для записи отчета
    with open(report_file, 'w') as report:
        # Проход по каждому файлу и выполнение сравнения
        for filename in filenames:
            file1 = os.path.join(dir1, filename)
            file2 = os.path.join(dir2, filename)
            output_file = os.path.join(output_dir, f"diff_{filename}")
            
            try:
                df_diff = compare_csv_files(file1, file2)
                df_diff.to_csv(output_file, index=False)
                print(f"Сравнение для {filename} выполнено успешно. Результат сохранен в {output_file}.")
                
                # Запись результатов сравнения в отчетный файл
                report.write(f"Результаты сравнения для {filename}:\n")
                report.write(df_diff.to_string())
                report.write("\n\n")
                
                # Вывод результатов сравнения в консоль
                print(f"Результаты сравнения для {filename}:\n{df_diff}\n")
            except Exception as e:
                error_message = f"Ошибка при сравнении файлов {file1} и {file2}: {e}"
                print(error_message)
                report.write(error_message + "\n\n")

if __name__ == "__main__":
    main()
