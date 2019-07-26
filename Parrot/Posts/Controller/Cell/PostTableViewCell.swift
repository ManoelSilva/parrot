import UIKit
import Reusable

class PostTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var ownerProfileImageView: UIImageView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.ownerProfileImageView.layer.cornerRadius = self.ownerProfileImageView.frame.height / 2
//        self.ownerProfileImageView.image = Asset.ownerDefault.image
    }

    func bind(post: PostView) {
//        self.postImageView.image = Asset.postDefault.image
        self.userLabel.text = post.user.name
        self.messageLabel.text = post.message
    }
}
