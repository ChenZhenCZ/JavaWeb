function login() {
    $.post(contextPath + '/user/login',
        $('#loginForm').serialize(),
        function (data) {
            if (data.result === 'ok') {
                window.location.href = contextPath + "/user/home";
            } else {
                showInfoAlert(data.message);
            }
        },
        'json'
    );
}