FROM python:3

COPY requirement.txt ./

RUN pip install -r requirements.txt

COPY . .
CMD ["python", "/src/main.py"]