FROM alpine

RUN apk add --no-cache socat python2 build-base python2-dev &&\
    python2 -m ensurepip &&\
    pip install pycrypto

COPY files/ ./

EXPOSE 8000

CMD echo $FLAG > flag.txt; export FLAG=not_flag; FLAG=not_flag;socat -d -d -d -d -v TCP-LISTEN:8000,fork,reuseaddr EXEC:python2 generator.py,pty,stderr
