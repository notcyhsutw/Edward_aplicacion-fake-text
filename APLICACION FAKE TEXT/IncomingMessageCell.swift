//
//  IncomingMessageCell.swift
//  APLICACION FAKE TEXT
//
//  Created by Cheng-Yu Hsu on 7/27/16.
//  Copyright © 2016 Edwjon. All rights reserved.
//

import UIKit

class IncomingMessageCell: MessageCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = UITableViewCellSelectionStyle.None
        
        let bubbleImage = UIImage(named: "image2.png")!
        bubbleImageView?.image = bubbleImage.resizableImageWithCapInsets(
            UIEdgeInsetsMake(
                round(bubbleImage.size.height * 0.5),
                round(bubbleImage.size.width * 0.5),
                round(bubbleImage.size.height * 0.5),
                round(bubbleImage.size.width * 0.5)
            )
        )
        
        
        messageLabel?.text = nil
    }
}
