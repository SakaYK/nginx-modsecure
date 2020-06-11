FROM owasp/modsecurity-crs:3.3-nginx
COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY REQUEST-901-INITIALIZATION.conf /opt/owasp-crs/rules/REQUEST-901-INITIALIZATION.conf
