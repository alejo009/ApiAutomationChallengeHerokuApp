function fn() {
    // get system property 'karate.env'
    let env = Karate.env;

    Karate.configure('logPrettyRequest', true);
    Karate.configure('logPrettyResponse', true);
    if (!env) {
        env = 'dev';
    }
    let config = {
        apiUrl: "https://restful-booker.herokuapp.com/"
    }
    if (env == 'dev') {
        config.username = 'admin'
        config.password = 'password123'
    }
    let accessToken = Karate.callSingle('classpath:features/token/createToken.feature', config).accessToken
    Karate.configure('headers', {Authorization: 'Token ' + accessToken})

    return config;
}