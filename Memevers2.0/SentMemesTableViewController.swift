//
//  SentMemesTableViewController.swift
//  Memevers2.0
//
//  Created by Victor Lucio on 12/10/21.
//

import UIKit

class SentMemesTableViewController: UITableViewController {
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return memes.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellReuse = "cellReuse"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuse, for: indexPath)
        cell.imageView?.image = memes[ indexPath.row ].memedImage
        cell.textLabel?.text = memes[indexPath.row].topText
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let memeViewController = storyboard?.instantiateViewController(withIdentifier: "CreateMemeViewController") as! ViewController
        
        memeViewController.oldTopText = memes[indexPath.row].topText
        memeViewController.oldBottomText = memes[indexPath.row].bottomText
        memeViewController.oldImage = memes[indexPath.row].originalImage
        
        present(memeViewController, animated: true, completion: nil)
    }
    
    @IBAction func onAddPress(_ sender: Any) {
        let memeViewController = storyboard?.instantiateViewController(withIdentifier: "CreateMemeViewController") as! ViewController
        
        memeViewController.onDisappear = tableView.reloadData
        
        present(memeViewController, animated: true, completion: nil)
    }
    
    
}
