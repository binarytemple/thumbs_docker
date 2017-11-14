FROM ruby:2.3-alpine AS thumbs_builder

RUN apk update && apk add build-base gcc git linux-headers

RUN git clone https://github.com/postbasho/thumbs.git

WORKDIR /thumbs/

RUN bundle install --path vendor/bundle

FROM ruby:2.3-alpine 

COPY --from=thumbs_builder /thumbs /thumbs 


ARG VCS_REF

LABEL org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/bryanhuntesl/thumbs"

WORKDIR  /thumbs

RUN apk update && apk add git

RUN bundle install --path vendor/bundle
 
CMD [ "bundle", "exec", "rackup", "-p" , "8080" ]
