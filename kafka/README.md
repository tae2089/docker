<h1>도커 컴포즈를 통해 카프카 클러스터 실행해보기</h1>
<pre>
<code> docker-compose up
</code>
</pre>
파일을 다운받고 위 명령어를 통해 도커 컴포즈를 실행해준다.

<pre><code>docker exec -it [컨테이너명] sh -c ". /root/start.sh"
docker exec -it broker1 sh -c ". /root/start.sh" </code></pre>
위 명령어는 주키퍼와 카프카를 실행하는 명령어다. 컨테이너 마다 하나씩 명령어를 입력해준다.

<h2>노드를 늘리고 싶을 경우</h2>
- 도커 컴포즈 파일에서 해당 변수들을 수정 및 추가를 진행해주면 된다.
<pre><code>
<서비스명>:
  image: tae2089/kafka:1.7
  container_name: <서비스명>
  hostname: <서비스명>
  environment:
    - MYID=<식별가능한 고유 ID>
    - ZOO_SERVERS=server.1=broker1:2888:3888 server.2=broker2:2888:3888
    server.x=<서비스명:2888:3888>
    - BROKER=<호스트IP 입력>
    - PORT=<카프카 포트 번호>
    - KAFKA_LISTENER=PLAINTEXT://0.0.0.0:<카프카 포트 번호>
    - KAFKA_ADVERTISED_LISTENER=PLAINTEXT://<호스트IP>:<카프카 포트 번호>
    - ZOO_CONNECT=broker1:2181,broker2:2182,<서비스명:추가된 주키퍼 외부
     포트 번호>
  tty: true
  ports:
    - "<주키퍼에 접속하기를 원하는 포트 입력>:2181"
    - "<카프카 포트 번호>:<카프카 포트 번호>"
 </code></pre>
<br>
- 예제
<pre><code>
broker3:
  image: tae2089/kafka:1.7
  container_name: broker3
  hostname: broker3
  environment:
    - MYID=3
    - ZOO_SERVERS=server.1=broker1:2888:3888 server.2=broker2:2888:3888 server.3=broker3:2888:3888
    - KAFKA_LISTENER=PLAINTEXT://0.0.0.0:9094
    - KAFKA_ADVERTISED_LISTENER=PLAINTEXT://${HOSTIP}:9094
    - PORT=9094
    - BROKER=${hostIP}
    - ZOO_CONNECT=broker1:2181,broker2:2182,broker3:2183
  tty: true
  ports:
    - "2183:2181"
    - "9094:9094"
 </code></pre>

 - 주의사항
   1. 해당코드는 공부용도입니다. 주키퍼 서버와 카프카 서버를 하나의 컨테이너에 운영하도록 만들어 두었습니다. 현업에서는 주키퍼와 카프카를 분리해서 돌리기에 스터디 용도로만 사용하시길 바랍니다.
   2. hostIP를 확인해서 잘 넣어야 합니다. 127.0.0.1로 하면 리스너가 인식을 하지 못해 에러가 발생합니다.
   3. 포트 번호들은 다른 컨테이너 포트와 겹치지 않게 하는 것이 좋습니다.
