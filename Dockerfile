FROM python:3.12-slim

RUN apt-get update && apt-get install -y build-essential

WORKDIR /usr/src/app
COPY . .
RUN pip install --no-cache-dir -r requirements.txt
RUN python -m playwright install firefox
RUN python -m playwright install-deps
EXPOSE 3000

# Create a shell script to run multiple commands
RUN echo -e '#!/bin/sh\nldd --version\npython main.py' > start.sh
RUN chmod +x start.sh

CMD ["./start.sh"]
