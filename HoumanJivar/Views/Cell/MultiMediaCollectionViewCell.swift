import UIKit
import RxSwift
import Kingfisher
import MediaPlayer

class MultiMediaCollectionViewCell: UICollectionViewCell {
 
    var playerLayer:AVPlayerLayer!
    var imageView:UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func loadUrl(url:String?) {
        if url == nil {
            self.showImageView()
        }else {
            self.showVideo(url: url!)
        }
    }
    
    private func showVideo(url:String) {
        if self.imageView != nil {
            self.imageView.isHidden = true
        }
        let player = AVPlayer(url: URL(string: url)!)
        self.playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.contentView.frame
        self.contentView.layer.addSublayer(playerLayer)
    }
    
    private func showImageView() {
        if self.playerLayer != nil {
            self.playerLayer.removeFromSuperlayer()
        }
        self.imageView = UIImageView(frame: self.contentView.frame)
        let url = URL(string: "http://www.jbhwheelchair.com/wp-content/uploads/2016/05/novideo.png")!
        self.imageView.kf.setImage(with: url)
        self.contentView.addSubview(self.imageView)
    }
}
