FROM alpine/helm:2.13.1

LABEL maintainer=geraldngjs@gmail.com

ENV HELM_HOME /.helm
ENV MUSEUM hakomuseum

RUN apk add \
    --update-cache \
    --upgrade \
    --no-cache \
    --verbose \
    curl \
    ca-certificates \
    bash \
    git && \
    mkdir -pv $HELM_HOME/plugins && \
    helm plugin install \
    --version 0.7.1 \
    https://github.com/chartmuseum/helm-push

COPY script.sh /bin/

RUN chmod +x /bin/script.sh

ENTRYPOINT ["/bin/script.sh"]
