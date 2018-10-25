import UIKit
import RxSwift
import Kingfisher
import MediaPlayer

class MultiMediaCollectionViewCell: UICollectionViewCell {
 
//    var playerLayer:AVPlayerLayer!
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
        if self.imageView != nil {
            self.imageView.isHidden = true
        }
        
        self.playerView = PlayerViewClass()
        let player = AVPlayer(url: URL(string: url)!)
        player.automaticallyWaitsToMinimizeStalling = false
        self.playerView.playerLayer.player = player
        self.contentView.addSubview(self.playerView)
        self.playerView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.contentView)
        }
//        self.playerView.player?.play()
        
//
//        self.playerLayer = AVPlayerLayer(player: player)
//        playerLayer.frame = self.contentView.frame
//        self.contentView.layer.addSublayer(playerLayer)
        
//        player.addObserver(self, forKeyPath: "status", options:NSKeyValueObservingOptions(), context: nil)
//        player.addObserver(self, forKeyPath: "playbackBufferEmpty", options:NSKeyValueObservingOptions(), context: nil)
//        player.addObserver(self, forKeyPath: "playbackLikelyToKeepUp", options:NSKeyValueObservingOptions(), context: nil)
//        player.addObserver(self, forKeyPath: "loadedTimeRanges", options: NSKeyValueObservingOptions(), context: nil)
    }
    
    private func showImageView() {
//        if self.playerLayer != nil {
//            self.playerLayer.removeFromSuperlayer()
//        }
        self.imageView = UIImageView(frame: self.contentView.frame)
        let url = URL(string: "http://www.jbhwheelchair.com/wp-content/uploads/2016/05/novideo.png")!
        self.imageView.kf.setImage(with: url)
        self.contentView.addSubview(self.imageView)
    }
    
//    override  func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        if keyPath == "status" {
//            let status = self.playerLayer.player?.status
//            if status == AVPlayerStatus.unknown {
//                let x = ""
//            }else if status == AVPlayerStatus.readyToPlay {
//                let x = ""
//            }else if status == AVPlayerStatus.failed {
//                let x = ""
//            }
//        }
//    }
    
    @objc func contentViewPressed(_ sender:UITapGestureRecognizer) {
        if self.isPlaying {
            self.playerView.playerLayer.player?.pause()
            self.isPlaying = false
        }else {
            self.playerView.playerLayer.player?.play()
            self.isPlaying = true
        }
    }
}
