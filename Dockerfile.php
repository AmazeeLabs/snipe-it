ARG CLI_IMAGE
FROM ${CLI_IMAGE} as cli

FROM amazeeio/php:7.3-fpm

COPY --from=cli /app /app
ENV APP_ENV=${LAGOON_ENVIRONMENT_TYPE}
