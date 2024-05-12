FROM python:3.12-slim

RUN apt-get update && apt-get install -y build-essential

CMD ldd --version

WORKDIR /usr/src/app
COPY . .
RUN pip install --no-cache-dir -r requirements.txt
RUN python -m playwright install firefox
RUN python -m playwright install-deps
EXPOSE 3000
CMD ["python", "main.py"]
