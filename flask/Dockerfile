FROM ubuntu:16.04
MAINTAINER rakky.sem@ubill24.com

LABEL support=python2.7

LABEL pythonenv=/app/venv

LABEL alembic_dir=/app/migrate

# set container timezone to +7 PP
ENV TZ=Asia/Phnom_Penh

RUN apt-get update

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apt-get install -y alembic nano gettext-base build-essential checkinstall libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev python-dev supervisor python-minimal python-pip && \
    pip install uwsgi flask

RUN pip install pip --upgrade pip

WORKDIR app

COPY app /app

RUN cp /app/supervisord.conf /etc/supervisor/conf.d

RUN chmod -R o+rX /usr/local/lib/python2.7 && pip install virtualenv && virtualenv venv

RUN /bin/bash -c "source /app/venv/bin/activate"

RUN apt-get install -y wget

CMD /app/entrypoint.sh