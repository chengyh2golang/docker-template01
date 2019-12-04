#!/bin/sh
/opt/pylon-service-web/bin/pylon-service-web start && until [ -f /opt/pylon-service-web/pylon-web.log ]; do sleep 1;done && tail -f /opt/pylon-service-web/pylon-web.log
