htop:
  pkg:
    - installed

nano:
  pkg:
    - installed

ncdu:
  pkg:
    - installed

rsync:
  pkg:
    - installed

/etc:
  cmd.run:
    - name : 'rsync -rltgov /vagrant/Shares/etc/ /etc' 
    - user : root
