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
    }

    func bind(post: PostView) {
        self.ownerProfileImageView.image = Asset.defaultUser.image
        self.userLabel.text = L10n.Common.identifier + post.user.userName!
        self.messageLabel.text = post.message
    }
}
