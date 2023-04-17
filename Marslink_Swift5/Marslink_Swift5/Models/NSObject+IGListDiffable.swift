//
//  NSObject+IGListDiffable.swift
//  Marslink_Swift5
//
//  Created by liuruixuan on 2023/4/17.
//

import Foundation
import IGListDiffKit

extension NSObject: ListDiffable {
    public func diffIdentifier() -> NSObjectProtocol {
        return self
    }

    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return isEqual(object)
    }
}
