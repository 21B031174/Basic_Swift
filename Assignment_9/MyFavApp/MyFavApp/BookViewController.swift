//
//  BookViewController.swift
//  MyFavApp
//
//  Created by Елшан Арсен on 15.11.2024.
//

import UIKit

class BookViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var books: [BooksStruct] = [
        BooksStruct(
            title: "To Kill a Mockingbird",
            author: "Harper Lee",
            genre: "Classic Fiction",
            coverImage: UIImage(named: "mockingbird")!,
            description: "A powerful novel about racial injustice in the American South, focusing on moral growth and the importance of compassion."
        ),
        BooksStruct(
            title: "1984",
            author: "George Orwell",
            genre: "Dystopian Fiction",
            coverImage: UIImage(named: "1984")!,
            description: "A dystopian story about a totalitarian regime, surveillance, and the fight for freedom and truth."
        ),
        BooksStruct(
            title: "Pride and Prejudice",
            author: "Jane Austen",
            genre: "Romantic Fiction",
            coverImage: UIImage(named: "pride_prejudice")!,
            description: "A classic tale of love, societal expectations, and personal growth in 19th century England."
        ),
        BooksStruct(
            title: "The Great Gatsby",
            author: "F. Scott Fitzgerald",
            genre: "Classic Fiction",
            coverImage: UIImage(named: "gatsby")!,
            description: "A story of the American Dream, love, and tragedy set in the roaring 1920s."
        ),
        BooksStruct(
            title: "The Catcher in the Rye",
            author: "J.D. Salinger",
            genre: "Modern Classic",
            coverImage: UIImage(named: "catcher_rye")!,
            description: "An iconic novel about teenage angst and alienation, narrated by the unforgettable Holden Caulfield."
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
extension BookViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as! MyAppTableViewCell
        let item = books[indexPath.row]
        cell.configure(with: item)
        return cell
    }
}

extension BookViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = books[indexPath.row]
        performSegue(withIdentifier: "goToDetail", sender: selectedItem)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
