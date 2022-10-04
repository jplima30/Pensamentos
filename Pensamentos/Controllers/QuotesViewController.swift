import UIKit

class QuotesViewController: UIViewController {
    
    @IBOutlet weak var imageViewPhoto: UIImageView!
    @IBOutlet weak var imageViewPhotoBackground: UIImageView!
    @IBOutlet weak var labelQuote: UILabel!
    @IBOutlet weak var labelAuthor: UILabel!
    @IBOutlet weak var layoutConstraintTop: NSLayoutConstraint!
    
    let quotesManager = Quotesmanager()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareQuote()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        prepareQuote()
    }
    
    func prepareQuote() { //preparar os pensamentos para serem mostrados
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 8.0, repeats: true, block: { timer in
            self.showRandomQuote()
        })
        showRandomQuote()   //exibe os pensamentos aleatórios
    }
    
    func showRandomQuote() {
        let quote = quotesManager.getRandomQuote()
        labelQuote.text = quote.quote
        labelAuthor.text = quote.author
        imageViewPhoto.image = UIImage(named: quote.image)
        imageViewPhotoBackground.image = imageViewPhoto.image
        
        
        labelQuote.alpha = 0.0
        labelAuthor.alpha = 0.0
        imageViewPhoto.alpha = 0.0
        imageViewPhotoBackground.alpha = 0.0
        layoutConstraintTop.constant = 50
        view.layoutIfNeeded() //atualiza todas as views
        
        UIView.animate(withDuration: 2.5) {
            self.labelQuote.alpha = 1.0
            self.labelAuthor.alpha = 1.0
            self.imageViewPhoto.alpha = 1.0
            self.imageViewPhotoBackground.alpha = 0.25
            self.layoutConstraintTop.constant = 10
            self.view.layoutIfNeeded()
        }
    }
    
}
