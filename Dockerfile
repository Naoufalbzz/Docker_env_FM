FROM registry.access.redhat.com/ubi9/ubi:latest

WORKDIR /src

RUN dnf update -y \
    && dnf -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-9-x86_64/pgdg-redhat-repo-latest.noarch.rpm \
    && dnf -y install postgresql15 mysql \
    && dnf install -y python3 python3-devel

COPY requirements.txt /src/requirements.txt
COPY src/* /src/

RUN pip3 install -r requirements.txt --no-cache-dir

CMD ["bash"]