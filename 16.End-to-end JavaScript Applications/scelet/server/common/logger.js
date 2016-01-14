var logger = function() {

    function log(message, notifyUser) {
        notifyUser = notifyUser | false;

        console.log(message);

        if (notifyUser) {
            // TODO: logic for notifying the user
        }
    }

    function warn(message, notifyUser) {
        notifyUser = notifyUser | false;

        console.warn(message);

        if (notifyUser) {
            // TODO: logic for notifying the user
        }
    }

    function error(message, notifyUser) {
        notifyUser = notifyUser | false;

        console.error(message);

        if (notifyUser) {
            // TODO: logic for notifying the user
        }
    }

    return {
        log: log,
        warn: warn,
        error: error
    }
}();

module.exports = logger;