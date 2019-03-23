//
//  SongDetailsViewController.swift
//  vmc49_p4
//
//  Created by Victor Chen on 3/23/19.
//  Copyright © 2019 Victor Chen. All rights reserved.
//

import UIKit

class SongDetailsViewController: UIViewController {

    var song: Song
    var nameLabel: UILabel!
    var nameTextField: UITextField!
    var artistLabel: UILabel!
    var artistTextField: UITextField!
    var albumLabel: UILabel!
    var albumTextField: UITextField!
    weak var delegate: ChangeDetailsDelegate?
    
    let space: CGFloat = 24
    let index: Int
    let borderWidth: CGFloat = 1
    let cornerRadius: CGFloat = 5
    
    init(song: Song, index: Int) {
        self.song = song
        self.index = index
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "Song Details"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveButtonPressed))
        // Do any additional setup after loading the view.
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Song name: "
        nameLabel.font = UIFont.systemFont(ofSize: 18)
        nameLabel.textAlignment = .right
        view.addSubview(nameLabel)
        
        nameTextField = UITextField()
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.text = song.name
        nameTextField.textColor = .black
        nameTextField.font = UIFont.systemFont(ofSize: 18)
        nameTextField.clearsOnBeginEditing = true
        nameTextField.layer.borderColor = UIColor.gray.cgColor
        nameTextField.layer.borderWidth = borderWidth
        nameTextField.layer.cornerRadius = cornerRadius
        view.addSubview(nameTextField)
        
        artistLabel = UILabel()
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.text = "Artist: "
        artistLabel.font = UIFont.systemFont(ofSize: 18)
        artistLabel.textAlignment = .right
        view.addSubview(artistLabel)
        
        artistTextField = UITextField()
        artistTextField.translatesAutoresizingMaskIntoConstraints = false
        artistTextField.text = song.artist
        artistTextField.textColor = .black
        artistTextField.font = UIFont.systemFont(ofSize: 18)
        artistTextField.clearsOnBeginEditing = true
        artistTextField.layer.borderColor = UIColor.gray.cgColor
        artistTextField.layer.borderWidth = borderWidth
        artistTextField.layer.cornerRadius = cornerRadius
        view.addSubview(artistTextField)
        
        albumLabel = UILabel()
        albumLabel.translatesAutoresizingMaskIntoConstraints = false
        albumLabel.text = "Album: "
        albumLabel.font = UIFont.systemFont(ofSize: 18)
        albumLabel.textAlignment = .right
        view.addSubview(albumLabel)
        
        albumTextField = UITextField()
        albumTextField.translatesAutoresizingMaskIntoConstraints = false
        albumTextField.text = song.album
        albumTextField.textColor = .black
        albumTextField.font = UIFont.systemFont(ofSize: 18)
        albumTextField.clearsOnBeginEditing = true
        albumTextField.layer.borderColor = UIColor.gray.cgColor
        albumTextField.layer.borderWidth = borderWidth
        albumTextField.layer.cornerRadius = cornerRadius
        view.addSubview(albumTextField)
        
        setUpConstraints()
    }
    
    @objc func saveButtonPressed() {
        if let newName = nameTextField.text, newName != "" {
            delegate?.nameChanged(to: newName, index: index)
        }
        if let newArtist = artistTextField.text, newArtist != "" {
            delegate?.artistChanged(to: newArtist, index: index)
        }
        if let newAlbum = albumTextField.text, newAlbum != "" {
            delegate?.albumChanged(to: newAlbum, index: index)
        }
        navigationController?.popViewController(animated: true)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: space),
            nameLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -space)
            ])
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: nameLabel.topAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: space),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -space)
            ])
        
        NSLayoutConstraint.activate([
            artistLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: space),
            artistLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -space)
            ])
        
        NSLayoutConstraint.activate([
            artistTextField.topAnchor.constraint(equalTo: artistLabel.topAnchor),
            artistTextField.leadingAnchor.constraint(equalTo: artistLabel.trailingAnchor, constant: space),
            artistTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -space)
            ])
        
        NSLayoutConstraint.activate([
            albumLabel.topAnchor.constraint(equalTo: artistTextField.bottomAnchor, constant: space),
            albumLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -space)
            ])
        
        NSLayoutConstraint.activate([
            albumTextField.topAnchor.constraint(equalTo: albumLabel.topAnchor),
            albumTextField.leadingAnchor.constraint(equalTo: albumLabel.trailingAnchor, constant: space),
            albumTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -space)
            ])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
