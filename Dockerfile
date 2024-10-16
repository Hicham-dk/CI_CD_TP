# Use the official Ubuntu as a base image
FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages (Java, Ant, Ivy, and other utilities)
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    ant \
    wget \
    unzip \
    ivy \
    && apt-get clean

# Set JAVA_HOME for Java 17
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

# Install Apache Ivy manually (if not already in the package manager)
#RUN wget https://downloads.apache.org/ant/ivy/2.5.2/apache-ivy-2.5.2-bin-with-deps.zip && \
#    unzip apache-ivy-2.5.2-bin-with-deps.zip && \
 #   mv apache-ivy-2.5.2 /opt/ivy && \
  #  ln -s /opt/ivy/ivy-2.5.2.jar /usr/share/ant/lib/ivy.jar && \
   # rm apache-ivy-2.5.2-bin-with-deps.zip

# Create working directory
WORKDIR /app

# Copy the source code, build.xml, and ivy.xml to the container
COPY ..

# Ensure the Ivy configuration is available
RUN mkdir -p /root/.ivy2 && cp ivy.xml /root/.ivy2/ivy.xml

# Retrieve dependencies via Ivy
R
RUN ant retrieve
RUN ant compile
RUN ant compile-test 
RUN ant javadoc
RUN ant dist
#mv dist/Tetris.jar dist/Tetris-$(date +'%Y%m%d').jar


