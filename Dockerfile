# Python support can be specified down to the minor or micro version
# (e.g. 3.6 or 3.6.3).
# OS Support also exists for jessie & stretch (slim and full).
# See https://hub.docker.com/r/library/python/ for all supported Python
# tags from Docker Hub.
FROM tiangolo/uwsgi-nginx-flask

# If you prefer miniconda:
#FROM continuumio/miniconda3

LABEL Name=flask_webapi Version=0.0.1
ENV LISTEN_PORT=5000
EXPOSE 5000

WORKDIR /app
ADD . /app

ENV UWSGI_INI uwsgi.ini
ENV BOILERPLATE_ENV prod


# Using pip:
RUN python3 -m pip install -r requirements.txt
# CMD ["python", "manage.py", "run"]

# Using pipenv:
#RUN python3 -m pip install pipenv
#RUN pipenv install --ignore-pipfile
#CMD ["pipenv", "run", "python3", "-m", "flask_webapi"]

# Using miniconda (make sure to replace 'myenv' w/ your environment name):
#RUN conda env create -f environment.yml
#CMD /bin/bash -c "source activate myenv && python3 -m flask_webapi"
