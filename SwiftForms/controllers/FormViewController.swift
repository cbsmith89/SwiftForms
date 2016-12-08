//
//  FormViewController.swift
//  SwiftForms
//
//  Created by Miguel Angel Ortuño on 20/08/14.
//  Copyright (c) 2014 Miguel Angel Ortuño. All rights reserved.
//

import UIKit

open class FormViewController : UITableViewController {
    
    private static var __once: () = {
            FormViewController.defaultCellClasses[.text] = FormTextFieldCell.self
            FormViewController.defaultCellClasses[.label] = FormLabelCell.self
            FormViewController.defaultCellClasses[.number] = FormTextFieldCell.self
            FormViewController.defaultCellClasses[.numbersAndPunctuation] = FormTextFieldCell.self
            FormViewController.defaultCellClasses[.decimal] = FormTextFieldCell.self
            FormViewController.defaultCellClasses[.name] = FormTextFieldCell.self
            FormViewController.defaultCellClasses[.phone] = FormTextFieldCell.self
            FormViewController.defaultCellClasses[.url] = FormTextFieldCell.self
            FormViewController.defaultCellClasses[.twitter] = FormTextFieldCell.self
            FormViewController.defaultCellClasses[.namePhone] = FormTextFieldCell.self
            FormViewController.defaultCellClasses[.email] = FormTextFieldCell.self
            FormViewController.defaultCellClasses[.asciiCapable] = FormTextFieldCell.self
            FormViewController.defaultCellClasses[.password] = FormTextFieldCell.self
            FormViewController.defaultCellClasses[.button] = FormButtonCell.self
            FormViewController.defaultCellClasses[.booleanSwitch] = FormSwitchCell.self
            FormViewController.defaultCellClasses[.booleanCheck] = FormCheckCell.self
            FormViewController.defaultCellClasses[.segmentedControl] = FormSegmentedControlCell.self
            FormViewController.defaultCellClasses[.picker] = FormPickerCell.self
            FormViewController.defaultCellClasses[.teamPicker] = FormTeamPickerCell.self
            FormViewController.defaultCellClasses[.date] = FormDateCell.self
            FormViewController.defaultCellClasses[.time] = FormDateCell.self
            FormViewController.defaultCellClasses[.dateAndTime] = FormDateCell.self
            FormViewController.defaultCellClasses[.stepper] = FormStepperCell.self
            FormViewController.defaultCellClasses[.slider] = FormSliderCell.self
            FormViewController.defaultCellClasses[.multipleSelector] = FormSelectorCell.self
            FormViewController.defaultCellClasses[.multilineText] = FormTextViewCell.self
        }()
    
    // MARK: Class variables
    
    fileprivate static var onceDefaultCellClass: Int = 0
    fileprivate static var defaultCellClasses: [FormRowDescriptor.RowType : FormBaseCell.Type] = [:]

    let pickerView = UIPickerView();
    let textField = UITextField(frame: CGRect.zero);
    let textField_2 = UITextField(frame: CGRect.zero);
    let titleLabel = UILabel();
    let valueLabel = UILabel();
    let footerView = UIView();
    let colorLightGrey = UIColor(red: 150/255.0, green: 150/255.0, blue: 150/255.0, alpha: 1.0);

    open var pickerVal : String! = "00";
    open var screenWidth = UIScreen.main.bounds.width;
    open var screenHeight = UIScreen.main.bounds.height;
    open var homeVal = ["is","Either"] as Array;
    open var removeCriteria: UIButton = UIButton();
    open var clearAll : UIButton = UIButton();
    open var stringValue = ["00",
        "01Date",
        "03Day of Week",
        "04Favorite",
        "05Home Team",
        "08Season",
        "10Season Win %, Team 1",
        "20Season Win %, Team 2",
        "22Spread (Team 1)",
        "22Total Points Scored",
        "22Week",
        "24Win/Loss Streak, Team 1",
        "25Win/Loss Streak, Team 2",
        "28Def. Coord.",
        "29Def. Fumbles Recov., Team 1",
        "30Def. Fumbles Recov., Team 2",
        "31Def. Intercept., Team 1",
        "32Def. Intercept., Team 2",
        "33Def. Sacks, Team 1",
        "34Def. Sacks, Team 2",
        "35FG Attempts, Team 1",
        "36FG Attempts, Team 2",
        "37FG Made, Team 1",
        "38FG Made, Team 2",
        "39FG Missed, Team 1",
        "40FG Missed, Team 2",
        "41Head Coach",
        "42Off. Coord.", "43Over/Under",
        "44Passing Yds, Team 1",
        "45Passing Yds, Team 2",
        "46Penalties Committed, Team 1",
        "47Penalties Committed, Team 2",
        "48Players",
        "49Prev. Game Fav./Dog, Team 1",
        "50Prev. Game Fav./Dog, Team 2",
        "51Prev. Game Home/Away, Team 1",
        "52Prev. Game Home/Away, Team 2",
        "53Punts, Team 1",
        "54Punts, Team 2",
        "55Rushing Yds, Team 1",
        "56Rushing Yds, Team 2",
        "57Spec. Teams Coach",
        "58Spec. Teams Yds, Team 1",
        "59Spec. Teams Yds, Team 2",
        "61Stadium Environment",
        "62Start Time",
        "63Temperature (F)",
        "64Total Points, Team 1",
        "65Total Points, Team 2",
        "66Total Yds, Team 1",
        "67Total Yds, Team 2",
        "68Turnovers Committed, Team 1",
        "69Turnovers Committed, Team 2"] as Array;
   
    open var clearFormOn : Bool! = false;
    
    open var matchUpBool : Bool! = false;             		//0
    open var team1Bool : Bool! = true;               		//1
    open var team2Bool : Bool! = true;               		//2
    open var gameCriteriaBool : Bool! = false;        		//3
    open var homeTeamBool : Bool! = false;            		//4
    open var favoriteBool : Bool! = false;            		//5
    open var team1StreakBool : Bool! = false;         		//6
    open var team1StreakRangeBool : Bool! = false;    		//7
    open var team2StreakBool : Bool! = false;         		//8
    open var team2StreakRangeBool : Bool! = false;    		//9
    open var team1WinPerBool : Bool! = false;         		//10
    open var team1WinPerRangeBool : Bool! = false;    		//11
    open var team2WinPerBool : Bool! = false;         		//12
    open var team2WinPerRangeBool : Bool! = false;    		//13
    open var seasonBool : Bool! = false;              		//14
    open var seasonRangeBool : Bool! = false;         		//15
    open var weekBool : Bool! = false;                		//16
    open var weekRangeBool : Bool! = false;           		//17
    open var dayBool : Bool! = false;                 		//18
    open var gameDateBool : Bool! = false;            		//19
    open var dateBool : Bool! = false;                		//20
    open var gameDateRangeBool : Bool! = false;       		//21
    open var dateRangeBool : Bool! = false;           		//22
    open var unavailableBool : Bool! = false;  				//23
    open var totalPointsScoredBool : Bool! = false;         //24
    open var totalPointsScoredRangeBool : Bool! = false;    //25
    open var spreadBool : Bool! = false;              		//26
    open var spreadRangeBool : Bool! = false;         		//27
    
    open var removedRow : String! = "removedRow";
    open var matchUpRemoved : Bool! = false;             	//0
    open var team1Removed : Bool! = false;               	//1
    open var team2Removed : Bool! = false;               	//2
    open var gameCriteriaRemoved : Bool! = false;        	//3
    open var homeTeamRemoved : Bool! = false;           	//4
    open var favoriteRemoved : Bool! = false;            	//5
    open var team1StreakRemoved : Bool! = false;         	//6
    open var team1StreakRangeRemoved : Bool! = false;    	//7
    open var team2StreakRemoved : Bool! = false;         	//8
    open var team2StreakRangeRemoved : Bool! = false;    	//9
    open var team1WinPerRemoved : Bool! = false;         	//10
    open var team1WinPerRangeRemoved : Bool! = false;    	//11
    open var team2WinPerRemoved : Bool! = false;         	//12
    open var team2WinPerRangeRemoved : Bool! = false;    	//13
    open var seasonRemoved : Bool! = false;              	//14
    open var seasonRangeRemoved : Bool! = false;         	//15
    open var weekRemoved : Bool! = false;                	//16
    open var weekRangeRemoved : Bool! = false;           	//17
    open var dayRemoved : Bool! = false;                 	//18
    open var gameDateRemoved : Bool! = false;            	//19
    open var dateRemoved : Bool! = false;                	//20
    open var gameDateRangeRemoved : Bool! = false;       	//21
    open var dateRangeRemoved : Bool! = false;           	//22
    open var unavailableRemoved : Bool! = false;  			//23
    open var totalPointsScoredRemoved : Bool! = false;      //24
    open var totalPointsScoredRangeRemoved : Bool! = false; //25
    open var spreadRemoved : Bool! = false;              	//26
    open var spreadRangeRemoved : Bool! = false;         	//27
    
    open var matchUpIndexPath = IndexPath(row: 0, section: 0);
    open var team1IndexPath = IndexPath(row: 1, section: 0);
    open var team2IndexPath = IndexPath(row: 2, section: 0);
    open var gameCriteriaIndexPath = IndexPath(row: 3, section: 0);
    open var gameDateIndexPath = IndexPath(row: 4, section: 0);
    open var dateIndexPath = IndexPath(row: 5, section: 0);
    open var gameDateRangeIndexPath = IndexPath(row: 6, section: 0);
    open var dateRangeIndexPath = IndexPath(row: 7, section: 0);
    open var dayIndexPath = IndexPath(row: 8, section: 0);
    open var favoriteIndexPath = IndexPath(row: 9, section: 0);
    open var homeTeamIndexPath = IndexPath(row: 10, section: 0);
    
    open var seasonIndexPath = IndexPath(row: 11, section: 0);
    open var seasonRangeIndexPath = IndexPath(row: 12, section: 0);
    open var team1WinPerIndexPath = IndexPath(row: 13, section: 0);
    open var team1WinPerRangeIndexPath = IndexPath(row: 14, section: 0);
    open var team2WinPerIndexPath = IndexPath(row: 15, section: 0);
    open var team2WinPerRangeIndexPath = IndexPath(row: 16, section: 0);
    open var spreadIndexPath = IndexPath(row: 17, section: 0);
    open var spreadRangeIndexPath = IndexPath(row: 18, section: 0);
    
    open var weekIndexPath = IndexPath(row: 19, section: 0);
    open var weekRangeIndexPath = IndexPath(row: 20, section: 0);
    open var team1StreakIndexPath = IndexPath(row: 21, section: 0);
    open var team1StreakRangeIndexPath = IndexPath(row: 22, section: 0);
    open var team2StreakIndexPath = IndexPath(row: 23, section: 0);
    open var team2StreakRangeIndexPath = IndexPath(row: 24, section: 0);
    
    open var totalPointsScoredIndexPath = IndexPath(row: 25, section: 0);
    open var totalPointsScoredRangeIndexPath = IndexPath(row: 26, section: 0);
    
    // MARK: Properties
    
    open var form = FormDescriptor()
    
    // MARK: Init
    
    public convenience init() {
        self.init(style: .grouped)
    }
    
    public convenience init(form: FormDescriptor) {
        self.init(style: .grouped)
        self.form = form
    }
    
    public override init(style: UITableViewStyle) {
        super.init(style: style)
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    // MARK: View life cycle
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        //navigationItem.title = form.title

        pickerView.dataSource = self;
        pickerView.delegate = self;
        
        footerView.frame = CGRect(x: 0,y: 0,width: screenWidth,height: screenHeight * 0.065);
        updatePicker();
        textField.tintColor = UIColor.clear;
        
        NotificationCenter.default.addObserver(self, selector: #selector(FormViewController.unavailableFilter), name: NSNotification.Name(rawValue: "unavailableFilterNotification"), object: nil);
        
        let MenuButtons = UIToolbar()
        MenuButtons.barStyle = UIBarStyle.default
        MenuButtons.isTranslucent = true
        MenuButtons.sizeToFit()
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(FormViewController.cancelPicker))
        let flexSpace2 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Add", style: UIBarButtonItemStyle.plain, target: self, action: #selector(FormViewController.donePicker))
        
        if let font = UIFont(name: "Lato-Medium", size: 18) {
            cancelButton.setTitleTextAttributes([NSFontAttributeName: font], for: UIControlState());
            doneButton.setTitleTextAttributes([NSFontAttributeName: font], for: UIControlState())   
        }
        
        MenuButtons.setItems([cancelButton, flexSpace2, doneButton], animated: true);
        textField.inputAccessoryView = MenuButtons;
        textField.inputView = pickerView;
        textField.frame = CGRect(x: 0,y: 0,width: screenWidth/4,height: screenHeight * 0.065);
        textField.backgroundColor = UIColor.white;
        textField.textColor = self.view.tintColor;
        textField.text = "+ ADD"
        textField.font = UIFont(name: "Lato-Heavy", size: 14);
        
        removeCriteria.frame=CGRect(x: 0,y: 0,width: screenWidth/4,height: screenHeight * 0.065);
        removeCriteria.backgroundColor=UIColor.white
        removeCriteria.setTitle("- REMOVE", for: UIControlState())
        removeCriteria.titleLabel!.font = UIFont(name: "Lato-Heavy", size: 14);
        removeCriteria.addTarget(self, action: #selector(FormViewController.deleteCriteria), for: UIControlEvents.touchUpInside)
        removeCriteria.setTitleColor(self.view.tintColor, for: UIControlState())
        
        clearAll.frame=CGRect(x: 0,y: 0,width: screenWidth/4,height: screenHeight * 0.065);
        clearAll.backgroundColor=UIColor.white
        clearAll.setTitle("x CLEAR ALL", for: UIControlState())
        clearAll.titleLabel!.font = UIFont(name: "Lato-Heavy", size: 14);
        clearAll.addTarget(self, action: #selector(FormViewController.clearForm), for: UIControlEvents.touchUpInside)
        clearAll.setTitleColor(self.view.tintColor, for: UIControlState())
        
        footerView.addSubview(textField);
        footerView.addSubview(removeCriteria);
        footerView.addSubview(clearAll)
        
        self.tableView.tableFooterView = footerView;
        configureFooter();

    open func clearForm() {
        /*self.homeTeamBool = false;
        self.favoriteBool = false;
        self.team1StreakBool = false;
        self.team1StreakRangeBool = false;
        self.team2StreakRangeBool = false;
        self.team1WinPerBool = false;
        self.team1WinPerRangeBool = false;
        self.team2WinPerBool = false;
        self.team2WinPerRangeBool = false;
        self.seasonBool = false;
        self.seasonRangeBool = false;
        self.weekBool = false;
        self.weekRangeBool = false;
        self.dayBool = false;
        self.gameDateBool = false;
        self.gameDateRangeBool = false;
        self.dateBool = false;
        self.dateRangeBool = false;*/
        print("clearFrom triggered");
        self.clearFormOn = true;
    }
   
    open func doneCriteria() {
        self.tableView.setEditing(false, animated:true);
        removeCriteria.setTitle("- REMOVE", for: UIControlState())
        removeCriteria.addTarget(self, action: #selector(FormViewController.deleteCriteria), for: UIControlEvents.touchUpInside)
        removeCriteria.setTitleColor(self.view.tintColor, for: UIControlState())
        configureFooter();
        
        textField.isHidden = false;
        clearAll.isHidden = false;
    }

    open func deleteCriteria() {
        self.tableView.setEditing(true, animated: true);
        removeCriteria.setTitle("DONE", for: UIControlState())
        removeCriteria.addTarget(self, action: #selector(FormViewController.doneCriteria), for: UIControlEvents.touchUpInside)
        removeCriteria.setTitleColor(UIColor.red, for: UIControlState())
        configureFooter();
        textField.isHidden = true;
        clearAll.isHidden = true;
    }
    
    open func textField(_ textView: UITextField, shouldChangeTextInRange: NSRange, replacementText: NSString!) -> Bool {
        return false;
    }
    
    open func donePicker() {
        removeCriteria.setTitleColor(self.view.tintColor, for: UIControlState());
        clearAll.setTitleColor(self.view.tintColor, for: UIControlState());
        textField.textColor = self.view.tintColor;
        
        textField.resignFirstResponder();
        /*removeCriteria.setTitleColor(self.view.tintColor, forState: UIControlState.Normal)
        removeCriteria.backgroundColor=UIColor.whiteColor()
        textField.textColor = self.view.tintColor;
        textField.backgroundColor = UIColor.whiteColor();*/
        updateStringValue();
        updatePicker();
        //print(pickerVal);
        addCriteria();
        setNewCriteria();
        
        removeCriteria.setTitleColor(self.view.tintColor, for: UIControlState());
        clearAll.setTitleColor(self.view.tintColor, for: UIControlState());
        textField.textColor = self.view.tintColor;
        //textField.textColor = redColor(); 
    }
    
    open func cancelPicker() {
        textField.resignFirstResponder();
        removeCriteria.setTitleColor(self.view.tintColor, for: UIControlState());
        clearAll.setTitleColor(self.view.tintColor, for: UIControlState());
        textField.textColor = self.view.tintColor;
        
        removeCriteria.isHidden = false;
        clearAll.isHidden = false; 
    }
    
    open func donePicker_2() {
        _ = UIPickerView();
        self.tableView.reloadData();
        FormPickerCell().reloadComponents();
        removeCriteria.setTitleColor(self.view.tintColor, for: UIControlState());
        textField;
        clearAll.setTitleColor(self.view.tintColor, for: UIControlState());
        textField.textColor = self.view.tintColor;
        
        removeCriteria.isHidden = false;
        clearAll.isHidden = false;
        
        self.tableView.deselectRow(at: matchUpIndexPath, animated: false)
        self.tableView.deselectRow(at: team1IndexPath, animated: false)
        self.tableView.deselectRow(at: team2IndexPath, animated: false)
        self.tableView.deselectRow(at: gameCriteriaIndexPath, animated: false)
        self.tableView.deselectRow(at: homeTeamIndexPath, animated: false)
        self.tableView.deselectRow(at: favoriteIndexPath, animated: false)
        self.tableView.deselectRow(at: team1StreakIndexPath, animated: false)
        self.tableView.deselectRow(at: team1StreakRangeIndexPath, animated: false)
        self.tableView.deselectRow(at: team2StreakIndexPath, animated: false)
        self.tableView.deselectRow(at: team2StreakRangeIndexPath, animated: false)
        self.tableView.deselectRow(at: team1WinPerIndexPath, animated: false)
        self.tableView.deselectRow(at: team1WinPerRangeIndexPath, animated: false)
        self.tableView.deselectRow(at: team2WinPerIndexPath, animated: false)
        self.tableView.deselectRow(at: team2WinPerRangeIndexPath, animated: false)
        self.tableView.deselectRow(at: seasonIndexPath, animated: false)
        self.tableView.deselectRow(at: seasonRangeIndexPath, animated: false)
        self.tableView.deselectRow(at: weekIndexPath, animated: false)
        self.tableView.deselectRow(at: weekRangeIndexPath, animated: false)
        self.tableView.deselectRow(at: dayIndexPath, animated: false)
        self.tableView.deselectRow(at: gameDateIndexPath, animated: false)
        self.tableView.deselectRow(at: dateIndexPath, animated: false)
        self.tableView.deselectRow(at: gameDateRangeIndexPath, animated: false)
        self.tableView.deselectRow(at: dateRangeIndexPath, animated: false)
        self.tableView.deselectRow(at: gameDateRangeIndexPath, animated: false)
        self.tableView.deselectRow(at: dateRangeIndexPath, animated: false)
        
        self.tableView.deselectRow(at: totalPointsScoredIndexPath, animated: false)
        self.tableView.deselectRow(at: totalPointsScoredRangeIndexPath, animated: false)
        
        self.tableView.deselectRow(at: spreadIndexPath, animated: false)
        self.tableView.deselectRow(at: spreadRangeIndexPath, animated: false)
        
        //self.tableView.reloadRowsAtIndexPaths([self.matchUpIndexPath], withRowAnimation: UITableViewRowAnimation.None);
        //self.tableView.reloadRowsAtIndexPaths([self.team1IndexPath], withRowAnimation: UITableViewRowAnimation.None);
        //self.tableView.reloadRowsAtIndexPaths([self.team2IndexPath], withRowAnimation: UITableViewRowAnimation.None);
        //self.tableView.reloadRowsAtIndexPaths([self.gameCriteriaIndexPath], withRowAnimation: UITableViewRowAnimation.None);
        self.tableView.reloadRows(at: [self.homeTeamIndexPath], with: UITableViewRowAnimation.none);
        self.tableView.reloadRows(at: [self.favoriteIndexPath], with: UITableViewRowAnimation.none);
        self.tableView.reloadRows(at: [self.team1StreakIndexPath], with: UITableViewRowAnimation.none);
        self.tableView.reloadRows(at: [self.team1StreakRangeIndexPath], with: UITableViewRowAnimation.none);
        self.tableView.reloadRows(at: [self.team2StreakIndexPath], with: UITableViewRowAnimation.none);
        self.tableView.reloadRows(at: [self.team2StreakRangeIndexPath], with: UITableViewRowAnimation.none);
        self.tableView.reloadRows(at: [self.team1WinPerIndexPath], with: UITableViewRowAnimation.none);
        self.tableView.reloadRows(at: [self.team1WinPerRangeIndexPath], with: UITableViewRowAnimation.none);
        self.tableView.reloadRows(at: [self.team2WinPerIndexPath], with: UITableViewRowAnimation.none);
        self.tableView.reloadRows(at: [self.team2WinPerRangeIndexPath], with: UITableViewRowAnimation.none);
        self.tableView.reloadRows(at: [self.seasonIndexPath], with: UITableViewRowAnimation.none);
        self.tableView.reloadRows(at: [self.seasonRangeIndexPath], with: UITableViewRowAnimation.none);
        self.tableView.reloadRows(at: [self.weekIndexPath], with: UITableViewRowAnimation.none);
        self.tableView.reloadRows(at: [self.weekRangeIndexPath], with: UITableViewRowAnimation.none);
        self.tableView.reloadRows(at: [self.dayIndexPath], with: UITableViewRowAnimation.none);
        self.tableView.reloadRows(at: [self.gameDateIndexPath], with: UITableViewRowAnimation.none);
        self.tableView.reloadRows(at: [self.dateIndexPath], with: UITableViewRowAnimation.none);
        self.tableView.reloadRows(at: [self.gameDateRangeIndexPath], with: UITableViewRowAnimation.none);
        self.tableView.reloadRows(at: [self.dateRangeIndexPath], with: UITableViewRowAnimation.none);
        
        self.tableView.reloadRows(at: [self.totalPointsScoredIndexPath], with: UITableViewRowAnimation.none);
        self.tableView.reloadRows(at: [self.totalPointsScoredRangeIndexPath], with: UITableViewRowAnimation.none);
        
        self.tableView.reloadRows(at: [self.spreadIndexPath], with: UITableViewRowAnimation.none);
        self.tableView.reloadRows(at: [self.spreadRangeIndexPath], with: UITableViewRowAnimation.none);
        
        self.tableView.reloadData();
        
        textField.resignFirstResponder();
        /*updateStringValue();
        updatePicker();
        addCriteria();
        setNewCriteria();*/
        
        self.stringValue = ["00",
            "01Date",
            "03Day of Week",
            "04Favorite",
            "05Home Team",
            "22Total Points Scored",
            "08Season",
            "10Season Win %, Team 1",
            "20Season Win %, Team 2",
            "22Spread (Team 1)",
            "22Week",
            "24Win/Loss Streak, Team 1",
            "25Win/Loss Streak, Team 2",
            "28Def. Coord.",
            "29Def. Fumbles Recov., Team 1",
            "30Def. Fumbles Recov., Team 2",
            "31Def. Intercept., Team 1",
            "32Def. Intercept., Team 2",
            "33Def. Sacks, Team 1",
            "34Def. Sacks, Team 2",
            "35FG Attempts, Team 1",
            "36FG Attempts, Team 2",
            "37FG Made, Team 1",
            "38FG Made, Team 2",
            "39FG Missed, Team 1",
            "40FG Missed, Team 2",
            "41Head Coach",
            "42Off. Coord.", "43Over/Under",
            "44Passing Yds, Team 1",
            "45Passing Yds, Team 2",
            "46Penalties Committed, Team 1",
            "47Penalties Committed, Team 2",
            "48Players",
            "49Prev. Game Fav./Dog, Team 1",
            "50Prev. Game Fav./Dog, Team 2",
            "51Prev. Game Home/Away, Team 1",
            "52Prev. Game Home/Away, Team 2",
            "53Punts, Team 1",
            "54Punts, Team 2",
            "55Rushing Yds, Team 1",
            "56Rushing Yds, Team 2",
            "57Spec. Teams Coach",
            "58Spec. Teams Yds, Team 1",
            "59Spec. Teams Yds, Team 2",
            "61Stadium Environment",
            "62Start Time",
            "63Temperature (F)",
            "64Total Points, Team 1",
            "65Total Points, Team 2",
            "66Total Yds, Team 1",
            "67Total Yds, Team 2",
            "68Turnovers Committed, Team 1",
            "69Turnovers Committed, Team 2"];
        
        self.pickerView.reloadAllComponents();
        
        
    }
    
    open func setNewCriteria() {
        pickerView.selectRow(0, inComponent: 0, animated: true)
        removeCriteria.setTitleColor(self.view.tintColor, for: UIControlState());
        clearAll.setTitleColor(self.view.tintColor, for: UIControlState());
        textField.textColor = self.view.tintColor;
    }
    
    open func pickerView(_ _pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        /*removeCriteria.setTitleColor(UIColor.clearColor(), forState: UIControlState.Normal)
        removeCriteria.backgroundColor=UIColor.clearColor();
        textField.textColor = UIColor.clearColor();
        textField.backgroundColor = UIColor.clearColor();*/
        
        removeCriteria.setTitleColor(colorLightGrey,for: UIControlState());
        clearAll.setTitleColor(colorLightGrey, for: UIControlState());
        textField.textColor = colorLightGrey;
        
        
        //removeCriteria.hidden = true;
        //clearAll.hidden = true;
        
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor.black
        let showString = "\(stringValue[row])"
        pickerLabel.text = showString;
        pickerLabel.font = UIFont(name: "Lato-Medium", size: 18);
        pickerLabel.textAlignment = NSTextAlignment.left
        
        let lastRow = self.stringValue.count - 1
        let lastRow1 = self.stringValue.count - 2
        let lastRow2 = self.stringValue.count - 3
        let lastRow3 = self.stringValue.count - 4
        let lastRow4 = self.stringValue.count - 5
        let lastRow5 = self.stringValue.count - 6
        let lastRow6 = self.stringValue.count - 7
        let lastRow7 = self.stringValue.count - 8
        let lastRow8 = self.stringValue.count - 9
        let lastRow9 = self.stringValue.count - 10
        let lastRow10 = self.stringValue.count - 11
        let lastRow11 = self.stringValue.count - 12
        let lastRow12 = self.stringValue.count - 13
        let lastRow13 = self.stringValue.count - 14
        let lastRow14 = self.stringValue.count - 15
        let lastRow15 = self.stringValue.count - 16
        let lastRow16 = self.stringValue.count - 17
        let lastRow17 = self.stringValue.count - 18
        let lastRow18 = self.stringValue.count - 19
        let lastRow19 = self.stringValue.count - 20
        let lastRow20 = self.stringValue.count - 21
        let lastRow21 = self.stringValue.count - 22
        let lastRow22 = self.stringValue.count - 23
        let lastRow23 = self.stringValue.count - 24
        let lastRow24 = self.stringValue.count - 25
        let lastRow25 = self.stringValue.count - 26
        let lastRow26 = self.stringValue.count - 27
        let lastRow27 = self.stringValue.count - 28
        let lastRow28 = self.stringValue.count - 29
        let lastRow29 = self.stringValue.count - 30
        let lastRow30 = self.stringValue.count - 31
        let lastRow31 = self.stringValue.count - 32
        let lastRow32 = self.stringValue.count - 33
        let lastRow33 = self.stringValue.count - 34
        let lastRow34 = self.stringValue.count - 35
        let lastRow35 = self.stringValue.count - 36
        let lastRow36 = self.stringValue.count - 37
        let lastRow37 = self.stringValue.count - 38
        let lastRow38 = self.stringValue.count - 39
        let lastRow39 = self.stringValue.count - 40
        let lastRow40 = self.stringValue.count - 41
        //let lastRow41 = self.stringValue.count - 42
        //let lastRow42 = self.stringValue.count - 43   
        //let colorLightGrey = UIColor(red: 150/255.0, green: 150/255.0, blue: 150/255.0, alpha: 1.0);
        
        if row == lastRow || row == lastRow1 || row == lastRow2 || row == lastRow3 || row == lastRow4 || row == lastRow5 || row == lastRow6 || row == lastRow7 || row == lastRow8 || row == lastRow9 || row == lastRow10 || row == lastRow11 || row == lastRow12 || row == lastRow13 || row == lastRow14 || row == lastRow15 || row == lastRow16 || row == lastRow17 || row == lastRow18 || row == lastRow19 || row == lastRow20 || row == lastRow21 || row == lastRow22 || row == lastRow23 || row == lastRow24 || row == lastRow25 || row == lastRow26 || row == lastRow27 || row == lastRow28 || row == lastRow29 || row == lastRow30 || row == lastRow31 || row == lastRow32 || row == lastRow33 || row == lastRow34 || row == lastRow35 || row == lastRow36 || row == lastRow37 || row == lastRow38 || row == lastRow39 || row == lastRow40 {
            pickerLabel.textColor = colorLightGrey;
        }
        
        let entireString = showString;
        //_ : NSString = entireString;
        var myMutableString = NSMutableAttributedString();
        myMutableString = NSMutableAttributedString(string: entireString, attributes: [NSFontAttributeName:UIFont(name: "Lato-Medium", size: 18)!])
        myMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor.clear, range: NSRange(location:0,length:2))
        pickerLabel.attributedText = myMutableString;     
        
        return pickerLabel
        
    }
    
    open func unavailableFilter2() {
        removeCriteria.setTitleColor(self.view.tintColor, for: UIControlState());
        clearAll.setTitleColor(self.view.tintColor, for: UIControlState());
        textField.textColor = self.view.tintColor;
        print("notification center for unavailable filter activated", terminator: "");
        let alert = UIAlertController(title: "Beta Version", message: "This criterion will be available soon.", preferredStyle: .alert)
        let purchaseAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
            NSLog("Purchase Pressed")
            
        }
        /*var cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) {
        UIAlertAction in
        NSLog("Cancel Pressed")
        }*/
        alert.addAction(purchaseAction)
        //alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
        
        unavailableBool = false;
        
        self.pickerView.reloadAllComponents();
        
        let firstIndexPath = IndexPath(row: 1, section: 0);
        
        self.tableView.reloadRows(at: [firstIndexPath], with: UITableViewRowAnimation.none);
        
        removeCriteria.setTitleColor(self.view.tintColor, for: UIControlState());
        clearAll.setTitleColor(self.view.tintColor, for: UIControlState());
        textField.textColor = self.view.tintColor;
        configureFooter();
        print("donefilter")
    }
    
    open func unavailableFilter() {
        
        removeCriteria.setTitleColor(self.view.tintColor, for: UIControlState());
        clearAll.setTitleColor(self.view.tintColor, for: UIControlState());
        textField.textColor = self.view.tintColor;
        //removeCriteria.hidden = false;
        //clearAll.hidden = false;
        
        
        unavailableFilter2()
    }
    
    /// ADD MORE CRITERIA PICKER

    open func updateStringValue() {
        
        let lastAvailableRow = stringValue.count-43;
        let secondAvailableRow = stringValue.count-44;
        //var lastAvailableRow = 1;
        
        if pickerVal == "05Home Team" {
            self.homeTeamRemoved = false;
            stringValue = stringValue.filter({ $0 != "05Home Team" });
        } else if pickerVal == "04Favorite" {
            self.favoriteRemoved = false;
            stringValue = stringValue.filter({ $0 != "04Favorite" });
        } else if pickerVal == "24Win/Loss Streak, Team 1" {
            self.team1StreakRemoved = false;
            stringValue = stringValue.filter({ $0 != "24Win/Loss Streak, Team 1" });
            stringValue.insert("25Win/Loss Streak, Team 1 (for range)", at: secondAvailableRow)
        } else if pickerVal == "25Win/Loss Streak, Team 2" {
            self.team2StreakRemoved = false;
            stringValue = stringValue.filter({ $0 != "25Win/Loss Streak, Team 2" });
            stringValue.insert("25Win/Loss Streak, Team 2 (for range)", at: secondAvailableRow)
        } else if pickerVal == "22Spread (Team 1)" {
            self.team2StreakRemoved = false;
            stringValue = stringValue.filter({ $0 != "22Spread (Team 1)" });
            stringValue.insert("22Spread (Team 1) (for range)", at: secondAvailableRow)
        } else if pickerVal == "22Total Points Scored" {
            self.team2StreakRemoved = false;
            stringValue = stringValue.filter({ $0 != "22Total Points Scored" });
            stringValue.insert("22Total Points Scored (for range)", at: secondAvailableRow)
        } else if pickerVal == "10Season Win %, Team 1" {
            self.team1WinPerRemoved = false;
            stringValue = stringValue.filter({ $0 != "10Season Win %, Team 1" });
            stringValue.insert("12Season Win %, Team 1 (for range)", at: secondAvailableRow)
        } else if pickerVal == "20Season Win %, Team 2" {
            self.team2WinPerRemoved = false;
            stringValue = stringValue.filter({ $0 != "20Season Win %, Team 2" });
            stringValue.insert("20Season Win %, Team 2 (for range)", at: secondAvailableRow)
        } else if pickerVal == "08Season" {
            self.seasonRemoved = false;
            stringValue = stringValue.filter({ $0 != "08Season" });
            stringValue.insert("09Season (for range)", at: secondAvailableRow)
        } else if pickerVal == "22Week" {
            self.weekRemoved = false;
            stringValue = stringValue.filter({ $0 != "22Week" });
            stringValue.insert("23Week (for range)", at: secondAvailableRow)
        } else if pickerVal == "03Day of Week" {
            self.dayRemoved = false;
            stringValue = stringValue.filter({ $0 != "03Day of Week" });
        } else if pickerVal == "01Date" {
            self.dateRemoved = false;
            stringValue = stringValue.filter({ $0 != "01Date" });
            stringValue.insert("02Date (for range)", at: secondAvailableRow)
            
        } else if pickerVal == "25Win/Loss Streak, Team 1 (for range)" {
            self.team1StreakRangeRemoved = false;
            stringValue = stringValue.filter({ $0 != "25Win/Loss Streak, Team 1 (for range)" });
        } else if pickerVal == "22Total Points Scored (for range)" {
            self.totalPointsScoredRangeRemoved = false;
            stringValue = stringValue.filter({ $0 != "22Total Points Scored (for range)" });
        } else if pickerVal == "22Spread (Team 1) (for range)" {
            self.spreadRangeRemoved = false;
            stringValue = stringValue.filter({ $0 != "22Spread (Team 1) (for range)" });
        } else if pickerVal == "25Win/Loss Streak, Team 2 (for range)" {
            self.team2StreakRangeRemoved = false;
            stringValue = stringValue.filter({ $0 != "25Win/Loss Streak, Team 2 (for range)" });
        } else if pickerVal == "12Season Win %, Team 1 (for range)" {
            self.team1WinPerRangeRemoved = false;
            stringValue = stringValue.filter({ $0 != "12Season Win %, Team 1 (for range)" });
        } else if pickerVal == "20Season Win %, Team 2 (for range)" {
            self.team2WinPerRangeRemoved = false;
            stringValue = stringValue.filter({ $0 != "20Season Win %, Team 2 (for range)" });
        } else if pickerVal == "09Season (for range)" {
            self.seasonRangeRemoved = false;
            stringValue = stringValue.filter({ $0 != "09Season (for range)" });
        } else if pickerVal == "23Week (for range)" {
            self.weekRangeRemoved = false;
            stringValue = stringValue.filter({ $0 != "23Week (for range)" });
        } else if pickerVal == "02Date (for range)" {
            self.dateRangeRemoved = false;
            stringValue = stringValue.filter({ $0 != "02Date (for range)" });
            
            
        } else if pickerVal == "homeRemoved" {
            stringValue.insert("05Home Team", at: lastAvailableRow)
        } else if pickerVal == "favoriteRemoved" {
            stringValue.insert("04Favorite", at: lastAvailableRow)
        } else if pickerVal == "team1StreakRemoved" {
            if stringValue.contains("25Win/Loss Streak, Team 1 (for range)") {
                stringValue = stringValue.filter({ $0 != "25Win/Loss Streak, Team 1 (for range)" });
                stringValue.insert("24Win/Loss Streak, Team 1", at: stringValue.count-6)
            } else {
                stringValue.insert("24Win/Loss Streak, Team 1", at: stringValue.count-6)
            }
        } else if pickerVal == "team2StreakRemoved" {
            if stringValue.contains("25Win/Loss Streak, Team 2 (for range)") {
                stringValue = stringValue.filter({ $0 != "25Win/Loss Streak, Team 2 (for range)" });
                stringValue.insert("25Win/Loss Streak, Team 2", at: stringValue.count-6)
            } else {
                stringValue.insert("25Win/Loss Streak, Team 2", at: stringValue.count-6)
            }
        } else if pickerVal == "team1WinPerRemoved"{
            if stringValue.contains("12Season Win %, Team 1 (for range)") {
                stringValue = stringValue.filter({ $0 != "12Season Win %, Team 1 (for range)" });
                stringValue.insert("10Season Win %, Team 1", at: stringValue.count-6)
            } else {
                stringValue.insert("10Season Win %, Team 1", at: stringValue.count-6)
            }
        } else if pickerVal == "team2WinPerRemoved" {
            if stringValue.contains("20Season Win %, Team 2 (for range)") {
                stringValue = stringValue.filter({ $0 != "20Season Win %, Team 2 (for range)" });
                stringValue.insert("20Season Win %, Team 2", at: stringValue.count-6)
            } else {
                stringValue.insert("20Season Win %, Team 2", at: stringValue.count-6)
            }
        } else if pickerVal == "seasonRemoved" {
            if stringValue.contains("09Season (for range)") {
                stringValue = stringValue.filter({ $0 != "09Season (for range)" });
                stringValue.insert("08Season", at: stringValue.count-6)
            } else {
                stringValue.insert("08Season", at: stringValue.count-6)
            }
        } else if pickerVal == "weekRemoved" {
            if stringValue.contains("23Week (for range)") {
                stringValue = stringValue.filter({ $0 != "23Week (for range)" });
                stringValue.insert("22Week", at: stringValue.count-6)
            } else {
                stringValue.insert("22Week", at: stringValue.count-6)
            }
        } else if pickerVal == "totalPointsScoredRemoved" {
            if stringValue.contains("22Total Points Scored (for range)") {
                stringValue = stringValue.filter({ $0 != "22Total Points Scored (for range)" });
                stringValue.insert("22Total Points Scored", at: stringValue.count-6)
            } else {
                stringValue.insert("22Total Points Scored", at: stringValue.count-6)
            }
        } else if pickerVal == "spreadRemoved" {
            if stringValue.contains("22Spread (Team 1) (for range)") {
                stringValue = stringValue.filter({ $0 != "22Spread (Team 1) (for range)" });
                stringValue.insert("22Spread (Team 1)", at: stringValue.count-6)
            } else {
                stringValue.insert("22Spread (Team 1)", at: stringValue.count-6)
            }
        } else if pickerVal == "dayRemoved" {
            if stringValue.contains("QDay of Week (for range)") {
                stringValue = stringValue.filter({ $0 != "QDay of Week (for range)" });
                stringValue.insert("03Day of Week", at: stringValue.count-6)
            } else {
                stringValue.insert("03Day of Week", at: stringValue.count-6)
            }
        } else if pickerVal == "dateRemoved" {
            if stringValue.contains("02Date (for range)") {
                stringValue = stringValue.filter({ $0 != "02Date (for range)" });
                stringValue.insert("01Date", at: stringValue.count-6)
            } else {
                stringValue.insert("01Date", at: stringValue.count-6)
            }
        } else if pickerVal == "team1StreakRangeRemoved" {
            if stringValue.contains("25Win/Loss Streak, Team 1 (for range)") {
            } else {
                stringValue.insert("25Win/Loss Streak, Team 1 (for range)", at: lastAvailableRow)
            }
        } else if pickerVal == "team2StreakRangeRemoved" {
            if stringValue.contains("25Win/Loss Streak, Team 2 (for range)") {
            } else {
                stringValue.insert("25Win/Loss Streak, Team 2 (for range)", at: lastAvailableRow)
            }
        } else if pickerVal == "team1WinPerRangeRemoved"{
            if stringValue.contains("12Season Win %, Team 1 (for range)") {
            } else {
                stringValue.insert("12Season Win %, Team 1 (for range)", at: lastAvailableRow)
            }
        } else if pickerVal == "team2WinPerRangeRemoved" {
            if stringValue.contains("20Season Win %, Team 2 (for range)") {
            } else {
                stringValue.insert("20Season Win %, Team 2 (for range)", at: lastAvailableRow)
            }
        } else if pickerVal == "seasonRangeRemoved" {
            if stringValue.contains("09Season (for range)") {
            } else {
                stringValue.insert("09Season (for range)", at: lastAvailableRow)
            }
        } else if pickerVal == "weekRangeRemoved" {
            if stringValue.contains("23Week (for range)") {
            } else {
                stringValue.insert("23Week (for range)", at: lastAvailableRow)
            }
        } else if pickerVal == "spreadRangeRemoved" {
            if stringValue.contains("22Spread (Team 1) (for range)") {
            } else {
                stringValue.insert("22Spread (Team 1) (for range)", at: lastAvailableRow)
            }
        } else if pickerVal == "totalPointsScoredRangeRemoved" {
            if stringValue.contains("22Total Points Scored (for range)") {
            } else {
                stringValue.insert("22Total Points Scored (for range)", at: lastAvailableRow)
            }
        } else if pickerVal == "dateRangeRemoved" {
            if stringValue.contains("02Date (for range)") {
            } else {
                stringValue.insert("02Date (for range)", at: lastAvailableRow)
            }
        } /*else {
        stringValue = ["A","05Home Team", "04Favorite", "24Win/Loss Streak, Team 1", "25Win/Loss Streak, Team 2", "10Season Win %, Team 1", "20Season Win %, Team 2", "08Season", "22Week", "03Day of Week", "01Date", "Stadium Environment","Players","Head Coach","Offensive Coordinator","ALDefensive Coordinator","Special Teams Coach"]
        }*/
        
        stringValue = stringValue.sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
    }
    
    
    open func addCriteria() {
        
        removeCriteria.setTitleColor(self.view.tintColor, for: UIControlState());
        clearAll.setTitleColor(self.view.tintColor, for: UIControlState());
        textField.textColor = self.view.tintColor;
        removeCriteria.isHidden = false;
        clearAll.isHidden = false;
        if pickerVal == "05Home Team" {
            homeTeamBool = true;
            self.pickerView.reloadAllComponents();
            //self.tableView.beginUpdates()
            self.tableView.reloadRows(at: [self.homeTeamIndexPath], with: UITableViewRowAnimation.left);
            self.tableView.selectRow(at: homeTeamIndexPath, animated: true, scrollPosition: .none)
            self.tableView(self.tableView, didSelectRowAt: homeTeamIndexPath);
            
            //////self.tableView.endUpdates()
        } else if pickerVal == "04Favorite" {
            favoriteBool = true;
            self.pickerView.reloadAllComponents();
            //self.tableView.beginUpdates()
            self.tableView.reloadRows(at: [self.favoriteIndexPath], with: UITableViewRowAnimation.left);
            self.tableView.selectRow(at: favoriteIndexPath, animated: true, scrollPosition: .none)
            self.tableView(self.tableView, didSelectRowAt: favoriteIndexPath);
            ////self.tableView.endUpdates()
        } else if pickerVal == "24Win/Loss Streak, Team 1" {
            team1StreakBool = true;
            self.pickerView.reloadAllComponents();
            //self.tableView.beginUpdates()
            self.tableView.reloadRows(at: [self.team1StreakIndexPath], with: UITableViewRowAnimation.left);
            self.tableView.selectRow(at: team1StreakIndexPath, animated: true, scrollPosition: .none)
            self.tableView(self.tableView, didSelectRowAt: team1StreakIndexPath);
            ////self.tableView.endUpdates()
        } else if pickerVal == "25Win/Loss Streak, Team 1 (for range)" {
            team1StreakRangeBool = true;
            self.pickerView.reloadAllComponents();
            //self.tableView.beginUpdates()
            self.tableView.reloadRows(at: [self.team1StreakRangeIndexPath], with: UITableViewRowAnimation.left);
            self.tableView.selectRow(at: team1StreakRangeIndexPath, animated: true, scrollPosition: .none)
            self.tableView(self.tableView, didSelectRowAt: team1StreakRangeIndexPath);
            //self.tableView.endUpdates()
        } else if pickerVal == "25Win/Loss Streak, Team 2" {
            team2StreakBool = true;
            self.pickerView.reloadAllComponents();
            //self.tableView.beginUpdates()
            self.tableView.reloadRows(at: [self.team2StreakIndexPath], with: UITableViewRowAnimation.left);
            self.tableView.selectRow(at: team2StreakIndexPath, animated: true, scrollPosition: .none)
            self.tableView(self.tableView, didSelectRowAt: team2StreakIndexPath);
            //self.tableView.endUpdates()
        } else if pickerVal == "25Win/Loss Streak, Team 2 (for range)" {
            team2StreakRangeBool = true;
            self.pickerView.reloadAllComponents();
            //self.tableView.beginUpdates()
            self.tableView.reloadRows(at: [self.team2StreakRangeIndexPath], with: UITableViewRowAnimation.left);
            self.tableView.selectRow(at: team2StreakRangeIndexPath, animated: true, scrollPosition: .none)
            self.tableView(self.tableView, didSelectRowAt: team2StreakRangeIndexPath);
            //self.tableView.endUpdates()
        } else if pickerVal == "10Season Win %, Team 1" {
            team1WinPerBool = true;
            self.pickerView.reloadAllComponents();
            //self.tableView.beginUpdates()
            self.tableView.reloadRows(at: [self.team1WinPerIndexPath], with: UITableViewRowAnimation.left);
            self.tableView.selectRow(at: team1WinPerIndexPath, animated: true, scrollPosition: .none)
            self.tableView(self.tableView, didSelectRowAt: team1WinPerIndexPath);
            //self.tableView.endUpdates()
        } else if pickerVal == "12Season Win %, Team 1 (for range)" {
            team1WinPerRangeBool = true;
            self.pickerView.reloadAllComponents();
            //self.tableView.beginUpdates()
            self.tableView.reloadRows(at: [self.team1WinPerRangeIndexPath], with: UITableViewRowAnimation.left);
            self.tableView.selectRow(at: team1WinPerRangeIndexPath, animated: true, scrollPosition: .none)
            self.tableView(self.tableView, didSelectRowAt: team1WinPerRangeIndexPath);
            //self.tableView.endUpdates()
        } else if pickerVal == "20Season Win %, Team 2" {
            team2WinPerBool = true;
            self.pickerView.reloadAllComponents();
            //self.tableView.beginUpdates()
            self.tableView.reloadRows(at: [self.team2WinPerIndexPath], with: UITableViewRowAnimation.left);
            self.tableView.selectRow(at: team2WinPerIndexPath, animated: true, scrollPosition: .none)
            self.tableView(self.tableView, didSelectRowAt: team2WinPerIndexPath);
            //self.tableView.endUpdates()
        } else if pickerVal == "20Season Win %, Team 2 (for range)" {
            team2WinPerRangeBool = true;
            self.pickerView.reloadAllComponents();
            //self.tableView.beginUpdates()
            self.tableView.reloadRows(at: [self.team2WinPerRangeIndexPath], with: UITableViewRowAnimation.left);
            self.tableView.selectRow(at: team2WinPerRangeIndexPath, animated: true, scrollPosition: .none)
            self.tableView(self.tableView, didSelectRowAt: team2WinPerRangeIndexPath);
            //self.tableView.endUpdates()
        } else if pickerVal == "08Season" {
            seasonBool = true;
            self.pickerView.reloadAllComponents();
            //self.tableView.beginUpdates()
            self.tableView.reloadRows(at: [self.seasonIndexPath], with: UITableViewRowAnimation.left);
            self.tableView.selectRow(at: seasonIndexPath, animated: true, scrollPosition: .none)
            self.tableView(self.tableView, didSelectRowAt: seasonIndexPath);
            //self.tableView.endUpdates()
        } else if pickerVal == "09Season (for range)" {
            seasonRangeBool = true;
            self.pickerView.reloadAllComponents();
            //self.tableView.beginUpdates()
            self.tableView.reloadRows(at: [self.seasonRangeIndexPath], with: UITableViewRowAnimation.left);
            self.tableView.selectRow(at: seasonRangeIndexPath, animated: true, scrollPosition: .none)
            self.tableView(self.tableView, didSelectRowAt: seasonRangeIndexPath);
            //self.tableView.endUpdates()
        } else if pickerVal == "22Week" {
            weekBool = true;
            self.pickerView.reloadAllComponents();
            //self.tableView.beginUpdates()
            self.tableView.reloadRows(at: [self.weekIndexPath],
                with: UITableViewRowAnimation.left);
            self.tableView.selectRow(at: weekIndexPath, animated: true, scrollPosition: .none)
            self.tableView(self.tableView, didSelectRowAt: weekIndexPath);
            //self.tableView.endUpdates()
        } else if pickerVal == "23Week (for range)" {
            weekRangeBool = true;
            self.pickerView.reloadAllComponents();
            //self.tableView.beginUpdates()
            self.tableView.reloadRows(at: [self.weekRangeIndexPath],
                with: UITableViewRowAnimation.left);
            self.tableView.selectRow(at: weekRangeIndexPath, animated: true, scrollPosition: .none)
            self.tableView(self.tableView, didSelectRowAt: weekRangeIndexPath);
            //self.tableView.endUpdates()
        } else if pickerVal == "22Total Points Scored" {
            totalPointsScoredBool = true;
            self.pickerView.reloadAllComponents();
            //self.tableView.beginUpdates()
            self.tableView.reloadRows(at: [self.totalPointsScoredIndexPath],
                with: UITableViewRowAnimation.left);
            self.tableView.selectRow(at: totalPointsScoredIndexPath, animated: true, scrollPosition: .none)
            self.tableView(self.tableView, didSelectRowAt: totalPointsScoredIndexPath);
            //self.tableView.endUpdates()
        } else if pickerVal == "22Total Points Scored (for range)" {
            totalPointsScoredRangeBool = true;
            self.pickerView.reloadAllComponents();
            //self.tableView.beginUpdates()
            self.tableView.reloadRows(at: [self.totalPointsScoredRangeIndexPath],
                with: UITableViewRowAnimation.left);
            self.tableView.selectRow(at: totalPointsScoredRangeIndexPath, animated: true, scrollPosition: .none)
            self.tableView(self.tableView, didSelectRowAt: totalPointsScoredRangeIndexPath);
            //self.tableView.endUpdates()
        } else if pickerVal == "22Spread (Team 1)" {
            spreadBool = true;
            self.pickerView.reloadAllComponents();
            //self.tableView.beginUpdates()
            self.tableView.reloadRows(at: [self.spreadIndexPath],
                with: UITableViewRowAnimation.left);
            self.tableView.selectRow(at: spreadIndexPath, animated: true, scrollPosition: .none)
            self.tableView(self.tableView, didSelectRowAt: spreadIndexPath);
            //self.tableView.endUpdates()
        } else if pickerVal == "22Spread (Team 1) (for range)" {
            spreadRangeBool = true;
            self.pickerView.reloadAllComponents();
            //self.tableView.beginUpdates()
            self.tableView.reloadRows(at: [self.spreadRangeIndexPath],
                with: UITableViewRowAnimation.left);
            self.tableView.selectRow(at: spreadRangeIndexPath, animated: true, scrollPosition: .none)
            self.tableView(self.tableView, didSelectRowAt: spreadRangeIndexPath);
            //self.tableView.endUpdates()
        } else if pickerVal == "03Day of Week" {
            dayBool = true;
            self.pickerView.reloadAllComponents();
            //self.tableView.beginUpdates()
            self.tableView.reloadRows(at: [self.dayIndexPath], with: UITableViewRowAnimation.left);
            self.tableView.selectRow(at: dayIndexPath, animated: true, scrollPosition: .none)
            self.tableView(self.tableView, didSelectRowAt: dayIndexPath);
            //self.tableView.endUpdates()
        } else if pickerVal == "01Date" {
            removeCriteria.isHidden = false;
            clearAll.isHidden = false;
            dateBool = true;
            gameDateBool = true;
            self.pickerView.reloadAllComponents();
            //self.tableView.beginUpdates()
            let paths = [gameDateIndexPath,dateIndexPath]
            self.tableView.reloadRows(at: paths, with: UITableViewRowAnimation.left);
            self.tableView.selectRow(at: gameDateIndexPath, animated: true, scrollPosition: .none)
            self.tableView(self.tableView, didSelectRowAt: gameDateIndexPath);
            //self.tableView.endUpdates()
            
        } else if pickerVal == "02Date (for range)" {
            removeCriteria.isHidden = false;
            clearAll.isHidden = false;
            dateRangeBool = true;
            gameDateRangeBool = true;
            self.pickerView.reloadAllComponents();
            //self.tableView.beginUpdates()
            let paths = [gameDateRangeIndexPath,dateRangeIndexPath]
            self.tableView.reloadRows(at: paths, with: UITableViewRowAnimation.left);
            self.tableView.selectRow(at: gameDateRangeIndexPath, animated: true, scrollPosition: .none)
            self.tableView(self.tableView, didSelectRowAt: gameDateRangeIndexPath);
            //self.tableView.endUpdates()
            
            
        } else if pickerVal == "28Def. Coord." || pickerVal == "29Def. Fumbles Recov., Team 1" || pickerVal == "30Def. Fumbles Recov., Team 2" || pickerVal == "31Def. Intercept., Team 1" || pickerVal == "32Def. Intercept., Team 2" || pickerVal == "33Def. Sacks, Team 1" || pickerVal == "34Def. Sacks, Team 2" || pickerVal == "35FG Attempts, Team 1" || pickerVal == "36FG Attempts, Team 2" || pickerVal == "37FG Made, Team 1" || pickerVal == "38FG Made, Team 2" || pickerVal == "39FG Missed, Team 1" || pickerVal == "40FG Missed, Team 2" || pickerVal == "41Head Coach" || pickerVal == "42Off. Coord." || pickerVal == "43Over/Under" || pickerVal == "44Passing Yds, Team 1" || pickerVal == "45Passing Yds, Team 2" || pickerVal == "46Penalties Committed, Team 1" || pickerVal == "47Penalties Committed, Team 2" || pickerVal == "48Players" || pickerVal == "64Total Points, Team 1" || pickerVal == "65Total Points, Team 2" || pickerVal == "49Prev. Game Fav./Dog, Team 1" || pickerVal == "50Prev. Game Fav./Dog, Team 2" || pickerVal == "51Prev. Game Home/Away, Team 1" || pickerVal == "52Prev. Game Home/Away, Team 2" || pickerVal == "53Punts, Team 1" || pickerVal == "54Punts, Team 2" || pickerVal == "55Rushing Yds, Team 1" || pickerVal == "56Rushing Yds, Team 2" || pickerVal == "57Spec. Teams Coach" || pickerVal == "58Spec. Teams Yds, Team 1" || pickerVal == "59Spec. Teams Yds, Team 2" || pickerVal == "60Spread, Team 1" || pickerVal == "61Stadium Environment" || pickerVal == "62Start Time" || pickerVal == "63Temperature (F)" || pickerVal == "66Total Yds, Team 1" || pickerVal == "67Total Yds, Team 2" || pickerVal == "68Turnovers Committed, Team 1" || pickerVal == "69Turnovers Committed, Team 2" {
            
            self.pickerView.reloadAllComponents();
            //self.tableView.beginUpdates()
            /*self.tableView.reloadRowsAtIndexPaths([self.gameCriteriaIndexPath], withRowAnimation: UITableViewRowAnimation.Left);
            self.tableView.selectRowAtIndexPath(gameCriteriaIndexPath, animated: true, scrollPosition: .None)
            self.tableView(self.tableView, didSelectRowAtIndexPath: gameCriteriaIndexPath);*/
            
            removeCriteria.setTitleColor(self.view.tintColor, for: UIControlState());
            clearAll.setTitleColor(self.view.tintColor, for: UIControlState());
            textField.textColor = self.view.tintColor;
            
            /*let allPaths = [homeTeamIndexPath, favoriteIndexPath, team1StreakIndexPath, team1StreakRangeIndexPath, team2StreakIndexPath, team2StreakRangeIndexPath, team1WinPerIndexPath, team1WinPerRangeIndexPath, team2WinPerIndexPath, team2WinPerRangeIndexPath, seasonIndexPath,seasonRangeIndexPath, weekIndexPath, weekRangeIndexPath, dayIndexPath, gameDateIndexPath, dateIndexPath, gameDateRangeIndexPath, dateRangeIndexPath]
            self.tableView.reloadRowsAtIndexPaths(allPaths, withRowAnimation: UITableViewRowAnimation.None)*/
            
            
            //removeCriteria.hidden = false;
            //clearAll.hidden = false;
            //unavailableBool = true;
            NotificationCenter.default.post(name: Notification.Name(rawValue: "unavailableFilterNotification"), object: nil)
            //self.pickerView.reloadAllComponents();
        } else {
            //self.tableView.beginUpdates()
            removeCriteria.isHidden = false;
            clearAll.isHidden = false;
            removeCriteria.setTitleColor(self.view.tintColor, for: UIControlState());
            clearAll.setTitleColor(self.view.tintColor, for: UIControlState());
            textField.textColor = self.view.tintColor;
            
            let allPaths = [homeTeamIndexPath, favoriteIndexPath, team1StreakIndexPath, team1StreakRangeIndexPath, team2StreakIndexPath, team2StreakRangeIndexPath, team1WinPerIndexPath, team1WinPerRangeIndexPath, team2WinPerIndexPath, team2WinPerRangeIndexPath, seasonIndexPath,seasonRangeIndexPath, weekIndexPath, weekRangeIndexPath, spreadIndexPath, spreadRangeIndexPath, totalPointsScoredIndexPath, totalPointsScoredRangeIndexPath, dayIndexPath, gameDateIndexPath, dateIndexPath, gameDateRangeIndexPath, dateRangeIndexPath]
            self.tableView.reloadRows(at: allPaths, with: UITableViewRowAnimation.none)
            self.pickerView.reloadAllComponents();
            //self.tableView.endUpdates();
        }
    }
    
    open func numberOfComponents(in _ : UIPickerView) -> Int {
        return 1
    }
    
    open func pickerView(_: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stringValue.count;
    }
    
    open func pickerView(_ : UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {

        _ = [NSForegroundColorAttributeName: [UIColor.lightGray]]
        let showString = NSMutableAttributedString(string: "\(stringValue[row])");
        return showString;
    }
    
    open func pickerView(_ : UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        removeCriteria.setTitleColor(colorLightGrey,for: UIControlState());
        clearAll.setTitleColor(colorLightGrey, for: UIControlState());
        textField.textColor = colorLightGrey;
        
        //removeCriteria.hidden = true;
        //clearAll.hidden = true;
        
        pickerVal = "\(stringValue[row])";
        textField.becomeFirstResponder();
        //FormPickerCell().selectFirstValue();

        self.tableView.deselectRow(at: matchUpIndexPath, animated: false)
        self.tableView.deselectRow(at: team1IndexPath, animated: false)
        self.tableView.deselectRow(at: team2IndexPath, animated: false)
        self.tableView.deselectRow(at: gameCriteriaIndexPath, animated: false)
        self.tableView.deselectRow(at: homeTeamIndexPath, animated: false)
        self.tableView.deselectRow(at: favoriteIndexPath, animated: false)
        self.tableView.deselectRow(at: team1StreakIndexPath, animated: false)
        self.tableView.deselectRow(at: team1StreakRangeIndexPath, animated: false)
        self.tableView.deselectRow(at: team2StreakIndexPath, animated: false)
        self.tableView.deselectRow(at: team2StreakRangeIndexPath, animated: false)
        self.tableView.deselectRow(at: team1WinPerIndexPath, animated: false)
        self.tableView.deselectRow(at: team1WinPerRangeIndexPath, animated: false)
        self.tableView.deselectRow(at: team2WinPerIndexPath, animated: false)
        self.tableView.deselectRow(at: team2WinPerRangeIndexPath, animated: false)
        self.tableView.deselectRow(at: seasonIndexPath, animated: false)
        self.tableView.deselectRow(at: seasonRangeIndexPath, animated: false)
        self.tableView.deselectRow(at: weekIndexPath, animated: false)
        self.tableView.deselectRow(at: weekRangeIndexPath, animated: false)
        self.tableView.deselectRow(at: dayIndexPath, animated: false)
        self.tableView.deselectRow(at: gameDateIndexPath, animated: false)
        self.tableView.deselectRow(at: dateIndexPath, animated: false)
        self.tableView.deselectRow(at: gameDateRangeIndexPath, animated: false)
        self.tableView.deselectRow(at: dateRangeIndexPath, animated: false)
        self.tableView.deselectRow(at: totalPointsScoredIndexPath, animated: false)
        self.tableView.deselectRow(at: totalPointsScoredRangeIndexPath, animated: false)
        self.tableView.deselectRow(at: spreadIndexPath, animated: false)
        self.tableView.deselectRow(at: spreadRangeIndexPath, animated: false)   
    }
    
    open func updatePicker() {
               
        //titleLabel.text = "+ ADD CRITERIA"
        titleLabel.font = UIFont(name: "Lato-Medium", size: 15);
        valueLabel.font = UIFont(name: "Lato-Light", size: 15);
        
        removeCriteria.setTitleColor(self.view.tintColor, for: UIControlState());
        textField;
        clearAll.setTitleColor(self.view.tintColor, for: UIControlState());
        textField.textColor = self.view.tintColor;
    }
    
    // MARK: Public interface
    
    open func valueForTag(_ tag: String) -> AnyObject? {
        for section in form.sections {
            for row in section.rows {
                if row.tag == tag {
                    return row.value
                }
            }
        }
        return nil
    }
    
    open func setValue(_ value: AnyObject, forTag tag: String) {
        for (sectionIndex, section) in form.sections.enumerated() {
            for (rowIndex, row) in section.rows.enumerated() {
                if row.tag == tag {
                    form.sections[sectionIndex].rows[rowIndex].value = value
                    if let cell = self.tableView.cellForRow(at: IndexPath(row: rowIndex, section: sectionIndex)) as? FormBaseCell {
                        cell.update()
                    }
                    return
                }
            }
        }
    }
    
    // MARK: UITableViewDataSource
    
    open override func numberOfSections(in tableView: UITableView) -> Int {
        // return form.sections.count
        return 1
    }
    
    open override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return form.sections[section].rows.count
    }
    
    open override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let rowDescriptor = formRowDescriptorAtIndexPath(indexPath)
        
        let formBaseCellClass = formBaseCellClassFromRowDescriptor(rowDescriptor)
        
        let reuseIdentifier = NSStringFromClass(formBaseCellClass!)
        
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? FormBaseCell
        if cell == nil {
            cell = formBaseCellClass?.init(style: .default, reuseIdentifier: reuseIdentifier)
            cell?.formViewController = self
            cell?.configure()
        }
        
        cell?.rowDescriptor = rowDescriptor
        
        // apply cell custom design
        for (keyPath, value) in rowDescriptor.configuration.cell.appearance {
            cell?.setValue(value, forKeyPath: keyPath)
        }
        return cell!
    }
    
    open override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return form.sections[section].headerTitle
    }
    
    open override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return form.sections[section].footerTitle
    }
    
    open override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let headerView = form.sections[section].headerView else { return nil }
        return headerView
    }
    
    open override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let footerView = form.sections[section].footerView else { return nil }
        return footerView
    }

    open override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView;
        header.contentView.backgroundColor = UIColor.white;
    }
    
    open override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    	let headerHeight : CGFloat = screenHeight * 0.14
        guard let headerView = form.sections[section].headerView , headerView.translatesAutoresizingMaskIntoConstraints else {
        	return headerHeight
            //return form.sections[section].headerViewHeight
        }
        //return headerView.frame.size.height
        return headerHeight
    }
    
    open override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        guard let footerView = form.sections[section].footerView , footerView.translatesAutoresizingMaskIntoConstraints else {
            //return form.sections[section].footerViewHeight
            return 0
        }
        //return footerView.frame.size.height
        return 0
    }
    
    // MARK: UITableViewDelegate
    
    open override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        /*let rowDescriptor = formRowDescriptorAtIndexPath(indexPath)
        
        if let formBaseCellClass = formBaseCellClassFromRowDescriptor(rowDescriptor) {
            return formBaseCellClass.formRowCellHeight()
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
        */

        var rowHeight : CGFloat = 40.0;
        
        if indexPath == self.matchUpIndexPath  {
            rowHeight = screenHeight * 0.045;
            
        } else if (homeTeamBool == false) && (indexPath == self.homeTeamIndexPath) {
            rowHeight = 0.0;
        } else if (homeTeamBool == true) && (indexPath == self.homeTeamIndexPath) {
            rowHeight = screenHeight * 0.055;
            
        } else if (favoriteBool == false) && (indexPath == self.favoriteIndexPath) {
            rowHeight = 0.0;
        } else if (favoriteBool == true) && (indexPath == self.favoriteIndexPath) {
            rowHeight = screenHeight * 0.055;
            
        } else if (team1StreakBool == false) && (indexPath == self.team1StreakIndexPath) {
            rowHeight = 0.0;
        } else if (team1StreakBool == true) && (indexPath == self.team1StreakIndexPath) {
            rowHeight = screenHeight * 0.055;
            
        } else if (team1StreakRangeBool == false) && (indexPath == self.team1StreakRangeIndexPath) {
            rowHeight = 0.0;
        } else if (team1StreakRangeBool == true) && (indexPath == self.team1StreakRangeIndexPath) {
            rowHeight = screenHeight * 0.045;
            
            
        } else if (team2StreakBool == false) && (indexPath == self.team2StreakIndexPath) {
            rowHeight = 0.0;
        } else if (team2StreakBool == true) && (indexPath == self.team2StreakIndexPath) {
            rowHeight = screenHeight * 0.055;
            
            
        } else if (team2StreakRangeBool == false) && (indexPath == self.team2StreakRangeIndexPath) {
            rowHeight = 0.0;
        } else if (team2StreakRangeBool == true) && (indexPath == self.team2StreakRangeIndexPath) {
            rowHeight = screenHeight * 0.045;
            
            
        } else if (team1WinPerBool == false) && (indexPath == self.team1WinPerIndexPath) {
            rowHeight = 0.0;
        } else if (team1WinPerBool == true) && (indexPath == self.team1WinPerIndexPath) {
            rowHeight = screenHeight * 0.055;
            
        } else if (team1WinPerRangeBool == false) && (indexPath == self.team1WinPerRangeIndexPath) {
            rowHeight = 0.0;
        } else if (team1WinPerRangeBool == true) && (indexPath == self.team1WinPerRangeIndexPath) {
            rowHeight = screenHeight * 0.045;
            
            
        } else if (team2WinPerBool == false) && (indexPath == self.team2WinPerIndexPath) {
            rowHeight = 0.0;
        } else if (team2WinPerBool == true) && (indexPath == self.team2WinPerIndexPath) {
            rowHeight = screenHeight * 0.055;
            
            
        } else if (team2WinPerRangeBool == false) && (indexPath == self.team2WinPerRangeIndexPath) {
            rowHeight = 0.0;
        } else if (team2WinPerRangeBool == true) && (indexPath == self.team2WinPerRangeIndexPath) {
            rowHeight = screenHeight * 0.045;
            
            
        } else if (seasonBool == false) && (indexPath == self.seasonIndexPath) {
            rowHeight = 0.0;
        } else if (seasonBool == true) && (indexPath == self.seasonIndexPath) {
            rowHeight = screenHeight * 0.055;
            
            
        } else if (seasonRangeBool == false) && (indexPath == self.seasonRangeIndexPath) {
            rowHeight = 0.0;
        } else if (seasonRangeBool == true) && (indexPath == self.seasonRangeIndexPath) {
            rowHeight = screenHeight * 0.045;
            
            
        } else if (weekBool == false) && (indexPath == self.weekIndexPath) {
            rowHeight = 0.0;
        } else if (weekBool == true) && (indexPath == self.weekIndexPath) {
            rowHeight = screenHeight * 0.055;
            
        } else if (weekRangeBool == false) && (indexPath == self.weekRangeIndexPath) {
            rowHeight = 0.0;
        } else if (weekRangeBool == true) && (indexPath == self.weekRangeIndexPath) {
            rowHeight = screenHeight * 0.045;
            
            
        } else if (spreadBool == false) && (indexPath == self.spreadIndexPath) {
            rowHeight = 0.0;
        } else if (spreadBool == true) && (indexPath == self.spreadIndexPath) {
            rowHeight = screenHeight * 0.055;
            
        } else if (spreadRangeBool == false) && (indexPath == self.spreadRangeIndexPath) {
            rowHeight = 0.0;
        } else if (spreadRangeBool == true) && (indexPath == self.spreadRangeIndexPath) {
            rowHeight = screenHeight * 0.045;
            
            
        } else if (totalPointsScoredBool == false) && (indexPath == self.totalPointsScoredIndexPath) {
            rowHeight = 0.0;
        } else if (totalPointsScoredBool == true) && (indexPath == self.totalPointsScoredIndexPath) {
            rowHeight = screenHeight * 0.055;
            
        } else if (totalPointsScoredRangeBool == false) && (indexPath == self.totalPointsScoredRangeIndexPath) {
            rowHeight = 0.0;
        } else if (totalPointsScoredRangeBool == true) && (indexPath == self.totalPointsScoredRangeIndexPath) {
            rowHeight = screenHeight * 0.045;
            
            
        } else if (dayBool == false) && (indexPath == self.dayIndexPath) {
            rowHeight = 0.0;
        } else if (dayBool == true) && (indexPath == self.dayIndexPath) {
            rowHeight = screenHeight * 0.055;
            
            
        } else if (gameDateBool == false) && (indexPath == self.gameDateIndexPath) {
            rowHeight = 0.0;
        } else if (gameDateBool == true) && (indexPath == self.gameDateIndexPath) {
            rowHeight = screenHeight * 0.055;
        } else if (gameDateBool == false) && (indexPath == self.dateIndexPath) {
            rowHeight = 0.0;
        } else if (gameDateBool == true) && (indexPath == self.dateIndexPath) {
            rowHeight = screenHeight * 0.045;
            
        } else if (gameDateRangeBool == false) && (indexPath == self.gameDateRangeIndexPath) {
            rowHeight = 0.0;
        } else if (gameDateRangeBool == true) && (indexPath == self.gameDateRangeIndexPath) {
            rowHeight = screenHeight * 0.045;
        } else if (gameDateRangeBool == false) && (indexPath == self.dateRangeIndexPath) {
            rowHeight = 0.0;
        } else if (gameDateRangeBool == true) && (indexPath == self.dateRangeIndexPath) {
            rowHeight = screenHeight * 0.045;
            
        } else {
            rowHeight = screenHeight * 0.055
        }
       
        return rowHeight;
    }
    
    open override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let rowDescriptor = formRowDescriptorAtIndexPath(indexPath)
        
        if let selectedRow = tableView.cellForRow(at: indexPath) as? FormBaseCell {
            if let formBaseCellClass = formBaseCellClassFromRowDescriptor(rowDescriptor) {
                formBaseCellClass.formViewController(self, didSelectRow: selectedRow)
            }
        }
        
        if let didSelectClosure = rowDescriptor.configuration.button.didSelectClosure {
            didSelectClosure(rowDescriptor)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    open override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        
        let rowFrame : CGRect = self.tableView.rectForRow(at: indexPath);
        let rowHeight = rowFrame.size.height;
        _ = self.tableView.isEditing
        
        if indexPath == self.matchUpIndexPath || indexPath == self.team1IndexPath || indexPath == self.team2IndexPath || indexPath == self.gameCriteriaIndexPath || 
        indexPath == self.dateIndexPath || indexPath == self.dateRangeIndexPath || rowHeight == 0 {
            return .none
        } else {
            return .delete
        }
    }

    open override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?  {

        let noAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: " ", handler: { (action:UITableViewRowAction, indexPath:IndexPath) -> Void in
        
        })

        if  indexPath == homeTeamIndexPath || indexPath == favoriteIndexPath || indexPath == team1StreakIndexPath || indexPath == team1StreakRangeIndexPath || 
        indexPath == team2StreakIndexPath || indexPath == team2StreakRangeIndexPath || indexPath == team1WinPerIndexPath || indexPath == team1WinPerRangeIndexPath || 
        indexPath == team2WinPerIndexPath || indexPath == team2WinPerRangeIndexPath || indexPath == seasonIndexPath || indexPath == seasonRangeIndexPath || 
        indexPath == weekIndexPath || indexPath == weekRangeIndexPath || indexPath == spreadIndexPath || indexPath == spreadRangeIndexPath || indexPath == totalPointsScoredIndexPath 
        || indexPath == totalPointsScoredRangeIndexPath || indexPath == dayIndexPath || indexPath == gameDateIndexPath || indexPath == gameDateRangeIndexPath {
            
            
            let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Remove" , handler: { (action:UITableViewRowAction, indexPath:IndexPath) -> Void in

                if indexPath == self.homeTeamIndexPath {
                    //self.homeTeamRemoved = true;
                    self.homeTeamBool = false
                    self.tableView.reloadRows(at: [self.homeTeamIndexPath], with: UITableViewRowAnimation.left);
                    self.pickerVal = "homeRemoved"
                    self.updateStringValue();
                    //self.checkContains();
                } else if indexPath == self.favoriteIndexPath {
                    self.favoriteBool = false
                    self.tableView.reloadRows(at: [self.favoriteIndexPath], with: UITableViewRowAnimation.left);
                    //self.favoriteRemoved = true;
                    self.pickerVal = "favoriteRemoved"
                    self.updateStringValue();
                    //self.checkContains();
                } else if indexPath == self.team1StreakIndexPath {
                    self.team1StreakBool = false
                    self.team1StreakRangeBool = false
                    self.tableView.reloadRows(at: [self.team1StreakIndexPath], with: UITableViewRowAnimation.left);
                    self.tableView.reloadRows(at: [self.team1StreakRangeIndexPath], with: UITableViewRowAnimation.left);
                    //self.team1StreakRemoved = true;
                    //self.team1StreakRangeRemoved = true;
                    self.pickerVal = "team1StreakRemoved"
                    self.updateStringValue();
                    //self.pickerVal = "team1StreakRangeRemoved_A"
                    //self.updateStringValue()
                    //self.checkContains();
                } else if indexPath == self.team1StreakRangeIndexPath {
                    self.team1StreakRangeBool = false
                    self.tableView.reloadRows(at: [self.team1StreakRangeIndexPath], with: UITableViewRowAnimation.left);
                    //self.team1StreakRangeRemoved = true;
                    self.pickerVal = "team1StreakRangeRemoved"
                    self.updateStringValue();
                    //self.checkContains();
                } else if indexPath == self.team2StreakIndexPath {
                    self.team2StreakBool = false
                    self.team2StreakRangeBool = false
                    self.tableView.reloadRows(at: [self.team2StreakIndexPath], with: UITableViewRowAnimation.left);
                    self.tableView.reloadRows(at: [self.team2StreakRangeIndexPath], with: UITableViewRowAnimation.left);
                    //self.team2StreakRemoved = true;
                    //self.team2StreakRangeRemoved = true;
                    self.pickerVal = "team2StreakRemoved"
                    self.updateStringValue();
                    //self.pickerVal = "team2StreakRangeRemoved"
                    //self.updateStringValue();
                    //self.checkContains();
                } else if indexPath == self.team2StreakRangeIndexPath {
                    self.team2StreakRangeBool = false
                    self.tableView.reloadRows(at: [self.team2StreakRangeIndexPath], with: UITableViewRowAnimation.left);
                    //self.team2StreakRangeRemoved = true;
                    self.pickerVal = "team2StreakRangeRemoved"
                    self.updateStringValue();
                    //self.checkContains();
                } else if indexPath == self.team1WinPerIndexPath {
                    self.team1WinPerBool = false
                    self.team1WinPerRangeBool = false
                    self.tableView.reloadRows(at: [self.team1WinPerIndexPath], with: UITableViewRowAnimation.left);
                    self.tableView.reloadRows(at: [self.team1WinPerRangeIndexPath], with: UITableViewRowAnimation.left);
                    //self.team1WinPerRemoved = true;
                    //self.team1WinPerRangeRemoved = true;
                    self.pickerVal = "team1WinPerRemoved"
                    self.updateStringValue();
                    //self.pickerVal = "team1WinPerRangeRemoved"
                    //self.updateStringValue();
                    //self.checkContains();
                } else if indexPath == self.team1WinPerRangeIndexPath {
                    self.team1WinPerRangeBool = false
                    self.tableView.reloadRows(at: [self.team1WinPerRangeIndexPath], with: UITableViewRowAnimation.left);
                    //self.team1WinPerRangeRemoved = true;
                    self.pickerVal = "team1WinPerRangeRemoved"
                    self.updateStringValue();
                    //self.checkContains();
                } else if indexPath == self.team2WinPerIndexPath {
                    self.team2WinPerBool = false
                    self.team2WinPerRangeBool = false
                    self.tableView.reloadRows(at: [self.team2WinPerIndexPath], with: UITableViewRowAnimation.left);
                    self.tableView.reloadRows(at: [self.team2WinPerRangeIndexPath], with: UITableViewRowAnimation.left);
                    //self.team2WinPerRemoved = true;
                    //self.team2WinPerRangeRemoved = true;
                    self.pickerVal = "team2WinPerRemoved"
                    self.updateStringValue();
                    //self.pickerVal = "team2WinPerRangeRemoved"
                    //self.updateStringValue();
                    //self.checkContains();
                } else if indexPath == self.team2WinPerRangeIndexPath {
                    self.team2WinPerRangeBool = false
                    self.tableView.reloadRows(at: [self.team2WinPerRangeIndexPath], with: UITableViewRowAnimation.left);
                    //self.team2WinPerRangeRemoved = true;
                    self.pickerVal = "team2WinPerRangeRemoved"
                    self.updateStringValue();
                    //self.checkContains();
                } else if indexPath == self.seasonIndexPath {
                    self.seasonBool = false
                    self.seasonRangeBool = false
                    self.tableView.reloadRows(at: [self.seasonIndexPath], with: UITableViewRowAnimation.left);
                    self.tableView.reloadRows(at: [self.seasonRangeIndexPath], with: UITableViewRowAnimation.left);
                    //self.seasonRemoved = true;
                    //self.seasonRangeRemoved = true;
                    self.pickerVal = "seasonRemoved"
                    self.updateStringValue();
                    //self.pickerVal = "seasonRangeRemoved"
                    //self.updateStringValue();
                    //self.checkContains();
                } else if indexPath == self.seasonRangeIndexPath {
                    self.seasonRangeBool = false
                    self.tableView.reloadRows(at: [self.seasonRangeIndexPath], with: UITableViewRowAnimation.left);
                    //self.seasonRangeRemoved = true;
                    self.pickerVal = "seasonRangeRemoved"
                    self.updateStringValue();
                    //self.checkContains();
                } else if indexPath == self.weekIndexPath {
                    self.weekBool = false
                    self.weekRangeBool = false
                    self.tableView.reloadRows(at: [self.weekIndexPath], with: UITableViewRowAnimation.left);
                    self.tableView.reloadRows(at: [self.weekRangeIndexPath], with: UITableViewRowAnimation.left);
                    //self.weekRemoved = true;
                    //self.weekRangeRemoved = true;
                    self.pickerVal = "weekRemoved"
                    self.updateStringValue();
                    //self.pickerVal = "weekRangeRemoved"
                    //self.updateStringValue();
                    //self.checkContains();
                } else if indexPath == self.weekRangeIndexPath {
                    self.weekRangeBool = false
                    self.tableView.reloadRows(at: [self.weekRangeIndexPath], with: UITableViewRowAnimation.left);
                    //self.weekRangeRemoved = true;
                    self.pickerVal = "weekRangeRemoved"
                    self.updateStringValue();
                    //self.checkContains();
                } else if indexPath == self.totalPointsScoredIndexPath {
                    self.totalPointsScoredBool = false
                    self.totalPointsScoredRangeBool = false
                    self.tableView.reloadRows(at: [self.totalPointsScoredIndexPath], with: UITableViewRowAnimation.left);
                    self.tableView.reloadRows(at: [self.totalPointsScoredRangeIndexPath], with: UITableViewRowAnimation.left);
                    //self.totalPointsScoredRemoved = true;
                    //self.totalPointsScoredRangeRemoved = true;
                    self.pickerVal = "totalPointsScoredRemoved"
                    self.updateStringValue();
                    //self.pickerVal = "totalPointsScoredRangeRemoved"
                    //self.updateStringValue();
                    //self.checkContains();
                } else if indexPath == self.totalPointsScoredRangeIndexPath {
                    self.totalPointsScoredRangeBool = false
                    self.tableView.reloadRows(at: [self.totalPointsScoredRangeIndexPath], with: UITableViewRowAnimation.left);
                    //self.totalPointsScoredRangeRemoved = true;
                    self.pickerVal = "totalPointsScoredRangeRemoved"
                    self.updateStringValue();
                    //self.checkContains();
                } else if indexPath == self.spreadIndexPath {
                    self.spreadBool = false
                    self.spreadRangeBool = false
                    self.tableView.reloadRows(at: [self.spreadIndexPath], with: UITableViewRowAnimation.left);
                    self.tableView.reloadRows(at: [self.spreadRangeIndexPath], with: UITableViewRowAnimation.left);
                    //self.spreadRemoved = true;
                    //self.spreadRangeRemoved = true;
                    self.pickerVal = "spreadRemoved"
                    self.updateStringValue();
                    //self.pickerVal = "spreadRangeRemoved"
                    //self.updateStringValue();
                    //self.checkContains();
                } else if indexPath == self.spreadRangeIndexPath {
                    self.spreadRangeBool = false
                    self.tableView.reloadRows(at: [self.spreadRangeIndexPath], with: UITableViewRowAnimation.left);
                    //self.spreadRangeRemoved = true;
                    self.pickerVal = "spreadRangeRemoved"
                    self.updateStringValue();
                    //self.checkContains();
                } else if indexPath == self.dayIndexPath {
                    self.dayBool = false
                    self.tableView.reloadRows(at: [self.dayIndexPath], with: UITableViewRowAnimation.left);
                    //self.dayRemoved = true;
                    self.pickerVal = "dayRemoved"
                    self.updateStringValue();
                    //self.checkContains();
                } else if indexPath == self.gameDateIndexPath {
                    self.gameDateBool = false;
                    self.dateBool = false
                    self.gameDateRangeBool = false;
                    self.dateRangeBool = false
                    self.tableView.reloadRows(at: [self.gameDateIndexPath], with: UITableViewRowAnimation.left);
                    self.tableView.reloadRows(at: [self.dateIndexPath], with: UITableViewRowAnimation.left);
                    self.tableView.reloadRows(at: [self.gameDateRangeIndexPath], with: UITableViewRowAnimation.left);
                    self.tableView.reloadRows(at: [self.dateRangeIndexPath], with: UITableViewRowAnimation.left);
                    //self.dateRemoved = true;
                    //self.gameDateRemoved = true;
                    //self.dateRangeRemoved = true;
                    //self.gameDateRangeRemoved = true;
                    self.pickerVal = "dateRemoved"
                    self.updateStringValue();
                    self.pickerVal = "gameDateRemoved"
                    self.updateStringValue();
                    //self.pickerVal = "dateRangeRemoved"
                    //self.updateStringValue();
                    //self.pickerVal = "gameDateRangeRemoved"
                    //self.updateStringValue();
                    //self.checkContains();
                } else if indexPath == self.gameDateRangeIndexPath {
                    self.gameDateRangeBool = false
                    self.dateRangeBool = false
                    self.tableView.reloadRows(at: [self.gameDateRangeIndexPath], with: UITableViewRowAnimation.left);
                    self.tableView.reloadRows(at: [self.dateRangeIndexPath], with: UITableViewRowAnimation.left);
                    //self.dateRangeRemoved = true;
                    //self.gameDateRangeRemoved = true;
                    self.pickerVal = "dateRangeRemoved"
                    self.updateStringValue();
                    self.pickerVal = "gameDateRangeRemoved"
                    self.updateStringValue();
                    //self.checkContains();
                }
                //self.tableView.reloadData();
            })
            return [deleteAction]
        } else {
            return [noAction]
        }
    }
    
    fileprivate class func defaultCellClassForRowType(_ rowType: FormRowDescriptor.RowType) -> FormBaseCell.Type {
        _ = FormViewController.__once
        return FormViewController.defaultCellClasses[rowType]!
    }
    
    fileprivate func formRowDescriptorAtIndexPath(_ indexPath: IndexPath) -> FormRowDescriptor {
    
        let section = form.sections[(indexPath as NSIndexPath).section]
        let rowDescriptor = section.rows[(indexPath as NSIndexPath).row]
        return rowDescriptor
    }
    
    fileprivate func formBaseCellClassFromRowDescriptor(_ rowDescriptor: FormRowDescriptor) -> FormBaseCell.Type! {
        
        var formBaseCellClass: FormBaseCell.Type
        
        if let cellClass = rowDescriptor.configuration.cell.cellClass as? FormBaseCell.Type {
            formBaseCellClass = cellClass
        } else {
            formBaseCellClass = FormViewController.defaultCellClassForRowType(rowDescriptor.type)
        }
        return formBaseCellClass
    }
}
