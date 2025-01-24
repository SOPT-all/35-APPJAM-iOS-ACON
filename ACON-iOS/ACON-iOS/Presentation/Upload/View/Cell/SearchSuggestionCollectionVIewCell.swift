//
//  SearchSuggestionCollectionVIewCell.swift
//  ACON-iOS
//
//  Created by 이수민 on 1/24/25.
//

import UIKit

import SnapKit
import Then

final class SearchSuggestionCollectionViewCell: BaseCollectionViewCell {

    // MARK: - UI Properties
    
    var spotSuggestionButton: UIButton = UIButton()

    private let spotSuggestionButtonConfiguration: UIButton.Configuration = {
        var configuration = UIButton.Configuration.plain()
        configuration.titleAlignment = .center
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 4,
                                                              leading: 12,
                                                              bottom: 4,
                                                              trailing: 12)
        return configuration
    }()
    
    
    // MARK: - Lifecycle
    
    override func setHierarchy() {
        super.setHierarchy()
        
        self.addSubviews(spotSuggestionButton)
    }
    
    override func setLayout() {
        super.setLayout()
        
        spotSuggestionButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    override func setStyle() {
        super.setStyle()
        
        self.backgroundColor = .clear
        
        spotSuggestionButton.do {
            $0.backgroundColor = .gray8
            $0.layer.cornerRadius = 14
            $0.configuration = spotSuggestionButtonConfiguration
            $0.titleLabel?.numberOfLines = 1
            $0.setContentHuggingPriority(.required, for: .horizontal)
            $0.setContentCompressionResistancePriority(.required, for: .horizontal)
        }
    }
    
}

extension SearchSuggestionCollectionViewCell {

    func bindData(_ data: SearchSuggestionModel, _ indexRow: Int) {
        spotSuggestionButton.do {
            $0.setAttributedTitle(text: data.spotName,
                                  style: .b2,
                                  color: .acWhite)
            $0.spotID = data.spotId
        }
    }
    
}
