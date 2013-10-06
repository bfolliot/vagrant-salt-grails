java7_ppa:
  pkgrepo.managed:
    - ppa: webupd8team/java
    - require_in:
      - pkg: jdk7
accept-license:
  cmd.run:
    - name: echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
    - unless: debconf-get-selections | grep -q shared/accepted-oracle-license-v1-1
    - user: root
jdk7:
  pkg.installed:
    - name: oracle-java7-installer
    - requires:
      - cmd: jdk7-accept-license
      - pkgrepo: java7_ppa