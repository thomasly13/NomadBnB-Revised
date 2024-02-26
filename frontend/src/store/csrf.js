

const csrfFetch = async (url, options = {}) => {
    options.headers = options.headers || {};

    options.method = options.method || 'GET';


    // if the options.method is not 'GET', then set the "Content-Type" header to
    // "application/json" and the "X-CSRF-Token" header to the value of the 
    // "X-CSRF-Token" cookie
    if (options.method.toUpperCase() !== 'GET') {
        options.headers['Content-Type'] = options.headers['Content-Type'] || 'application/json';
        options.headers['X-CSRF-Token'] = sessionStorage.getItem('X-CSRF-Token');
    }
    
    // call fetch with the url and the updated options hash

    const res = await fetch(url, options);
    // returns the response
    return res;
}


export default csrfFetch