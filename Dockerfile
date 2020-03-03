FROM centos 

RUN yum install -y java-1.8.0-openjdk-devel.x86_64

RUN echo "export JAVA_HOME=" > /root/exp
RUN find /usr/lib/jvm/ -name java-1.8.0-openjdk-1.8.0.* | tee /root/jdkversion
RUN cat /root/jdkversion >> /root/exp

# link all lines
RUN sed -i ':Loop; N; $!b Loop; s/\n//g' /root/exp

RUN cat /root/exp >> /etc/profile
RUN source /etc/profile
RUN echo "/jre/lib/ext/" >> jdkversion
RUN sed -i ':Loop; N; $!b Loop; s/\n//g' /root/jdkversion

ADD ex.sh /root/webapps/
RUN chmod +x /root/webapps/ex.sh

RUN rm -f /root/exp
RUN mv /root/jdkversion /root/jdkpath

VOLUME ["/root/webapps"]

CMD ["bash"]
