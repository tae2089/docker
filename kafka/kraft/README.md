<h1>도커 컴포즈를 통해 카프카 클러스터 실행해보기</h1>
<pre>
<code> random
</code>
</pre>
파일을 다운받고 위 명령어를 통해 나온 UUID를 복사해서 docker-compose.yml에 있는 UUID_VALUE 모든 곳에 동일하게 입력해준다.

<pre>
<code> docker-compose up
</code>
</pre>

그 다음 위 명령어를 통해 도커 컴포즈를 실행해준다.

<pre>
<code>docker exec -it [컨테이너명] sh -c ". start.sh"
docker exec -it broker1 sh -c ". start.sh" 
</code>
</pre>

위 명령어를 통해 카프카 클러스터를 초기화해준다. 컨테이너 마다 하나씩 명령어를 입력해준다.

다음명령어는 카프카 실행 명령어이다.

<pre><code>docker exec -it [컨테이너명] sh -c "kafka-server-start.sh kafka/config/kraft/server.properties"
docker exec -it broker1 sh -c "kafka-server-start.sh kafka/config/kraft/server.properties" </code></pre>

<h2>노드를 늘리고 싶을 경우</h2>
- 도커 컴포즈 파일에서 해당 변수들을 수정 및 추가를 진행해주면 된다.
<pre><code>
<서비스명>:
  image: tae2089/kafka:3.0.3
  container_name: <서비스명>
  hostname: <서비스명>
  environment:
    - KAFKA_LISTENER=PLAINTEXT://0.0.0.0:<KAFKA_PORT INSERT>
    - NODE_ID=<KAFKA_UNIQUE_ID INSERT >
    - KAFKA_ADVERTISED_LISTENER=PLAINTEXT://main:<KAFKA_PORT INSERT>
    - CONTROLLER_QUORUM_VOTERS=<NODE_ID@main:CONTROLLER_PORT INSERT>
    - BROKER_PORT=<KAFKA_PORT INSERT>
    - UUID_VALUE=<RANDOM_UUID>
    - CONTOLLER_PORT=<CONTROLLER_PORT INSERT>
    - BROKER_IP=<HOST_PRIVATE_IP4 INSERT>
    - PORT=<KAFKA_PORT INSERT>
  tty: true
  ports:
    - "<KAFKA_PORT>:<KAFKA_PORT>"
    - "<CONTROLLER_PORT>:<CONTROLLER_PORT>"
 </code></pre>
<br>
- 예제
<pre><code>
  broker3:
    image: tae2089/kafka:3.0.2
    container_name: broker3
    hostname: broker3
    environment:
      - KAFKA_LISTENER=PLAINTEXT://0.0.0.0:9094
      - NODE_ID=3
      - KAFKA_ADVERTISED_LISTENER=PLAINTEXT://main:9094
      - CONTROLLER_QUORUM_VOTERS=1@main:19092,2@main:19094
      - BROKER_PORT=9094
      - UUID_VALUE=2g81oberCDGcDdKAbcldl2
      - CONTOLLER_PORT=19094
      - BROKER_IP=172.0.0.5
    tty: true
    ports:
      - "9094:9094"
      - "19094:19094"
    extra_hosts:
        - "main:172.0.0.5"
 </code></pre>

- 주의사항
  1.  hostIP를 확인해서 잘 넣어야 합니다. 127.0.0.1로 하면 리스너가 인식을 하지 못해 에러가 발생합니다.
  2.  포트 번호들은 다른 컨테이너 포트와 겹치지 않게 하는 것이 좋습니다.
