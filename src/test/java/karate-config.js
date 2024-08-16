function fn() {

    var env = karate.env; // get system property 'karate.env'
    karate.log('karate.env system property was:', env);
    karate.configure('logPrettyRequest', true); karate.configure('logPrettyResponse', true);
    if (!env) {
        env = 'dev';
    }
    var config = {
        apiUrl: 'https://restful-booker.herokuapp.com/'
    }
    if (env == 'dev'){
        config.username = 'admin'
        config.password = 'password123'
    }


    return config;
}