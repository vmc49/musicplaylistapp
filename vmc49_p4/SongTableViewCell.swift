//
//  SongTableViewCell.swift
//  vmc49_p4
//
//  Created by Victor Chen on 3/22/19.
//  Copyright © 2019 Victor Chen. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {

    var songImageView: UIImageView!
    var nameLabel: UILabel!
    var artistLabel: UILabel!
    var albumLabel: UILabel!
    
    let space: CGFloat = 8
    let labelHeight: CGFloat = 32
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        songImageView = UIImageView()
        songImageView.translatesAutoresizingMaskIntoConstraints = false
        songImageView.contentMode = .scaleAspectFit
        contentView.addSubview(songImageView)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 21)
        contentView.addSubview(nameLabel)
        
        artistLabel = UILabel()
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.font = UIFont.systemFont(ofSize: 18)
        artistLabel.textColor = .gray
        contentView.addSubview(artistLabel)
        
        albumLabel = UILabel()
        albumLabel.translatesAutoresizingMaskIntoConstraints = false
        albumLabel.font = UIFont.systemFont(ofSize: 18)
        contentView.addSubview(albumLabel)
        
        setUpConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            songImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            songImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            songImageView.widthAnchor.constraint(equalTo: contentView.heightAnchor),
            songImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor)
            ])
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: songImageView.trailingAnchor, constant: space),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: space),
            nameLabel.heightAnchor.constraint(equalToConstant: labelHeight)
            ])
        
        NSLayoutConstraint.activate([
            artistLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            artistLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            artistLabel.heightAnchor.constraint(equalTo: nameLabel.heightAnchor)
            ])
        
        NSLayoutConstraint.activate([
            albumLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -1*space),
            albumLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: space),
            albumLabel.heightAnchor.constraint(equalToConstant: labelHeight)
            ])
    }
    
    func configure(for song: Song) {
        songImageView.image = song.image
        nameLabel.text = song.name
        artistLabel.text = "by \(song.artist)"
        albumLabel.text = "from \(song.album)"
    }
}
