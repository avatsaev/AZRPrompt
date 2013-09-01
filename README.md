AZRPrompt
=========

iOS7 like prompt dialog for BlackBerry 10 made entirely with QML.


Properties of the control:

-icon: URL of the icon image (ex: asset://images/dialog_question.png)

-title: The title of the dialog

-body: The main text of the dialog

-ok_text: Text for confirm button

-cancel_text: Text for cancel button

-selected_choice: index of clicked button

-ok_button: index of confirm button

-cancel_button: index of cancel button


Example of use
=================

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


Result:

![preview](http://i.imgur.com/HLBJuzK.png)


