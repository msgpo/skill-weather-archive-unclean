import QtQuick.Layouts 1.4
import QtQuick 2.4
import QtQuick.Controls 2.0
import org.kde.kirigami 2.4 as Kirigami

import Mycroft 1.0 as Mycroft
import org.kde.lottie 1.0

Mycroft.Delegate {
    id: root

    function getWeatherImagery(weathercode){
        switch(weathercode) {
        case 0:
            return "animations/sunny.json";
            break
        case 1:
            return "animations/partlycloudy.json";
            break
        case 2:
            return "animations/cloudy.json";
            break
        case 3:
            return "animations/rain.json";
            break
        case 4:
            return "animations/rain.json";
            break
        case 5:
            return "animations/storm.json";
            break
        case 6:
            return "animations/snow.json";
            break
        case 7:
            return "animations/fog.json";
            break
        }
    }

    ColumnLayout {
        id: grid
        Layout.fillWidth: true
        anchors.centerIn: parent
        spacing: Kirigami.Units.largeSpacing * 5
        Repeater {
            id: forecastRepeater
            model: sessionData.forecast.first
            delegate: GridLayout {
                columns: 2
                Layout.fillWidth: true
                LottieAnimation {
                    Layout.preferredHeight: Kirigami.Units.gridUnit * 7
                    Layout.maximumWidth: Kirigami.Units.gridUnit * 15
                    source: Qt.resolvedUrl(getWeatherImagery(modelData.weathercode))
                    loops: Animation.Infinite
                    fillMode: Image.PreserveAspectFit
                    running: true
                }
                Mycroft.DynamicLabel {
                    font.weight: Font.Bold
                    proportionalSize: root.width * 0.2
                    Layout.preferredWidth: parent.width * 0.6
                    Layout.preferredHeight: parent.height * 0.2
                }

                Mycroft.DynamicLabel {
                    font.weight: Font.Bold
                    proportionalSize: root.width * 0.4
                    text: modelData.max + "°"
                }

                Label {
                    Layout.alignment: Qt.AlignHCenter
                    font.capitalization: Font.AllUppercase
                    font.family: "Noto Sans Display"
                    font.styleName: "Thin"
                    font.pixelSize: 140
                    color: "white"
                    lineHeight: 0.6
                    text: modelData.min + "°"
                }
            }
        }
        Item {
            height: Kirigami.Units.largeSpacing * 10
        }
    }
}
