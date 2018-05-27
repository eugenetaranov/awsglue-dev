FROM	centos:7
RUN	yum install -y java-1.8.0-openjdk-devel vim unzip
RUN	curl -LO http://ftp.itu.edu.tr/Mirror/Apache/spark/spark-2.2.1/spark-2.2.1-bin-hadoop2.7.tgz && \
	tar xf spark-2.2.1-bin-hadoop2.7.tgz -C /opt && \
	rm -f spark-2.2.1-bin-hadoop2.7.tgz
RUN	curl -LO https://s3.amazonaws.com/aws-glue-jes-prod-us-east-1-assets/etl/python/PyGlue.zip
RUN	curl -L https://s3.eu-central-1.amazonaws.com/eugene.taranov.me/awsglue/glue-assembly.jar -o /opt/spark-2.2.1-bin-hadoop2.7/jars/glue-assembly.jar
ADD	libs/sqljdbc42.jar /opt/spark-2.2.1-bin-hadoop2.7/jars
ADD	pythonrc /root/.pythonrc
RUN	chmod 755 /root/.pythonrc
ENV	PYTHONSTARTUP=/root/.pythonrc
CMD	/opt/spark-2.2.1-bin-hadoop2.7/bin/pyspark --py-files /PyGlue.zip
