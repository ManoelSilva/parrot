import UIKit
import Reusable

protocol PostTableViewCellDelegate {
    func tapedDots(post: PostView!)
    func tapedLike(post: PostView!)
}

class PostTableViewCell: UITableViewCell, NibReusable {
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var ownerProfileImageView: UIImageView!
    @IBOutlet weak var dotsImageView: UIImageView!
    @IBOutlet weak var likesImageView: UIImageView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var likesCountLabel: UILabel!
    
    var post: PostView!
    var delegate: PostTableViewCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpDotsAction()
        self.ownerProfileImageView.layer.cornerRadius = self.ownerProfileImageView.frame.height / 2
        
        self.postImageView.image = Asset.defaultPost.image
        self.dotsImageView.image = Asset.dots.image
        self.likesImageView.image = Asset.like.image
    }

    func bind(post: PostView, delegate: PostTableViewCellDelegate) {
        self.post = post
        self.delegate = delegate
        
        self.ownerProfileImageView.image = Asset.defaultUser.image
        self.userLabel.text = L10n.Common.identifier + self.post.user.userName!
        self.messageLabel.text = self.post.message
        self.likesCountLabel.text = String(self.post.likes)
    }
    
    func setUpDotsAction() {
        self.dotsImageView.isUserInteractionEnabled = true
        self.dotsImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dotsActionDelegate)))
    }
    
    func setUpLikeAction() {
        self.likesImageView.isUserInteractionEnabled = true
        self.likesImageView.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(self.likeActionDelegate)))
    }
    
    @objc func dotsActionDelegate() {
        self.delegate.tapedDots(post: self.post)
    }
    
    @objc func likeActionDelegate() {
        self.delegate.tapedLike(post: self.post)
    }
}
