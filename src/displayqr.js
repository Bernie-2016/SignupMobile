
/**
 * Generates and displays a QR code.
 * @param {hash} data - JSON hash {
 *      first: {string},
 *      last: {string},
 *      cell: {string},
 *      email: {string},
 *      zip: {string},
 *      optin: {boolean}
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
