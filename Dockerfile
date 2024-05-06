FROM node:18-alpine as front-builder

RUN npm install -g @angular/cli

WORKDIR /front

COPY ./front/package*.json .
RUN npm ci

COPY ./front .

# Build the angular app
RUN ng build

FROM node:18-alpine as back-builder

WORKDIR /back

RUN apk add --no-cache python3 py3-pip

COPY ./back/package*.json .
RUN npm ci

COPY ./back .

RUN npm run build

FROM node:18-alpine

RUN export SECRET_KEY=$(python3 -c 'import secrets; print(secrets.token_hex(32))')

WORKDIR /app

# Copy the package.json, package-lock.json
COPY ./back/package*.json ./
# Install the dependencies
RUN npm ci --omit=dev

# Copy resources
COPY ./back/public/resources ./public/resources

# Copy the built back end to the app
COPY --from=back-builder ./back/dist ./dist
# Copy the built angular app to the back end
COPY --from=front-builder /front/dist/test-one ./website


CMD ["npm", "start"]