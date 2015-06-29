SmartHouse.SEG = (function () {
    return {
        Metodos: {
            Teste: function (callback) {
                dto = {};
                SmartHouse.Ajax.Post(dto, "../SEG/SegurancaWS.asmx/Teste", callback);
            },
            SelecionarTemperatura: function (callback) {
                dto = {};
                SmartHouse.Ajax.Post(dto, "../SEG/SegurancaWS.asmx/SelecionarTemperatura", callback);
            },
            SelecionarUmidade: function (callback) {
                dto = {};
                SmartHouse.Ajax.Post(dto, "../SEG/SegurancaWS.asmx/SelecionarUmidade", callback);
            },
            SelecionarPresenca: function (callback) {
                dto = {};
                SmartHouse.Ajax.Post(dto, "../SEG/SegurancaWS.asmx/SelecionarPresenca", callback);
            },
            SelecionarGases: function (callback) {
                dto = {};
                SmartHouse.Ajax.Post(dto, "../SEG/SegurancaWS.asmx/SelecionarGases", callback);
            },
            SelecionarIncendio: function (callback) {
                dto = {};
                SmartHouse.Ajax.Post(dto, "../SEG/SegurancaWS.asmx/SelecionarIncendio", callback);
            }
        }
       
    }
})();