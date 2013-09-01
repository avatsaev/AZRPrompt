import bb.cascades 1.0


Page {
    attachedObjects: [
        
        AZRPrompt {
            id: prompt
            title: "This is an iOS7 diag"
            body: "Isn't it beautiful?\nMake your choice by clicking of the buttons bellow."
            cancel_text: "Nope"
            ok_text: "It sure is"
            
            onClosed: {
                
                if (prompt.selected_choice == prompt.ok_buton){
                    result.text="Accepted"
                }else if(prompt.selected_choice == prompt.cancel_buton){
                    result.text="Declined"
                }else if(prompt.selected_choice == -1){
                    result.text="Closed"
                }
            }
        }
    
    
    
    ]
    
    
    
    
    Container {
        
        id:root
        background: Color.create("#333333")
        layout: DockLayout {
        
        }
        
        Container {
            verticalAlignment: VerticalAlignment.Top
            
            horizontalAlignment: HorizontalAlignment.Center
            Button {
                text: "Open Dialog"
                horizontalAlignment: HorizontalAlignment.Center
                
                onClicked: {
                    prompt.open();
                }
            }
            
            Label {
                id: result
                text: ""
                horizontalAlignment: HorizontalAlignment.Center
                textStyle.color: Color.create("#ffffffff")
                textStyle.fontSize: FontSize.XLarge
                textStyle.fontWeight: FontWeight.W100
            
            }
        
        }
    
    
    }
}
