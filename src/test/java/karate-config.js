function fn() {
    var env = karate.env;
    karate.log('karate.env system property was:', env);

    var config = {
        env: env,
        baseUrl: 'https://conduit-realworld-example-app.fly.dev/api',
        articleUrl: 'https://conduit-realworld-example-app.fly.dev/#/article/',
        email: 'test321@gmail.com',
        password: '1234567890'
    };

    karate.configure('connectTimeout', 10000);
    karate.configure('readTimeout', 10000);

    var loginResult = karate.callSingle('classpath:conduit/steps/auth/postLoginOk.feature', config);
    config.authToken = loginResult.authToken;

    return config;
}
