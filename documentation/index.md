# Titanium Mobile Module for Cloudpayments iOS SDK

## Description

Appcelerator Titanium module for helping with CloudPayments.ru's transaction chain.
Check the details at https://github.com/cloudpayments/CloudPayments_iOSSDKDemo

Ready-to-use module located in dist/ folder.

## Referencing the module in your Titanium Mobile application ##

Simply add the following lines to your `tiapp.xml` file:

    <modules>
        <module version="1.0" platform="iphone">ru.cloudpayments.timodule</module>
    </modules>

## Accessing the Titanium Mobile Module for Cloudpayments Module

To access this module from JavaScript, you would do the following:

    var paymentModule = require("ru.cloudpayments.timodule");

The paymentModule variable is a reference to the Module object.

## Reference

The module has no network functionality, so any network operations (e.g. send cryptopacket to intermediate paymentserver) you should implement by yourself.

Also the module has no UI, therefore it has no proxy object which should be create'd from the module. 

The following API (that reflects the one of Chronopay SDK) is exposed:

### paymentModule.isCardNumberValid

Check is card number valid.

    Ti.API.info("Is valid card number=" + paymentModule.isCardNumberValid('YOUR_CARD_NUMBER'));

Returns boolean true or false.

### paymentModule.cardTypeFromCardNumber

Determines card type (e.g.Visa, MasterCard etc) from card number.

    Ti.API.info("Card type from card number: " + paymentModule.cardTypeFromCardNumber('YOUR_CARD_NUMBER'));

Return value is number, one of enum'ed in SDK:

    typedef enum {
        CPCardTypeAmericanExpress,
        CPCardTypeDinersClub,
        CPCardTypeCarteBlanche,
        CPCardTypeMasterCard,
        CPCardTypeMaestro,
        CPCardTypeEnRoute,
        CPCardTypeJCB,
        CPCardTypeDiscover,
        CPCardTypeVisa,
        CPCardTypeUnknown
    } CPCardType;

For example, for Visa card type it returns 8.

### cloudpayments.makeCardCryptogramPacket

Returns so-called 'cryptopacket' which ready to be sent to your intermediate server.

    Ti.API.info("cryptopacket=" + paymentModule.makeCardCryptogramPacket({
        cardNumber: 'YOUR_CARD_NUMBER',
        expirationDate: 'DD/MM/YYYY',
        cvv: 'YOUR_CVV',
        apiPublicID: 'YOUR_PUBLIC_ID_OR_SHOP_ID'
    }) );


## Author

Sergey Dmitriev

## License

TODO: Enter your license/legal information here.
