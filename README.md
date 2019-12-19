# awsglue-dev

Development environment with Apache Spark and AWS Glue libraries

Includes:
- JDK8
- Apache Spark 2.2.1
- AWS Glue python and java libraries
- MySQL JDBC driver 8.0.11
- MSSQL JDBC driver 4.2
- AWS SDK 1.7.4
- Jupyter 4.4.0

## Build
`$ docker build --squash -t awsglue .`

## Pull

`docker pull eugenetaranov/awsglue-dev` - jupyter

## Run

#### Pyspark:

```
$ docker run --rm -it eugenetaranov/awsglue-dev pyspark
Python 2.7.5 (default, Aug  4 2017, 00:39:18)
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)] on linux2
Type "help", "copyright", "credits" or "license" for more information.
SLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/opt/spark-2.2.1-bin-hadoop2.7/jars/slf4j-log4j12-1.7.16.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/opt/spark-2.2.1-bin-hadoop2.7/jars/glue-assembly.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
SLF4J: Actual binding is of type [org.slf4j.impl.Log4jLoggerFactory]
Using Spark's default log4j profile: org/apache/spark/log4j-defaults.properties
Setting default log level to "WARN".
To adjust logging level use sc.setLogLevel(newLevel). For SparkR, use setLogLevel(newLevel).
18/05/27 22:07:31 WARN NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
18/05/27 22:07:37 WARN ObjectStore: Version information not found in metastore. hive.metastore.schema.verification is not enabled so recording the schema version 1.2.0
18/05/27 22:07:38 WARN ObjectStore: Failed to get database default, returning NoSuchObjectException
18/05/27 22:07:38 WARN ObjectStore: Failed to get database global_temp, returning NoSuchObjectException
Welcome to
      ____              __
     / __/__  ___ _____/ /__
    _\ \/ _ \/ _ `/ __/  '_/
   /__ / .__/\_,_/_/ /_/\_\   version 2.2.1
      /_/

Using Python version 2.7.5 (default, Aug  4 2017 00:39:18)
SparkSession available as 'spark'.
>>> url = 'jdbc:sqlserver://DBHOST:1433;databaseName=DBNAME;user=DBUSER;password=DBPASSWORD'
>>> mssql_df = spark.read.format('jdbc').options(url=url, dbtable='TABLENAME').load()
>>> mssql_df.count()
```

#### Jupyter:

```
docker run -ti --rm -v $PWD:/mnt -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -p 8888:8888 eugenetaranov/awsglue-dev jupyter
[I 09:28:28.060 NotebookApp] Writing notebook server cookie secret to /home/spark/.local/share/jupyter/runtime/notebook_cookie_secret
[W 09:28:28.242 NotebookApp] WARNING: The notebook server is listening on all IP addresses and not using encryption. This is not recommended.
[I 09:28:28.267 NotebookApp] [jupyter_nbextensions_configurator] enabled 0.4.0
[I 09:28:28.268 NotebookApp] Serving notebooks from local directory: /home/spark
[I 09:28:28.268 NotebookApp] 0 active kernels
[I 09:28:28.268 NotebookApp] The Jupyter Notebook is running at:
[I 09:28:28.269 NotebookApp] http://a616d61b189e:8888/?token=0199c11f58db2581b6901b51e5d3d74bd2b257b8b407f165
[I 09:28:28.269 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[W 09:28:28.270 NotebookApp] No web browser found: could not locate runnable browser.
[C 09:28:28.270 NotebookApp]

    Copy/paste this URL into your browser when you connect for the first time,
    to login with a token:
        http://a616d61b189e:8888/?token=0199c11f58db2581b6901b51e5d3d74bd2b257b8b407f165&token=0199c11f58db2581b6901b51e5d3d74bd2b257b8b407f165
```
