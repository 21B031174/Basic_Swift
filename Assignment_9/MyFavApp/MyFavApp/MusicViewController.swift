//
//  MusicViewController.swift
//  MyFavApp
//
//  Created by Елшан Арсен on 15.11.2024.
//

import UIKit

class MusicViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var musics: [MusicsStruct] = [
        MusicsStruct(
            title: "Bohemian Rhapsody",
            artist: "Queen",
            coverImage: UIImage(named: "bohemian_rhapsody")!,
            description: "An iconic and genre-defying rock anthem by Queen."
        ),
        MusicsStruct(
            title: "Billie Jean",
            artist: "Michael Jackson",
            coverImage: UIImage(named: "billie_jean")!,
            description: "A groundbreaking pop song that showcases Michael Jackson's artistry."
        ),
        MusicsStruct(
            title: "Stairway to Heaven",
            artist: "Led Zeppelin",
            coverImage: UIImage(named: "stairway_to_heaven")!,
            description: "A legendary rock ballad with haunting melodies and powerful lyrics."
        ),
        MusicsStruct(
            title: "Imagine",
            artist: "John Lennon",
            coverImage: UIImage(named: "imagine")!,
            description: "A timeless song of peace and hope by John Lennon."
        ),
        MusicsStruct(
            title: "Hotel California",
            artist: "Eagles",
            coverImage: UIImage(named: "hotel_california")!,
            description: "A haunting rock classic about life's mysteries and choices."
        )
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetail" {
            if let detailVC = segue.destination as? DitailViewController,
               let selectedItem = sender as? StructProtocol {
                detailVC.configure(with: selectedItem)
            }
        }
    }

}
extension MusicViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musics.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as! MyAppTableViewCell
        let item = musics[indexPath.row]
        cell.configure(with: item)
        return cell
    }
}

extension MusicViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = musics[indexPath.row]
        performSegue(withIdentifier: "goToDetail", sender: selectedItem)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

