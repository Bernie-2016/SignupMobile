
/**
 * Generates and displays a QR code.
 * @param {hash} data - JSON hash {
 *      first_name: {string},
 *      last_name: {string},
 *      phone: {string},
 *      email: {string},
 *      zip: {string},
 *      canText: {boolean}
 *  }
 * @param {string} elemid - Element ID to display QR code in.
 */
function DisplayQR(data, elemid) {
    var string = JSON.stringify(data),
        qrcode = new QRCode(elemid, {
            text: string,
            colorDark: '#147FD7'
        });
}
