SmartHouse.ELE = (function () {
    return {
        Metodos: {
            SelecionarTensao: function (callback) {
                dto = {};
                SmartHouse.Ajax.Post(dto, "../ELE/EletricaWS.asmx/SelecionarTensao", callback);
            },
            SelecionarCorrente: function (callback) {
                dto = {};
                SmartHouse.Ajax.Post(dto, "../ELE/EletricaWS.asmx/SelecionarCorrente", callback);
            },
            Gravar: function (ip, callback) {
                dto = {};
                SmartHouse.Ajax.Get(
                    dto,
                    "http://"+ ip+"/status",
                    function (data) {
                        dto = {};
                        dto.tensao = data.v;
                        dto.corrente = data.c;

                        SmartHouse.Ajax.Get(dto, "../ELE/EletricaWS.asmx/Gravar");
                    });
            }
        }
       
    }
})();