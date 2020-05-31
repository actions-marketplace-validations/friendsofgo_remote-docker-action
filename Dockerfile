FROM docker:19.03.10
LABEL MAINTAINER = 'Friends of Go (it@friendsofgo.tech)'
WORKDIR /github/workspace
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]