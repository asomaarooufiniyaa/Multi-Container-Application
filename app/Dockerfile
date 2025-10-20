FROM node:latest
WORKDIR /app
COPY package*.json /app
ARG NODE_ENV=development
RUN if [ "$NODE_ENV" = "production" ]; \
    then npm install --only=prod; \
    else npm install; \
    fi
COPY . .
CMD [ "npm" , "start" ]