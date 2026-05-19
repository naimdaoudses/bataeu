const cds = require('@sap/cds');

module.exports = class InvoiceService extends cds.ApplicationService {
    init() {
        
        this.before('CREATE', 'Facturas', async (req) => {
            const data = req.data;

            // 1. FECHA: Fuerza la fecha de hoy usando los datos locales (Argentina)
            const hoy = new Date();
            const year = hoy.getFullYear();
            const month = String(hoy.getMonth() + 1).padStart(2, '0');
            const day = String(hoy.getDate()).padStart(2, '0');
            
            data.fechaEmision = `${year}-${month}-${day}`; // Devuelve "2026-05-18"

            // 2. NÚMERO: Cuenta y suma 1 al último número de factura
            const ultima = await SELECT.one.from('Facturas').columns('nroFactura').orderBy('nroFactura desc');
            data.nroFactura = ultima && ultima.nroFactura ? (parseInt(ultima.nroFactura) + 1).toString() : "1";
        });

        return super.init();
    }
}