//
//  ExpandableTableViewHeader.swift
//  productivity hero
//
//  Created by Дарья on 12.11.2020.
//

import UIKit

protocol ExpandableTableViewHeaderDelegate {
    func toggleSection(header: ExpandableTableViewHeader, section: Int)
}

class ExpandableTableViewHeader: UITableViewHeaderFooterView {
    
    let titleLabel = UILabel()
    let arrowLabel = UILabel()
    var delegate: ExpandableTableViewHeaderDelegate?
    var section: Int = 1
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been emplemented")
    }
    
    fileprivate func configureContents() {
        
        contentView.backgroundColor = UIColor(red: 0.57, green: 0.69, blue: 0.89, alpha: 1.00)
        titleLabel.textColor = .white
        arrowLabel.textColor = .white
        titleLabel.font = .boldSystemFont(ofSize: 18)
        arrowLabel.font = .boldSystemFont(ofSize: 18)
        arrowLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(arrowLabel)
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            arrowLabel.heightAnchor.constraint(equalToConstant: 30),
           // arrowLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 50),
            arrowLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: 8),
            arrowLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 8),
            //titleLabel.trailingAnchor.constraint(equalTo: arrowLabel.leadingAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapHeader(gestureRecognizer:))))
    }
    
    func rotateArrow(expanded: Bool) {
        arrowLabel.rotate(to: expanded ? .pi / 2 : 0.0)
    }
    
    
    @objc func tapHeader(gestureRecognizer: UITapGestureRecognizer) {
        guard let cell = gestureRecognizer.view as? ExpandableTableViewHeader else {
            return
        }
        delegate?.toggleSection(header: self, section: cell.section)
    }

}

extension UIView {
    func rotate(to value: CGFloat, duration: CFTimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = value
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        
        self.layer.add(animation, forKey: nil)
    }
}
