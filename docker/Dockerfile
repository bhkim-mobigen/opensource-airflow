#FROM apache/airflow:slim-2.10.4

#RUN pip install psycopg2-binary


FROM rockylinux:8.9

# ps 설치
RUN dnf -y install procps-ng

#timezone 설정
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime && dnf install -y tzdata && dnf clean all
ENV TZ=Asia/Seoul


# # 필수 패키지 설치
RUN dnf -y groupinstall "Development Tools" && \
    dnf -y install python3.8 python3-pip && \
    python3.8 -m pip install --upgrade pip && \
    dnf clean all

# RUN dnf -y update && \
#     dnf -y install \
#     python3 \
#     python3-pip \
#     gcc \
#     gcc-c++ \
#     make \
#     libpq-devel \
#     && dnf clean all


#기본 python 버전 변경
RUN rm /usr/bin/python3
RUN ln -s /usr/bin/python3.8 /usr/bin/python3

#기본 라이브러리들 설치
RUN dnf -y update && \
    dnf -y install \
    cyrus-sasl-devel \
    gcc-c++ && \
    dnf clean all



# Python3 및 pip 업그레이드
RUN python3 -m pip install --upgrade pip


#airflow 설치 파일 이동 및 설치
COPY ../airflow-lib.tar.gz /airflow-lib.tar.gz
RUN tar xvzf airflow-lib.tar.gz
RUN rm airflow-lib.tar.gz

RUN ls -al

RUN python3.8 -m pip install --upgrade pip wheel
RUN pip install --no-index --find-links=/airflow-lib apache-airflow[slim]==2.10.4
RUN pip install --no-index --find-links=/airflow-lib psycopg2-binary

RUN rm -rf /airflow-lib


# 작업 디렉토리 설정 (Airflow DAG 파일을 이곳에 배치)
RUN mkdir /airflow
WORKDIR /airflow

# 기본적인 환경 변수 설정 (Airflow 관련 설정)
ENV AIRFLOW_HOME=/airflow

# entry point 생성
COPY ../entrypoint-webserver.sh /entrypoint-webserver.sh
COPY ../entrypoint-scheduler.sh /entrypoint-scheduler.sh
RUN chmod 755 /entrypoint-webserver.sh
RUN chmod 755 /entrypoint-webscheduler.sh

# Airflow 웹서버 및 스케줄러 실행
CMD ["sh", "-c", "set -e; /entrypoint-webserver.sh"]