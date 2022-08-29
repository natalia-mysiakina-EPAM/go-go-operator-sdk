FROM public.ecr.aws/docker/library/alpine:3.15.6

ENV OPERATOR=/usr/local/bin/go-go-operator-sdk \
    USER_UID=1001 \
    USER_NAME=go-go-operator-sdk

# install operator binary
COPY go-binary ${OPERATOR}

COPY build/bin /usr/local/bin

RUN  chmod u+x /usr/local/bin/user_setup && chmod ugo+x /usr/local/bin/entrypoint && /usr/local/bin/user_setup

ENTRYPOINT ["/usr/local/bin/entrypoint"]

USER ${USER_UID}
