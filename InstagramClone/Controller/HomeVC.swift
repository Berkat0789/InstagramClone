//
//  HomeVC.swift
//  InstagramClone
//
//  Created by berkat bhatti on 1/15/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage


class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
//--Outlets
    @IBOutlet weak var tableView: UITableView!
//--Arrays and Variables
    var PostList = [Post]()
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 500
        tableView.rowHeight = UITableViewAutomaticDimension
    }//--End view did load
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        DataService.instance.DB_REFERENCE_posts.observeSingleEvent(of: .value) { (postSnapshop) in
            DataService.instance.getAllPosts { (Posts) in
                self.PostList = Posts.reversed()
                self.tableView.reloadData()
            }
        }//end get all post and observe
    }//end view will appear
//--Actions
    @IBAction func commentPressed(_ sender: Any) {
        performSegue(withIdentifier: "toCommentView", sender: nil)
    }
    
//--Protocol Function
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PostList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? postCell else {return UITableViewCell()}
        let Post = PostList[indexPath.row]
        cell.post = Post
        return cell
    }
    
//--Actions
    
    @IBAction func LogoutPressed(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        }catch let error as NSError {
            print(error)
        }
        
        let storyboard = UIStoryboard(name: "Start", bundle: nil)
        let LoginVC = storyboard.instantiateViewController(withIdentifier: "LoginVC")
        present(LoginVC, animated: true, completion: nil)
        
    }//end logout pressed
    
}//End controller
