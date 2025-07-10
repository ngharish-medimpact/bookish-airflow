FROM docker-local.artifactory.medimpact.com/dockerhub/apache/airflow:slim-3.0.2

# ARG ORACLE_CLIENT_URL_BASIC="https://download.oracle.com/otn_software/linux/instantclient/2380000/instantclient-basic-linux.x64-23.8.0.25.04.zip"
# ARG ORACLE_CLIENT_URL_SDK="https://download.oracle.com/otn_software/linux/instantclient/2380000/instantclient-sdk-linux.x64-23.8.0.25.04.zip"

# ARG ORACLE_CLIENT_DIR_BASE=/opt/oracle
# ARG ORACLE_CLIENT_SYMLINK_PATH=${ORACLE_CLIENT_DIR_BASE}/instantclient

# ENV LD_LIBRARY_PATH=${ORACLE_CLIENT_SYMLINK_PATH}:${LD_LIBRARY_PATH}
# ENV ORACLE_HOME=${ORACLE_CLIENT_SYMLINK_PATH}
# ENV TNS_ADMIN=/etc/oracle_config

# USER root

# RUN apt-get update && \
#     apt-get install -y --no-install-recommends unzip curl libaio1 && \
#     mkdir -p ${ORACLE_CLIENT_DIR_BASE} && \
#     curl -sSL -o /tmp/basic.zip "${ORACLE_CLIENT_URL_BASIC}" && \
#     curl -sSL -o /tmp/sdk.zip "${ORACLE_CLIENT_URL_SDK}" && \
#     unzip -oq /tmp/basic.zip -d ${ORACLE_CLIENT_DIR_BASE} && \
#     unzip -oq /tmp/sdk.zip -d ${ORACLE_CLIENT_DIR_BASE} && \
#     ACTUAL_CLIENT_DIR=$(find ${ORACLE_CLIENT_DIR_BASE} -maxdepth 1 -type d -name "instantclient_*" | head -n 1) && \
#     ln -sfn "${ACTUAL_CLIENT_DIR}" ${ORACLE_CLIENT_SYMLINK_PATH} && \
#     echo ${ORACLE_CLIENT_SYMLINK_PATH} > /etc/ld.so.conf.d/oracle-instantclient.conf && \
#     ldconfig && \
#     rm -rf /tmp/*.zip && \
#     apt-get clean && rm -rf /var/lib/apt/lists/*

USER airflow

COPY requirements.txt .
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt