//  ViewController.swift
import UIKit
import Combine

class ViewController: UIViewController {
    @IBOutlet var usrIDTextField: UITextField!
    @IBOutlet var usrPasswordTextField: UITextField!
    @IBOutlet var loginBtn: UIButton!
    
    var viewModel: LoginViewModel!
    
    var subscribtion = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewModel = LoginViewModel()    //viewModel 생성
        
        //MARK: usrIDTextField subsribe
        usrIDTextField.publisher
            .receive(on: RunLoop.main)
            .assign(to: \.usrIDInput, on: viewModel)
            .store(in: &subscribtion)
        
        //MARK: usrPasswordTextField subscribe
        usrPasswordTextField.publisher
            .receive(on: RunLoop.main)
            .assign(to: \.usrPasswordInput, on: viewModel)
            .store(in: &subscribtion)
        
        //MARK: isFilled subscribe
        viewModel.isFilled
            .receive(on: RunLoop.main)
            .assign(to: \.isEnabled, on: loginBtn)
            .store(in: &subscribtion)
    }
}

extension UITextField {
    var publisher: AnyPublisher<String, Never> {
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self)
            //NotificationCenter로 들어온 notification의 optional 타입 object 프로퍼티를 UITextField로 타입 캐스팅
            .compactMap{ $0.object as? UITextField}
            //text 프로퍼티만 가져오기
            .map{ $0.text ?? "" }    //값이 없는 경우 빈 문자열 반환
            .print()
            .eraseToAnyPublisher()
    }
}
