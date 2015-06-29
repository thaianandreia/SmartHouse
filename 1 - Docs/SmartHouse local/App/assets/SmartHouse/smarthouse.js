SmartHouse = (function () {    
    return {
        Ajax: {
            Post: function (dto, page, callback) {
                $.ajax({
                    type: "POST",
                    url: page,
                    data: dto,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        callback(data.d)
                    }
                });
            },
            Get: function (dto, page, callback) {
                $.ajax({
                    type: "GET",
                    url: page,
                    data: dto,
                    dataType: "json",
                    success: function (data) {
                        callback(data)
                    }
                });
            }
        }
    }
})();