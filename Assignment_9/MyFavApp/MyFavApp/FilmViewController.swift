//
//  FilmViewController.swift
//  MyFavApp
//
//  Created by Елшан Арсен on 15.11.2024.
//

import UIKit

class FilmViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    private var films: [FilmsStruct] = [
        FilmsStruct(
            title: "Inception",
            year: "2010",
            genre: "Science Fiction",
            coverImage: UIImage(named: "inception")!,
            description: "A mind-bending thriller about dreams within dreams and a heist in the subconscious."
        ),
        FilmsStruct(
            title: "The Shawshank Redemption",
            year: "1994",
            genre: "Drama",
            coverImage: UIImage(named: "shawshank")!,
            description: "The story of hope and friendship within the walls of a prison."
        ),
        FilmsStruct(
            title: "The Godfather",
            year: "1972",
            genre: "Crime",
            coverImage: UIImage(named: "godfather")!,
            description: "A classic tale of power, family, and betrayal in the world of the mafia."
        ),
        FilmsStruct(
            title: "The Dark Knight",
            year: "2008",
            genre: "Action",
            coverImage: UIImage(named: "dark_knight")!,
            description: "A gripping story of Batman's battle against the Joker to save Gotham City."
        ),
        FilmsStruct(
            title: "Forrest Gump",
            year: "1994",
            genre: "Drama",
            coverImage: UIImage(named: "forrest_gump")!,
            description: "The inspiring story of a man with a low IQ who lives an extraordinary life."
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
extension FilmViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as! MyAppTableViewCell
        let item = films[indexPath.row]
        cell.configure(with: item)
        return cell
    }
}

extension FilmViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = films[indexPath.row]
        performSegue(withIdentifier: "goToDetail", sender: selectedItem)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
