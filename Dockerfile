# Используем официальный образ Python
FROM python:3.9-slim

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем файл parrot.py в контейнер
COPY parrot.py .

# Устанавливаем зависимости, если они есть (например, если у тебя есть requirements.txt)
# RUN pip install -r requirements.txt

# Запускаем скрипт parrot.py
CMD ["python3", "parrot.py"]
