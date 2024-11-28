//
//  DitailViewController.swift
//  MyFavApp
//
//  Created by Елшан Арсен on 15.11.2024.
//

import UIKit

class DitailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var firstDescriptionLabel: UILabel!
    
    private var item: StructProtocol?
    
    func configure(with item: StructProtocol) {
        self.item = item
    }
    
    private func updateUI() {
        guard let item = item else {
            print("No item provided")
            return
        }

        titleLabel.text = item.title
        descriptionLabel.text = item.description
        coverImageView.image = item.coverImage
        if let book = item as? BooksStruct {
                    firstDescriptionLabel.text = "Author: \(book.author), Genre: \(book.genre)"
                } else if let music = item as? MusicsStruct {
                    firstDescriptionLabel.text = "Artist: \(music.artist)"
                } else if let film = item as? FilmsStruct {
                    firstDescriptionLabel.text = "Year: \(film.year), Genre: \(film.genre)"
                }
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
