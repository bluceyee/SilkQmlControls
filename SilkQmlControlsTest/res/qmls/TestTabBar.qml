﻿/*!
 *@file TestTabBar.qml
 *@brief 自定义TabBar
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.7
import QtQuick.Controls 2.3

TabBar {
    property alias myModel: myModel
    property int lastIndex: 0

    id: bar
    currentIndex: 0
    background: Rectangle{
        color: "transparent"
    }

    ListModel {
        id: myModel
    }

    Repeater {
        id: repeater
        model: myModel

        TabButton {
            property alias imageSource: image.source
            property alias textColor: text.color

            height: bar.height
            contentItem:Text{
                id: text
                text: modelText
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignBottom
                color: (model.index === bar.currentIndex) ? modelColorG : modelColor
            }
            background:Image{
                id: image
                width: 32
                height: 32
                anchors.horizontalCenter: parent.horizontalCenter
                source: (model.index === bar.currentIndex) ? modelSrcG : modelSrc
            }
            onHoveredChanged: {
                if (model.index !== bar.currentIndex){
                    hovered ? text.color = modelColorG : text.color = modelColor
                    hovered ? image.source = modelSrcG : image.source = modelSrc
                }
            }
            onClicked: {
                repeater.itemAt(bar.lastIndex).imageSource = myModel.get(bar.lastIndex).modelSrc;
                repeater.itemAt(bar.lastIndex).textColor = modelColor;

                image.source = modelSrcG;
                text.color = modelColorG;
                bar.lastIndex = model.index;
            }
        }
    }
}
