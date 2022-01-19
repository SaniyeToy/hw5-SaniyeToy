//
//  ViewController.swift
//  UIComponents
//
//  Created by Semih Emre ÜNLÜ on 19.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textFieldContainerView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    @IBOutlet weak var datePicker: UIDatePicker!


    var myIntVariable = -1

    enum MyImages: String {
        case backgroundImage = "bgImage"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        print("myVariable =", myIntVariable)

        configureUI()

        datePicker.minimumDate = Date()

//        let image = UIImage(named: MyImages.backgroundImage.rawValue)
//        let myImageView = UIImageView(image: image)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageDoubleTapped(_:)))
        tapGesture.numberOfTapsRequired = 2
        tapGesture.numberOfTouchesRequired = 1
        self.scrollView.addGestureRecognizer(tapGesture)

        activityIndicator.startAnimating()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            print("activityIndicator animating: ", self.activityIndicator.isAnimating)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.activityIndicator.stopAnimating()
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
            print("activityIndicator animating: ", self.activityIndicator.isAnimating)
        }
    }

    @objc func imageDoubleTapped(_ sender: UITapGestureRecognizer) {
        let zoomScale = scrollView.zoomScale >= 3.0 ? 1.0 : 3.0
        scrollView.setZoomScale(zoomScale, animated: true)
    }

    func createPhoneTextFieldKeyboardToolbar() -> UIToolbar {
        let flexibleSpace = UIBarButtonItem.flexibleSpace()

        let doneBarButton = UIBarButtonItem()
        doneBarButton.target = self
        doneBarButton.action = #selector(doneBarButtonTapped(_:))
        doneBarButton.title = "Done"
        doneBarButton.style = .plain

        let toolbar = UIToolbar()
        toolbar.items = [flexibleSpace, doneBarButton]
        toolbar.sizeToFit()
        return toolbar
    }

    func configurePhoneTextField() {
        let toolbar = createPhoneTextFieldKeyboardToolbar()
        textField.inputAccessoryView = toolbar

//        let widthConstraint = NSLayoutConstraint(item: textField,
//                                                 attribute: .width,
//                                                 relatedBy: .equal,
//                                                 toItem: nil,
//                                                 attribute: .notAnAttribute,
//                                                 multiplier: 1.0,
//                                                 constant: 100)
//
//        let xConstraint = NSLayoutConstraint(item: textField,
//                                             attribute: .centerX,
//                                             relatedBy: .equal,
//                                             toItem: textFieldContainerView,
//                                             attribute: .centerX,
//                                             multiplier: 1.0,
//                                             constant: 0)
//
//        NSLayoutConstraint.activate([widthConstraint, xConstraint])
    }

    func configureScrollView() {
//        self.scrollView.contentSize = CGSize(width: 1000, height: 1000)
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 5.0

    }

    func configureUI() {
        configurePhoneTextField()
        configureScrollView()
    }

    @objc func doneBarButtonTapped(_ sender: UIBarButtonItem) {
        //firstTextField.resignFirstResponder()
        //textField.becomeFirstResponder()
        textField.resignFirstResponder()
    }



    @IBAction func textFieldEditingDidEnd(_ sender: UITextField) {

    }

    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        print("selectedIndex:", sender.selectedSegmentIndex)

    }

    @IBAction func datePıckerValueChanged(_ sender: UIDatePicker) {

        print("Date: ", sender.date) //"27<>12<>2021"  date.year
    }

}

// MARK: UIScrollView Delegate
extension ViewController: UIScrollViewDelegate {

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("scrollView will Dragging")
    }

    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        print("scrollView will Decelerating")
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("scrollView didScroll y position:", scrollView.contentOffset.y)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        print("scrollView Decelerating")
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        guard !decelerate else { return }

//        print("scrollView Dragging")
    }

    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        print("scrollViewDidZoom")
    }

    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        print("scrollViewWillBeginZooming")
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }


}
