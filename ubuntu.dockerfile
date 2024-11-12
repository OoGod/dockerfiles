FROM ubuntu:20.04

# 设置环境变量以避免交互式提示
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y curl jq git vim && \
    apt-get install -y python3 python3-pip && \
    apt-get install -y openjdk-11-jdk maven && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 设置 JAVA_HOME 环境变量
#ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

# 动态查找 JAVA_HOME
RUN export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))) ) && \
    echo "JAVA_HOME is set to $JAVA_HOME" && \
    echo "export JAVA_HOME=$JAVA_HOME" >> /etc/profile.d/java.sh

ENV PATH="$JAVA_HOME/bin:$PATH"

# 验证安装
RUN java -version && mvn -version

# 设置工作目录
WORKDIR /app

# 默认命令
CMD ["bash"]
