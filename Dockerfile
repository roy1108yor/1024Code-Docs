FROM node:alpine as deps
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

FROM node:alpine AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
ENV LANG C.UTF-8
ENV TZ=Asia/Shanghai
ENV NODE_ENV production


EXPOSE 3000

RUN yarn build
CMD ["yarn", "run", "serve", "--build", "--port", "3000", "--host", "0.0.0.0"]
