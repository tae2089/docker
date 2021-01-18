<h1>도커 컴포즈를 활용한 하둡 클러스터</h1>
 
 -  코드 다운 및 파일 이동š
    <pre><code> git clonehttps://github.com/tae2089/docker.git <br> cd hadoop
  </code></pre>
- 실행 방법
  <pre><code> docker-compose up -d
  </code></pre>
- 종료 방법
  <pre><code># 파일 삭제를 원할 경우
  docker-compose down 
  # 파일 정지를 원할 경우
  docker-compose stop 
  </code></pre>
- 재실행 방법
    <pre><code> docker-compose start
  </code></pre>

- 주의사항
  1. 해당코드는 공부용도입니다. ssh를 강제로 열어서 진행하는 부분이 있어 보안에 취악할 거라 생각합니다. 스터디 용도로만 사용하시길 바랍니다.