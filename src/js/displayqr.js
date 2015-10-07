
/**
 * Generates and displays a QR code. Creates a QR code with data in the format:
 * "first_name","last_name","phone","email","zip",true
 *
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
    var string = JSON.stringify([
            'first_name',
            'last_name',
            'phone',
            'email',
            'zip',
            'canText'
        ].map(function(key) {
            return data[key];
        })).slice(1, -1),

        size = Math.min(document.getElementById(elemid).clientWidth, 256);

    new QRCode(elemid, {
        text: string,
        width: size,
        height: size,
        colorDark: '#147FD7'
    });
}
