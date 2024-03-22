FROM grafana/grafana:10.0.12

# Install sqlite.
USER root
RUN apk update && apk upgrade
RUN apk add sqlite

## Load the database file.
#COPY grafana.sql /tmp/grafana.sql
#RUN sqlite3 /var/lib/grafana/grafana.db </tmp/grafana.sql
