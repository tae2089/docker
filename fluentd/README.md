# <b>fluentd사용기</b>
## 1. test.conf파일을 설정한다.
    - 자신이 원하는 설정으로 변경을 해주고 저장을 해준다.
## 2. docker compose를 실행해준다.
```
docker-compose up
```
## 3. fluentd와 연결을 원하는 컨테이너를 실행한다.
```
docker run -it --log-driver=fluentd --log-opt fluentd-address=<hostIp>:24224 ubuntu /bin/bash
```
