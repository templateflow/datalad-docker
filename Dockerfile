FROM python:3.11-alpine as builder

RUN apk update && apk add --no-cache curl bzip2 gcc libffi-dev musl-dev

RUN python -m pip install datalad pytest ssh_agent_setup

FROM python:3.11-alpine
COPY --from=builder /usr/local /usr/local

RUN apk update && apk add --no-cache git openssh-client git-annex
