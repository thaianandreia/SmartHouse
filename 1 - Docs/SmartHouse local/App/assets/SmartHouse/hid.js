SmartHouse.HID = (function () {
    return {
        Metodos: {
            SelecionarHidrometro: function (callback) {
                dto = {};
                SmartHouse.Ajax.Post(dto, "../HID/HidraulicaWS.asmx/SelecionarHidrometro", callback);
            },
            SelecionarVazamento: function (callback) {
                dto = {};
                SmartHouse.Ajax.Post(dto, "../HID/HidraulicaWS.asmx/SelecionarVazamento", callback);
            },
            Gravar: function (ip, callback) {
                dto = {};
                SmartHouse.Ajax.Get(
                    dto,
                    "http://" + ip + "/H1/read",
                    function (data) {
                        var dto = {};
                        dto.valor = data;
                        SmartHouse.Ajax.Get(dto, "../HID/HidraulicaWS.asmx/Gravar");
                    });
            }
        }

    }
})();