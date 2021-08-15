#!/bin/bash
wrk -t1 -c2 -d120s http://app.traefik.me/commit