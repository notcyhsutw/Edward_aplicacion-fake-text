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
        
        
    }
    
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // use large numbers to avoid collisions with system-defined views
        let messageViewTag = 2
        let ballonViewTag = 4
        let labelTag = 8
        
        var ballonview = UIImageView()
        var label = UILabel()
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        if let messageView = cell.contentView.viewWithTag(messageViewTag) {
            // message view is set
            ballonview = (messageView.viewWithTag(ballonViewTag) as! UIImageView)
            label = (messageView.viewWithTag(labelTag) as! UILabel)
        } else {
            // message view is NOT set
            ballonview.frame = CGRectZero
            ballonview.tag = ballonViewTag
            
            label.frame = CGRectZero
            label.backgroundColor = UIColor.clearColor()
            label.lineBreakMode = NSLineBreakMode.ByWordWrapping
            label.textAlignment = NSTextAlignment.Left
            label.numberOfLines = 0
            label.tag = labelTag
            label.sizeToFit()
            label.font = label.font.fontWithSize(15.0)
            
            let message = UIView()
            message.tag = messageViewTag
            message.frame = CGRectMake(0.0, 0.0, cell.frame.size.width, cell.frame.size.height)
            message.addSubview(ballonview)
            message.addSubview(label)
            
            cell.contentView.addSubview(message)
        }
        
        let message = messages[indexPath.row]
        let textt: String = message.content!
        
        
        let size:CGSize = textt.boundingRectWithSize(CGSizeMake(240.0, 480.0), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(15.0)], context: nil).size
        
        
        var ballon:UIImage = UIImage()
        
        
        if (message.isOutgoing) {
            
            
            ballonview.frame = CGRectMake(314.5 - (size.width + 28.0), 2.5, size.width + 34.0, CGFloat(ceil(Float(size.height))) + 12.0)
            ballon = UIImage(named: "IMAGEN")!.stretchableImageWithLeftCapWidth(24, topCapHeight: 15)
            
            label.frame = CGRectMake(305.0 - (size.width + 5.0), 8.0, size.width + 5.0, CGFloat(ceil(Float(size.height))))
            label.textColor = UIColor.whiteColor()
            
            
            
        } else {
            
            ballonview.frame = CGRectMake(0.0, 2.0, size.width + 28, size.height + 12)
            ballon = UIImage(named: "image2")!.stretchableImageWithLeftCapWidth(24, topCapHeight: 15)
            
            
            label.frame = CGRectMake(16, 8, size.width + 5, size.height)
            label.textColor = UIColor.blackColor()
            
        }
        
        
        ballonview.image = ballon
        label.text = textt as String
        
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
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        
        let body:String = messages[indexPath.row].content!
        let bodysize:CGSize = body.boundingRectWithSize(CGSizeMake(240.0, 480.0), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(15.0)], context: nil).size
        return bodysize.height + 15
        
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
