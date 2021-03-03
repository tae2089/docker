From tae2089/python:latest
WORKDIR ~
RUN apt-get install -y mysql-server libmysqlclient-dev
RUN pip3 install mysqlclient
RUN pip3 install apache-airflow
RUN airflow db init
