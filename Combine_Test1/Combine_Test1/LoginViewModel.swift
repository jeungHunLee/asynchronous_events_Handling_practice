//LoginViewModel.swift
import Combine

class LoginViewModel {
    @Published var usrIDInput: String = ""
    @Published var usrPasswordInput: String = ""
    
    lazy var isFilled: AnyPublisher<Bool, Never> = Publishers.CombineLatest($usrIDInput, $usrPasswordInput)
        .map{
            if $0 == "" || $1 == "" {
                return false
            } else {
                return true
            }
        }
        .eraseToAnyPublisher()
}
