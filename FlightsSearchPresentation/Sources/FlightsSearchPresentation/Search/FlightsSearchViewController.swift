import MyFlightsSearchEngine
import UIKit

public protocol FlightsSearchViewControllerDelegate {
    func viewDidLoad()
    
    func didSelect(flightWithId flightId: String)
}

public class FlightsSearchViewController: UIViewController {
    private let tableView = UITableView()
    private var flights = [FlightSearchViewModel.Flight]()
    private let delegate: FlightsSearchViewControllerDelegate
    
    public init(delegate: FlightsSearchViewControllerDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        delegate.viewDidLoad()
        tableView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(tableView)
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            .init(item: tableView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0),
            .init(item: tableView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0),
            .init(item: tableView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0),
            .init(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0),
        ])
    }
}

extension FlightsSearchViewController: FlightsSearchView {
    public func show(flights: FlightSearchViewModel) {
        self.flights = flights.results
        tableView.reloadData()
    }
}

extension FlightsSearchViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didSelect(flightWithId: flights[indexPath.row].id)
    }
}

extension FlightsSearchViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        flights.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil) // for simplicity
        let flight = flights[indexPath.row]
        cell.textLabel?.text = flight.name
        cell.detailTextLabel?.text = flight.duration
        return cell
    }
}
