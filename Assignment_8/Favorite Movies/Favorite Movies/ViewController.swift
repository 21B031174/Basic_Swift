
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var favoriteMovies: [Movie] = []
    var selectedMovie: Movie?
    
    @IBOutlet var mainTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        mainTableView.reloadData()
        super.viewWillAppear(animated)
        if favoriteMovies.count == 0 {
            favoriteMovies.append(Movie(id: "1", title: "Sheker", year: "2024", imageUrl: "https://static.kinoafisha.info/k/series_posters/1080x1920/upload/series/posters/8/7/3/8378/937582711688651723.jpg", desc: "The main character, a young and ambitious guy named Alik, finds himself in a difficult situation. He ends up in jail on charges of drug distribution, a crime that put his future in jeopardy. Everything he had is now hanging in the balance: fate, career, relationships with loved ones, and even freedom itself."))
            
            favoriteMovies.append(Movie(id: "2", title: "Breaking bad", year: "2008", imageUrl: "https://avatars.mds.yandex.net/get-kinopoisk-image/1900788/fb35416f-3b0d-4b96-bc65-cf6923f9e329/220x330", desc: "Breaking Bad is an American television crime drama, the premiere episodes of which were broadcast from January 20, 2008 to September 29, 2013 on the AMC cable channel. Over the course of five seasons, consisting of 62 episodes, the story of Walter White (Bryan Cranston), a schoolteacher who was diagnosed with inoperable lung cancer and who, along with his former student Jesse Pinkman (Aaron Paul), begins to produce and sell methamphetamine to ensure the financial future of his family, is shown. The series was set and filmed in Albuquerque, New Mexico."))
            
            favoriteMovies.append(Movie(id: "3", title: "Avatar", year: "2009", imageUrl: "https://avatars.dzeninfra.ru/get-zen_doc/5234612/pub_639af5b032b4045b940757c3_639af791ab35ed6281892839/scale_1200", desc: "The franchise of Canadian filmmaker James Cameron and a planned series of science fiction films created by Lightstorm Entertainment and distributed by 20th Century Studios, as well as related computer games and theme parks."))
            
            favoriteMovies.append(Movie(id: "4", title: "Марсианин", year: "2015", imageUrl: "https://static.kinoafisha.info/k/movie_posters/1920x1080/upload/movie_posters/4/7/6/8167674/1fd9ea38f175567982c7829237923aa3.jpg", desc: "The Ares-3 Martian mission was forced to leave the planet urgently in the process due to an impending sandstorm. Engineer and biologist Mark Whitney suffered damage to his spacesuit during a sandstorm. The mission staff, considering him dead, evacuated the planet, leaving Mark alone. When Whitney wakes up, she discovers that there is no connection to Earth, but the residential module is fully functioning. The main character begins to look for a way to survive on the available supplies of food, vitamins, water and air for another 4 years before the arrival of the next Ares-4 mission."))
            
            favoriteMovies.append(Movie(id: "5", title: "Titanic", year: "1997", imageUrl: "https://avatars.mds.yandex.net/get-kinopoisk-image/1773646/9ef93477-736c-4b5f-9cc8-3a602316efbd/orig", desc: "In the first and last voyage of the gorgeous Titanic, two people meet. Jack, a passenger on the lower deck, has won a card ticket, and the rich heiress Rosa is going to America to get married by calculation. The feelings of young people only have time to blossom, and not even class differences will create trials for lovers, but an iceberg that stood in the way of a ship that was considered unsinkable."))
            
            favoriteMovies.append(Movie(id: "6", title: "Parker", year: "2013", imageUrl: "https://i.pinimg.com/736x/c2/a8/9f/c2a89f9cef9791e30cd9d634b5d818bf.jpg", desc: "The main character is a professional thief, guided by his own moral code, but able to easily kill anyone who crosses his path."))
            
            favoriteMovies.append(Movie(id: "7", title: "The aviator ", year: "2004", imageUrl: "https://cdn1.ozone.ru/s3/multimedia-a/6146119978.jpg", desc: "After receiving a small factory from his father, Howard Hughes turned it into a gigantic, fantastically profitable enterprise. Becoming the owner of a huge film company, he shot the most expensive film for his time and won the hearts of the most charming Hollywood actresses. He owned the most prestigious casinos in Las Vegas and set a record for high-speed flights, acquired the second largest commercial airline…"))
            
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let moviecell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as! CustomTableViewCell
        
        let idx: Int = indexPath.row
        moviecell.tag = idx
        //title
        moviecell.movieTitle?.text = favoriteMovies[idx].title
        //year
        moviecell.movieYear?.text = favoriteMovies[idx].year
        // image
        displayMovieImage(idx, moviecell: moviecell)
        
        return moviecell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMovie = favoriteMovies[indexPath.row]
    }
    
    func displayMovieImage(_ row: Int, moviecell: CustomTableViewCell) {
        let url: String = (URL(string: favoriteMovies[row].imageUrl)?.absoluteString)!
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error!)
                return
            }
            
            DispatchQueue.main.async(execute: {
                let image = UIImage(data: data!)
                moviecell.movieImageView?.image = image
            })
        }).resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "movieDetailSegue" {
            let controller = segue.destination as! DetailViewController
            let cell = sender as! CustomTableViewCell
            controller.movie = favoriteMovies[cell.tag]
        }
    }
}

