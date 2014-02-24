import QtQuick 2.0
import Ubuntu.Components 0.1
import Ubuntu.Components.Popups 0.1
import "../components"
Tab {
    id: tab1
    title: i18n.tr("Try it out")
    page: Page {
    id: page1
    x: 0
    y: 0
    active: true
    isLeaf: true
    anchors.verticalCenterOffset: 0
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.verticalCenter: parent.verticalCenter
    title: i18n.tr("PI Training")
    Component {
         id: dialog
         Dialog {
             function checkInput(){
                 var text = text_input1.displayText;
                 if(text.length > 0){
                     var i = 0;
                     var still_right = true;
                     var right = 0;
                     while(i < text.length && still_right && i < 2000){
                         if (text.charAt(i) == "14159265358979323846264338327950288419716939937510582097494459230781640628620899862803482534211706798214808651328230664709384460955058223172535940812848111745028410270193852110555964462294895493038196442881097566593344612847564823378678316527120190914564856692346034861045432664821339360726024914127372458700660631558817488152092096282925409171536436789259036001133053054882046652138414695194151160943305727036575959195309218611738193261179310511854807446237996274956735188575272489122793818301194912983367336244065664308602139494639522473719070217986094370277053921717629317675238467481846766940513200056812714526356082778577134275778960917363717872146844090122495343014654958537105079227968925892354201995611212902196086403441815981362977477130996051870721134999999837297804995105973173281609631859502445945534690830264252230825334468503526193118817101000313783875288658753320838142061717766914730359825349042875546873115956286388235378759375195778185778053217122680661300192787661119590921642019893809525720106548586327886593615338182796823030195203530185296899577362259941389124972177528347913151557485724245415069595082953311686172785588907509838175463746493931925506040092770167113900984882401285836160356370766010471018194295559619894676783744944825537977472684710404753464620804668425906949129331367702898915210475216205696602405803815019351125338243003558764024749647326391419927260426992279678235478163600934172164121992458631503028618297455570674983850549458858692699569092721079750930295532116534498720275596023648066549911988183479775356636980742654252786255181841757467289097777279380008164706001614524919217321721477235014144197356854816136115735255213347574184946843852332390739414333454776241686251898356948556209921922218427255025425688767179049460165346680498862723279178608578438382796797668145410095388378636095068006422512520511739298489608412848862694560424196528502221066118630674427862203919494504712371378696095636437191728746776465757396241389086583264599581339047802759009".charAt(i)){
                             right = right + 1;
                         }else{
                             still_right = false;
                         }

                         i = i + 1;
                     }
                     if(i === 2000 && text.length > 2000){
                         return "You got all 2000 first decimals right. However after that you are on your own. Thank you for using this app and congratulations.";
                     }
                     if(i === 2000){
                         return "You got all your decimals right. However after that you are on your own. Thank you for using this app and congratulations.";
                     }

                     text_input1.select(right, text_input1.displayText.length);
                     return "You got " + right+ " decimal(s) right. (Out of "+text.length+")";
                 }else{
                     return "You didn't enter anything.";
                 }
             }
             id: dialogue
             title: "Result"
             text: checkInput();
             Button {
                 text: "OK"
                 color: UbuntuColors.orange
                 onClicked: PopupUtils.close(dialogue)
             }
         }
    }Flickable {
        id: flick
        width: tab1.width; height: tab1.height
        contentWidth: tab1.width; contentHeight: tab1.height
        flickableDirection: Flickable.VerticalFlick
        clip: true;
        topMargin: 10
    Image {
        id: image2
        x: 269
        y: 344
        width: 41
        height: 46
        anchors.horizontalCenterOffset: -110
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit
        source: "../3,.svg"
    }
    Image {
        id: image1
        x: 350
        y: 94
        width: 200
        height: 200
        anchors.horizontalCenter: parent.horizontalCenter
        smooth: true
        fillMode: Image.PreserveAspectFit
        source: "../PI.svg"
    }

    TextField {
        id: text_input1
        x: 311
        y: 351
        width: 179
        height: 35
        color: "#333333"
        text: qsTr("")
        inputMask: ""
        mouseSelectionMode: 1
        maximumLength: 2050
        anchors.horizontalCenterOffset: 1
        echoMode: TextInput.Normal
        autoScroll: true
        anchors.horizontalCenter: parent.horizontalCenter
        selectedTextColor: "#ffffff"
        selectionColor: "#dd4814"
        font.bold: true
        font.pointSize: 15
        font.family: "Ubuntu"
        inputMethodHints: Qt.ImhDigitsOnly
    }

    Text {
        id: text1
        x: 327
        y: 406
        color: "#333333"
        text: qsTr("Enter your value of Pi here")
        anchors.horizontalCenterOffset: 0
        font.family: "Ubuntu"
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 15
    }
    Button {
        id: saveButton
        x: 360
        y: 446
        text: "Check"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 0
        onClicked: PopupUtils.open(dialog)
    }
}
}
}
