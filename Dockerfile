FROM ubuntu:14.04
RUN apt-get update
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:webupd8team/java -y
RUN apt-get update
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN apt-get install oracle-java8-installer -y
RUN apt-get install oracle-java8-set-default
RUN apt-get install unzip
RUN wget http://downloads.typesafe.com/typesafe-activator/1.3.6/typesafe-activator-1.3.6.zip 
RUN unzip typesafe-activator-1.3.6.zip -d / && rm typesafe-activator-1.3.6.zip && chmod a+x ./activator-dist-1.3.6/activator
ENV PATH $PATH:/activator-dist-1.3.6

EXPOSE 9000 8888
RUN mkdir /app
WORKDIR /app

CMD ["activator", "run"]
