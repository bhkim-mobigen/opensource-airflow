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
#
# RUN pip install --upgrade setuptools
# RUN pip install --no-index --find-links=/airflow-lib apache-airflow[slim]==2.10.4
# RUN pip install --no-index --find-links=/airflow-lib psycopg2-binary
#
#
# #RUN pip install apache-airflow[slim]==2.10.4
# # psycopg2-binary 설치 (PostgreSQL 연동을 위한 필수 라이브러리)
# #RUN pip install psycopg2-binary
#
# # 작업 디렉토리 설정 (Airflow DAG 파일을 이곳에 배치)
# WORKDIR /airflow
#
# # 기본적인 환경 변수 설정 (Airflow 관련 설정)
# ENV AIRFLOW_HOME=/airflow
#
# # Airflow 웹서버 및 스케줄러 실행
# CMD ["airflow", "webserver"]


# # #트리노 복사 및 설치
# # #RUN wget https://repo1.maven.org/maven2/io/trino/trino-server/446/trino-server-446.tar.gz
# # COPY ../trino-server-446.tar.gz /trino-server-446.tar.gz
# # RUN tar xvzf trino-server-446.tar.gz
# # RUN rm trino-server-446.tar.gz
#
# #경로 재지정
# WORKDIR /trino-server-446
#
# #데이터 폴더 생성
# RUN mkdir /trino-server-446/data
#
# #volume 구성을 위한 기본 복제
# RUN mkdir /defaultfile
# RUN mkdir /defaultfile/trino-server-446
#
# #설정 파일 안으로
# COPY ../etc /trino-server-446/etc
#
# #기본 데이터 보존용 파일 복제
# RUN cp -r /trino-server-446/etc /defaultfile/trino-server-446
#
# #필요 데이터를 도커 안으로 이동
# COPY ../entrypoint.sh /entrypoint.sh
#
# #권한 설정
# RUN chmod 755 /trino-server-446/bin/*
# RUN chmod 755 /entrypoint.sh
#
# CMD ["sh", "-c", "set -e; /data_catalog_solution/docker_start.sh"]