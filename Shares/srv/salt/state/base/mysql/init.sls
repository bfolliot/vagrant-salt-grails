mysql:
  pkg:
    - installed
    - names:
      - mysql-server
      - mysql-client
      - libmysql-java
  service:
    - running