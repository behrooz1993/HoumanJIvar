import UIKit
import RxSwift
import Kingfisher
import MediaPlayer

class MultiMediaCollectionViewCell: UICollectionViewCell {
 
    var playerView:PlayerViewClass!
    var imageView:UIImageView!
    var playImageView:UIImageView!
    var isPlaying = false
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(contentViewPressed(_:))))
    }
    
    func loadUrl(url:String?) {
        if url == nil {
            self.showImageView()
        }else {
            self.showVideo(url: url!)
        }
    }
    
    private func showVideo(url:String) {
        self.playerView = PlayerViewClass()
        let player = AVPlayer(url: URL(string: url)!)
        player.automaticallyWaitsToMinimizeStalling = false
        self.playerView.playerLayer.player = player
        self.contentView.addSubview(self.playerView)
        self.playerView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.contentView)
        }
        
        self.playImageView = UIImageView(image: UIImage(named: "PlayIcon"))
        self.contentView.addSubview(self.playImageView)
        self.playImageView.snp.makeConstraints { (make) in
            make.width.equalTo(25)
            make.height.equalTo(25)
            make.center.equalTo(self.contentView.center)
        }
    }
    
    private func showImageView() {
        self.imageView = UIImageView(frame: self.contentView.frame)
        let url = URL(string: "http://www.jbhwheelchair.com/wp-content/uploads/2016/05/novideo.png")!
        self.imageView.kf.setImage(with: url)
        self.contentView.addSubview(self.imageView)
    }
    
    @objc func contentViewPressed(_ sender:UITapGestureRecognizer) {
        if self.isPlaying {
            self.playerView.playerLayer.player?.pause()
            self.playImageView.isHidden = false
            self.isPlaying = false
        }else {
            self.playerView.playerLayer.player?.play()
            self.playImageView.isHidden = true
            self.isPlaying = true
        }
    }
}
