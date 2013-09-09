import bb.cascades 1.0

Dialog {
    id: mainDiag
    property url icon
    property string title: "Are you sure?"
    property string body: "Do you really want to quit without saving?\nAll changes will be lost."
    property string ok_text: "OK"
    property string cancel_text: "Cancel"
    property int selected_choice : -1 
    property int cancel_buton : 1;
    property int ok_buton: 0;
    
    onOpened: {
        prompt_appear.play();
    }
    
    
    onClosed: {
        prompt_disappear.play();
    }
    
    
    Container {
        id: prompt_root
        
        layout: AbsoluteLayout {}  
        
        opacity: 0
        
        
        animations: [
            ParallelAnimation {
                id: prompt_appear
                
                animations: [
                    FadeTransition {
                        
                        fromOpacity:0
                        toOpacity: 1
                        duration: 350
                    
                    },
                    ScaleTransition {
                        fromX: 0
                        fromY: 0
                        toX: 1
                        toY: 1
                        duration: 350
                        easingCurve: StockCurve.ElasticInOut
                    }
                ]
            },
            
            ParallelAnimation {
                id: prompt_disappear
                
                animations: [
                    FadeTransition {
                        
                        fromOpacity:1
                        toOpacity: 0
                        duration: 350
                    
                    },
                    ScaleTransition {
                        fromX: 1
                        fromY: 1
                        toX: 0
                        toY: 0
                        duration: 350
                    
                    }
                ]
                onEnded: {
                    mainDiag.close()
                }
            }
        ]
        
        verticalAlignment: VerticalAlignment.Center
        horizontalAlignment: HorizontalAlignment.Center
        Container {
            
            
            maxWidth: 600
            maxHeight: 600
            
            layout: StackLayout {}
            
            
            
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            
            
            Container {
                
                
                verticalAlignment: VerticalAlignment.Fill
                horizontalAlignment: HorizontalAlignment.Fill
                
                layout: DockLayout {}
                
                
                ImageView {
                    imageSource: "asset:///images/top.amd"
                    verticalAlignment: VerticalAlignment.Fill
                    horizontalAlignment: HorizontalAlignment.Fill
                
                }
                
                Container {
                    verticalAlignment: VerticalAlignment.Fill
                    horizontalAlignment: HorizontalAlignment.Center
                    
                    bottomPadding: 40.0
                    topPadding: 20.0
                    leftPadding: 10.0
                    rightPadding: 10.0
                    
                    ImageView {
                        id:icon
                        imageSource: icon
                        horizontalAlignment: HorizontalAlignment.Center
                        verticalAlignment: VerticalAlignment.Center
                    }
                    
                    Label {
                        text: title
                        
                        multiline: false
                        textStyle.fontWeight: FontWeight.W400
                        textStyle.fontSize: FontSize.Large
                        textStyle.textAlign: TextAlign.Center
                        horizontalAlignment: HorizontalAlignment.Center
                        verticalAlignment: VerticalAlignment.Center
                        textStyle.fontStyle: FontStyle.Default
                        textStyle.fontSizeValue: 0.0
                        textStyle.lineHeight: 0.7
                        textStyle.color: Color.create("#333333")
                    }
                    
                    
                    Label {
                        text: body
                        
                        multiline: true
                        textStyle.fontWeight: FontWeight.W100
                        textStyle.fontSize: FontSize.Medium
                        textStyle.textAlign: TextAlign.Center
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Center
                        textStyle.color: Color.create("#333333")
                    }
                
                
                }
            
            
            }
            Container {
                
                minHeight: 110
                
                verticalAlignment: VerticalAlignment.Bottom
                horizontalAlignment: HorizontalAlignment.Fill
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                
                }
                Container {
                    id: cancel_btn
                    
                    onTouch: {
                        
                        if (event.touchType == TouchType.Down){
                            cancel_bkg.imageSource = "asset:///images/bottom_left_clicked.amd"
                            cancel_lbl.textStyle.color = Color.create("#eeeeee")
                        }else if(event.touchType == TouchType.Up){
                            cancel_bkg.imageSource = "asset:///images/bottom_left.amd"
                            cancel_lbl.textStyle.color = Color.create("#007aff")
                            selected_choice = cancel_buton
                            exit()
                        }
                    
                    }
                    
                    onTouchExit: {
                        cancel_bkg.imageSource = "asset:///images/bottom_left.amd"
                        cancel_lbl.textStyle.color = Color.create("#007aff")
                    }
                    
                    verticalAlignment: VerticalAlignment.Fill
                    layout: DockLayout {
                    
                    }
                    preferredWidth: 300
                    
                    ImageView {
                        id: cancel_bkg
                        imageSource: "asset:///images/bottom_left.amd"
                        verticalAlignment: VerticalAlignment.Fill
                        horizontalAlignment: HorizontalAlignment.Fill
                    
                    }
                    
                    Label {
                        id: cancel_lbl
                        text: cancel_text
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Center
                        textStyle.color: Color.create("#007aff")
                        textStyle.fontWeight: FontWeight.W100
                        textStyle.fontSize: FontSize.Large

                    }
                
                }
                
                
                
                
                
                
                Container {
                    id: ok_btn
                    
                    onTouch: {
                        
                        if (event.touchType == TouchType.Down){
                            ok_bkg.imageSource = "asset:///images/bottom_right_clicked.amd"
                            ok_lbl.textStyle.color = Color.create("#eeeeee")
                        }else if(event.touchType == TouchType.Up){
                            ok_bkg.imageSource = "asset:///images/bottom_right.amd"
                            ok_lbl.textStyle.color = Color.create("#007aff")
                            selected_choice = ok_buton
                            exit()
                        }
                    
                    }
                    
                    
                    onTouchExit: {
                        ok_bkg.imageSource = "asset:///images/bottom_right.amd"
                        ok_lbl.textStyle.color = Color.create("#007aff")
                    }
                    
                    
                    verticalAlignment: VerticalAlignment.Fill
                    layout: DockLayout {
                    
                    }
                    preferredWidth: 300
                    
                    ImageView {
                        id: ok_bkg
                        imageSource: "asset:///images/bottom_right.amd"
                        verticalAlignment: VerticalAlignment.Fill
                        horizontalAlignment: HorizontalAlignment.Fill
                    
                    }
                    
                    Label {
                        id: ok_lbl
                        text: ok_text
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Center
                        textStyle.color: Color.create("#007aff")
                        textStyle.fontWeight: FontWeight.W400
                        textStyle.fontSize: FontSize.Large

                    }
                
                }
            
            }
        
        }
        
        
        
        
        //function show(){
        //  prompt_root.display = true
        //}
    
    }
    
    function exit(){
        prompt_disappear.play(); 
    }

}



