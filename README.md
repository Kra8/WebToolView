# WebToolView
UIWebViewにつかえそうなシンプルなツールバー

# Sample
``` Swift
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let toolView = WebToolView()
        toolView.delegate = self
        toolView.frame = CGRect(x: 0.0, y: 40.0, width: UIScreen.main.bounds.width, height: 0.0)
        toolView.setPreviousButtonImage(UIImage(named: "prev.png")!, for: .normal)
        toolView.setNextButtonImage(UIImage(named: "next.png")!, for: .normal)
        toolView.setHomeButtonImage(UIImage(named: "home.png")!, for: .normal)
        toolView.setCloseButtonImage(UIImage(named: "close.png")!, for: .normal)
        
        toolView.backgroundColor = UIColor(red: 228.0/255.0, green: 228.0/255.0, blue: 228.0/255.0, alpha: 0.9)
        self.view.addSubview(toolView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController : WebToolViewDelegate {
    func selectedToolButton(type: WebToolButtonType) {
        // 
    }
}
```
![Sample](https://github.com/Kra8/WebToolView/blob/master/data/ss.png)