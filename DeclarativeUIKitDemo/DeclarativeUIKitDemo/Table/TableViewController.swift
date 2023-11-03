import UIKit

final class TableViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        
        self.view.backgroundColor = .white
        
        self.declarative {
            UITableView()
                .delegate(self)
                .dataSource(self)
                .registerCellClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
                .registerViewClass(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "Header")
                .registerViewClass(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "Footer")
        }
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select \(indexPath)")
    }
}

extension TableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.contentView.backgroundColor = indexPath.item%2 == 0 ? UIColor.systemRed : UIColor.systemBlue
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header")!
        view.contentView.backgroundColor = .systemGray
        return view
    }
    

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Footer")!
        view.contentView.backgroundColor = .systemOrange
        return view
    }
}

import SwiftUI

#Preview {
    TableViewController()
}
