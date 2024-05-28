FROM python:3.9-slim

WORKDIR /app

EXPOSE 5080

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python3", "-m" ,"uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "5080",  "--backlog", "8", "--timeout-keep-alive", "300", "--no-server-header", "--header", "server:TTServer", "--reload"]