FROM node:22-slim

WORKDIR /opt/app
RUN chown node:node /opt/app
USER node

COPY --chown=node:node package.json package-lock.json ./
RUN npm ci && npm cache clean --force

COPY --chown=node:node . .

EXPOSE 1337
CMD ["npm", "run", "develop"]
