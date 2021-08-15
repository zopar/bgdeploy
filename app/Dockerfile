FROM python:3.6
ARG COMMIT=""
LABEL commit=${COMMIT}
LABEL maintainer="armando.trinchillo _at_ gmail.com"
ENV COMMIT_SHA=${COMMIT}

RUN mkdir /app
WORKDIR /app
ADD requirements.txt /app/
RUN pip install -r requirements.txt
ADD . /app/

EXPOSE 8080
ENTRYPOINT ["python"]
CMD ["app.py"]