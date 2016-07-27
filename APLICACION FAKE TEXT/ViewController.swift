//
//  ViewController.swift
//  APLICACION FAKE TEXT
//
//  Created by Edward Pizzurro Fortun on 15/7/16.
//  Copyright © 2016 Edwjon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate  {
    
    // data structure of message
    class Message {
        var content: String?
        var isOutgoing: Bool = false
        
        init(content: String, isOutgoing: Bool = false) {
            self.content = content
            self.isOutgoing = isOutgoing
        }
    }
    
    @IBOutlet var textfield: UITextField!
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var swiche: UISwitch!
    
    @IBOutlet var readyboton: UIButton!
    
    @IBOutlet var botonborraroqlq: UIButton!
    
    
    
    var turno = Int()
    
    
    // MutableArray which has the messages
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //assignbackground()
        
        turno = 0
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        textfield.placeholder = "Nombre de la persona"
        
        self.textfield.delegate = self
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 48.0
    }
    
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let message = messages[indexPath.row]
        
        let cellIdentifier = message.isOutgoing ? "OutgoingCell" : "IncomingCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        if let messageCell = cell as? MessageCell {
            messageCell.messageLabel?.text = message.content
        }
        
        return cell
        
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    //el de abajo
    @IBAction func Okqlq(sender: AnyObject)
    {
        
        
    }
    
    
    //el de arriba (cuando esta todo listo)
    @IBAction func READYbutton(sender: AnyObject)
    {
        
        
        
    }
    
    
    
    
    @IBAction func accionswiche(sender: AnyObject)
    {
        if swiche.on {
            
            textfield.placeholder = "Turno Azul"
            
        } else {
            
            textfield.placeholder = "Turno Gris"
        }
    }
    
    
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textfield.resignFirstResponder()
        
        if swiche.on {
            
            textfield.placeholder = "Turno Azul"
            
        } else {
            
            textfield.placeholder = "Turno Gris"
        }
        
        
        
        
        if textfield.text != ""{
            
            if turno == 0 {
                
                navigationItem.title = textfield.text
                
            }
            
            
            if turno == 1 {
                
                messages.append(Message(content: textfield.text!, isOutgoing: swiche.on))
            }
            
            
            turno = 1
            
            tableView.reloadData()
            textfield.text = ""
        }
        
        return true;
    }
    

    
    
}
