FROM python:3

COPY requirement.txt ./

RUN pip install -r requirement.txt

COPY . .
CMD ["python", "/src/main.py"]