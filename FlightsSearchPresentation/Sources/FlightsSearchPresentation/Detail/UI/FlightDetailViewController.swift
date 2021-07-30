import UIKit
import MyFlightsSearchEngine

public protocol FlightDetailViewControllerDelegate {
    func viewDidLoad(withId id: String)
}

public class FlightDetailViewController: UIViewController {
    private let flightId: String
    private let delegate: FlightDetailViewControllerDelegate
    
    let contentLabel = UILabel()
    let detailLabel = UILabel()
    
    public init(flightId: String, delegate: FlightDetailViewControllerDelegate) {
        self.delegate = delegate
        self.flightId = flightId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        delegate.viewDidLoad(withId: flightId)
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentLabel)
        view.addSubview(detailLabel)
        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: contentLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 40),
            NSLayoutConstraint(item: contentLabel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 40),
            NSLayoutConstraint(item: contentLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 40),
            
            NSLayoutConstraint(item: detailLabel, attribute: .top, relatedBy: .equal, toItem: contentLabel, attribute: .bottom, multiplier: 1, constant: 16),
            NSLayoutConstraint(item: detailLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 40),
            NSLayoutConstraint(item: detailLabel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 40)
        ])
        
        detailLabel.textColor = .gray
        contentLabel.textColor = .black
    }
}

extension FlightDetailViewController: FlightsDetailView {
    public func show(flight: FlightDetailViewModel) {
        contentLabel.text = flight.name
        detailLabel.text = flight.duration
    }
    
    public func showErrorMessage(_ message: String) {
        contentLabel.text = message
        detailLabel.text = "Try again"
    }
}
