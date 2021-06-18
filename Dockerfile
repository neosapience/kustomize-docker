FROM debian:9.13-slim
ENV KUSTOMIZE_VER 4.0.5
ENV KUBECTL_VER 1.21.2

RUN apt update \
  && apt install -y curl git \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /working
WORKDIR /working

RUN curl -L https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VER}/kustomize_v${KUSTOMIZE_VER}_linux_amd64.tar.gz -o kustomize.tar.gz \
    && tar -xvf kustomize.tar.gz \
    && mv kustomize /usr/bin/kustomize \
    && chmod +x /usr/bin/kustomize

RUN curl -L https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VER}/bin/linux/amd64/kubectl -o /usr/bin/kubectl \
    && chmod +x /usr/bin/kubectl

CMD ["/usr/bin/kustomize"]
