FROM alpine:3

LABEL org.opencontainers.image.source https://github.com/alesium/openldap

RUN  apk update \
  && apk add gettext openldap openldap-clients openldap-back-mdb openldap-passwd-pbkdf2 openldap-overlay-memberof openldap-overlay-ppolicy openldap-overlay-refint \
  && rm -rf /var/cache/apk/* \
  && mkdir -p /ldap

EXPOSE 389
EXPOSE 636

COPY config/ /ldap/

RUN rm -f /etc/openldap/slapd.conf

COPY docker-entrypoint.sh /
RUN chmod +xr /docker-entrypoint.sh

VOLUME ["/var/lib/openldap/openldap-data"]

ENTRYPOINT ["/docker-entrypoint.sh"]