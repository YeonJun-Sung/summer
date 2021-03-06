# 2019 Summer Coding


# AWS 환경  
ubuntu 16.04  
mysql 5.7  
tomcat8  

# apt-get update  
``` Ubuntu 
sudo passwd
su  
apt-get update  
```  
  
# java 설치  
``` Ubuntu 
apt-get install openjdk-8-jre  
apt-get install openjdk-8-jdk  
java -version  
javac -version  
which javac
```  
결과 /usr/bin/javac로 아래에서 사용  
``` Ubuntu 
readlink -f /usr/bin/javac  
```  

``` Ubuntu  
vi /etc/profile  
``` 
최하단에 추가  
``` Ubuntu
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64  
export PATH=$JAVA_HOME/bin:$PATH  
export CLASS_PATH=$JAVA_HOME/lib:$CLASS_PATH  
``` 

``` Ubuntu
source /etc/profile  
``` 
  
환경변수 설정 확인  
``` Ubuntu
echo $JAVA_HOME  
$JAVA_HOME/bin/javac -version  
``` 
  
# tomcat8 설치  
``` Ubuntu
apt-get install tomcat8  
service tomcat8 start  
``` 
  
# mysql 설치  
설치 가능 버전 확인 / 설치  
``` Ubuntu
sudo apt-cache search mysql-server  
sudo apt-get install mysql-server-5.7  
```  
  
설정 수정  
``` Ubuntu
vi /etc/mysql/conf.d/mysql.cnf  
[mysqld]  
datadir=/var/lib/mysql  
socket=/var/lib/mysql/mysql.sock  
user=mysql  
character-set-server=utf8  
collation-server=utf8_general_ci  
init_connect = set collation_connection = utf8_general_ci  
init_connect = set names utf8  

[mysql]  
default-character-set=utf8  

[mysqld_safe]  
log-error=/var/log/mysqld.log  
pid-file=/var/run/mysqld/mysqld.pid  
default-character-set=utf8  

[client]   
default-character-set=utf8  

[mysqldump]  
default-character-set=utf8  
``` 
입력  
  
재시작  
``` Ubuntu
/etc/init.d/mysql restart  
```   
외부 접속 허용  
``` Ubuntu
mysql -uroot -p  
``` 
``` MySQL
create database summer_coding;  
create user 'xxung'@localhost identified by '0731';  
GRANT ALL PRIVILEGES ON summer_coding.* TO 'xxung'@localhost IDENTIFIED BY '0731';  
flush privileges;  
exit
```
  
포트번호 허용  
``` Ubuntu
ufw allow 3306/tcp 
```    
bind-address 주석처리  
``` Ubuntu
vi /etc/mysql/mysql.conf.d/mysqld.cnf  
```    
  
재시작  
``` Ubuntu
/etc/init.d/mysql restart  
```
 
# 프로젝트 업로드  
폴더 권한 설정  
``` Ubuntu
chmod -R 777 /var/lib/tomcat8/webapps  
chown -R tomcat8:tomcat8 /var/lib/tomcat8/webapps  
``` 
이클립스에서 git으로 연동한 후 프로젝트를 *.war로 export시켜  
우분투의 /var/lib/tomcat8/webapps/ 로 이동  
  
  
# 데이터베이스 생성  
``` Ubuntu
mysql -uroot -p  
```   
  
summer_coding database   
``` MySQL
use summer_coding;  
``` 
  
list_contents table 생성  
``` MySQL
CREATE TABLE `list_contents` (
	`list_key` VARCHAR(50) NOT NULL COLLATE 'utf8_unicode_ci',
	`list_subject` VARCHAR(50) NOT NULL COLLATE 'utf8_unicode_ci',
	`list_content` TEXT NOT NULL COLLATE 'utf8_unicode_ci',
	`seq` INT(11) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`list_key`),
	INDEX `seq` (`seq`)
)
COMMENT='contain TODO list title and contents'
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB
ROW_FORMAT=DYNAMIC
AUTO_INCREMENT=144
;
``` 

list_priority table 생성  
``` MySQL
CREATE TABLE `list_priority` (
	`list_key` VARCHAR(50) NOT NULL COLLATE 'utf8_unicode_ci',
	`list_pri` INT(11) NULL DEFAULT NULL,
	UNIQUE INDEX `list_key` (`list_key`),
	CONSTRAINT `FK_list_priority_list_contents` FOREIGN KEY (`list_key`) REFERENCES `list_contents` (`list_key`)
)
COMMENT='contain TODO list priority'
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB
ROW_FORMAT=DYNAMIC
;
``` 

list_status table 생성  
``` MySQL
CREATE TABLE `list_status` (
	`list_key` VARCHAR(50) NOT NULL COLLATE 'utf8_unicode_ci',
	`list_date` DATE NULL DEFAULT NULL,
	`list_stat` VARCHAR(50) NULL DEFAULT NULL COMMENT '-1-알람완료 / 0-기간만료 / 1-우선순위 O / 2-우선순위 X / 3-완료 ' COLLATE 'utf8_unicode_ci',
	UNIQUE INDEX `list_key` (`list_key`),
	CONSTRAINT `FK_list_status_list_contents` FOREIGN KEY (`list_key`) REFERENCES `list_contents` (`list_key`)
)
COMMENT='contain TODO list deadline and status'
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB
ROW_FORMAT=DYNAMIC
;
 ```
