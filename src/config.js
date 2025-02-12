
// eslint-disable-next-line
export default {
  oidc: {
    clientId: process.env.CLIENT_ID,
    issuer: process.env.ISSUER,
    redirectUri: window.location.origin + '/login/callback',
    scopes: ['openid', 'profile', 'email', 'offline_access'],
    pkce: true,
  },
};
