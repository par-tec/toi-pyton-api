#
# Dockerfile for a simple connexion application
#
FROM python:3-alpine
RUN mkdir /app && chmod 755 /app
COPY openapi.yaml /app/openapi.yaml
RUN pip install connexion connexion[swagger-ui]

WORKDIR /app
USER 1001
ENTRYPOINT ["/usr/local/bin/connexion"]
CMD ["run", "/app/openapi.yaml", "--mock=all"]