//
//  SentMemesCollectionViewController.swift
//  Memevers2.0
//
//  Created by Victor Lucio on 12/10/21.
//
import Foundation
import UIKit



class SentMemesCollectionViewController: UICollectionViewController {
    
    var memes: [Meme]!{
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let space: CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
        //        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appDelegate.memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        let meme = appDelegate.memes[(indexPath as NSIndexPath).row]
        cell.memeImageView.image = meme.memedImage
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let memeViewController = storyboard?.instantiateViewController(withIdentifier: "CreateMemeViewController") as! ViewController
        
        memeViewController.oldTopText = memes[indexPath.row].topText
        memeViewController.oldBottomText = memes[indexPath.row].bottomText
        memeViewController.oldImage = memes[indexPath.row].originalImage
        
        present(memeViewController, animated: true, completion: nil)
    }
    
    @IBAction func onAddPress(_ sender: Any) {
        let memeViewController = storyboard?.instantiateViewController(withIdentifier: "CreateMemeViewController") as! ViewController
        
        memeViewController.onDisappear = collectionView.reloadData
        
        present(memeViewController, animated: true, completion: nil)
    }
}
