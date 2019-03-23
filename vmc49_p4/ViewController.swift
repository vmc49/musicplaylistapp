//
//  ViewController.swift
//  vmc49_p4
//
//  Created by Victor Chen on 3/21/19.
//  Copyright © 2019 Victor Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView: UITableView!
    var songs: [Song]!
    var bills: [String]!
    
    let reuseIdentifier = "cellReuse"
    let cellHeight: CGFloat = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "Playlist"
        
        var bills = [String]()
        
        var chars = Array("billll")
        let len = Int(pow(Double(chars.count), 2.0))
        
        for i in 0..<len {
            var word = [Character]()
            for j in 0..<chars.count {
                let isBitSet = (i >> j & 1) != 0
                word.append(isBitSet ? Character(String(chars[j]).uppercased()): chars[j])
            }
            let combo = String(word)
            bills.append(combo)
        }
        
        songs = [Song]()
        for k in 0...9 {
            let thisname = bills[3*k]
            let thisartist = bills[3*k+1]
            let thisalbum = bills[3*k+2]
            let song = Song(image: UIImage(named: "billgates")!, name: thisname, artist: thisartist, album: thisalbum)
            songs.append(song)
        }
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SongTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SongTableViewCell
        let song = songs[indexPath.row]
        cell.configure(for: song)
        cell.selectionStyle = .none
        return cell
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let editedSong = songs[indexPath.row]
        let detailsController = SongDetailsViewController(song: editedSong, index: indexPath.row)
        detailsController.delegate = self
        navigationController?.pushViewController(detailsController, animated: true)
    }
    
}

protocol ChangeDetailsDelegate: class {
    func nameChanged(to newName: String, index: Int)
    func artistChanged(to newArtist: String, index: Int)
    func albumChanged(to newAlbum: String, index: Int)
}

extension ViewController: ChangeDetailsDelegate {
    
    func nameChanged(to newName: String, index: Int) {
        songs[index].name = newName
        tableView.reloadData()
    }
    
    func artistChanged(to newArtist: String, index: Int) {
        songs[index].artist = newArtist
        tableView.reloadData()
    }
    
    func albumChanged(to newAlbum: String, index: Int) {
        songs[index].album = newAlbum
        tableView.reloadData()
    }
    
}
