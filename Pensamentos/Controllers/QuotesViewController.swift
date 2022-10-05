import UIKit

class QuotesViewController: UIViewController {
    
    @IBOutlet weak var imageViewPhoto: UIImageView!
    @IBOutlet weak var imageViewPhotoBackground: UIImageView!
    @IBOutlet weak var labelQuote: UILabel!
    @IBOutlet weak var labelAuthor: UILabel!
    @IBOutlet weak var layoutConstraintTop: NSLayoutConstraint!
    
    let config = Configuration.shared
    
    let quotesManager = Quotesmanager()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formatView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        prepareQuote()
    }
    
    func formatView(){
        view.backgroundColor = config.colorScheme == 0 ? .white : UIColor(red: 156.0/255.0, green: 68.0/255.0, blue: 15.0/255, alpha: 1.0)
        labelQuote.textColor = config.colorScheme == 0 ? .black : .white
        labelAuthor.textColor = config.colorScheme == 0 ? UIColor(red: 192.0/255.0, green: 96.0/255.0, blue: 49.0/255, alpha: 1.0) : .yellow
        prepareQuote()
    }
    
    func prepareQuote() { //preparar os pensamentos para serem mostrados
        timer?.invalidate()
        if config.autorefresh {
            timer = Timer.scheduledTimer(withTimeInterval: 8.0, repeats: true) { (timer) in
                self.showRandomQuote()
            }
        }
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
