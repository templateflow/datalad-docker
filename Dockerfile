FROM python:3.8-alpine as builder

RUN apk update && apk add --no-cache curl bzip2 gcc libffi-dev musl-dev

RUN pip install datalad pytest ssh_agent_setup

FROM python:3.8-alpine
COPY --from=builder /usr/local /usr/local

RUN apk update && apk add --no-cache git openssh-client git-annex
