//
//  ViewController.swift
//  ResponderChainTest
//
//  Created by doremin on 2022/12/05.
//

import UIKit

import SnapKit

class BaseView: UIView {
  
  var title: String?
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("\(self.title ?? "") touches began")
    
    super.touchesBegan(touches, with: event)
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("\(self.title ?? "") touches ended")
    
    super.touchesEnded(touches, with: event)
  }
  
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("\(self.title ?? "") touches cancelled")
    
    super.touchesCancelled(touches, with: event)
  }
  
  override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    print("\(self.title ?? "") hitTest")
    return super.hitTest(point, with: event)

  }

  override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
    print("\(self.title ?? "") point")

    return super.point(inside: point, with: event)
  }
}

class ViewController: UIViewController {
  
  let red: BaseView = {
    let view = BaseView()
    view.backgroundColor = .red
    view.title = "red"
    
    return view
  }()
  
  let yellow: BaseView = {
    let view = BaseView()
    view.backgroundColor = .yellow
    view.title = "yellow"
    
    return view
  }()
  
  let green: BaseView = {
    let view = BaseView()
    view.backgroundColor = .green
    view.title = "green"
    
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.addSubview(red)
    self.red.addSubview(yellow)
    self.yellow.addSubview(green)
    
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.redTapped))
    
    // MARK: touch가 cancel되지 않게 하려면 밑에 주석을 해제!
    tapGesture.cancelsTouchesInView = false
    tapGesture.delaysTouchesEnded = false
    self.red.addGestureRecognizer(tapGesture)
    
    
    
    self.red.snp.makeConstraints { make in
      make.center.equalToSuperview()
      make.size.equalTo(200)
    }
    
    self.yellow.snp.makeConstraints { make in
      make.center.equalToSuperview()
      make.size.equalTo(150)
    }
    
    self.green.snp.makeConstraints { make in
      make.center.equalToSuperview()
      make.size.equalTo(100)
    }
  }
  
  @objc
  func redTapped() {
    print("red tap!")
  }

}
