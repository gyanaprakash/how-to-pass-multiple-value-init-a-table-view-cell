//
//  ViewController.h
//  task.3
//
//  Created by Bsetecip10 on 20/10/14.
//  Copyright (c) 2014 Bsetecip10. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UITableViewDataSource,UITableViewDelegate>
{
    NSArray *Agepicker;
    UITableView *dataTable;
    NSMutableArray *textarray;
    
}
@property (nonatomic, retain) NSMutableArray *textarray;
@property (nonatomic, retain) UITableView *dataTable;
@property (nonatomic, retain) NSArray *Agepicker;
@property (weak, nonatomic) IBOutlet UITextField *txtFldName;
@property (weak, nonatomic) IBOutlet UITextField *txtFldAge;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerAge;
@property (weak, nonatomic) IBOutlet UIButton *savebutton;

- (IBAction)savebutton:(id)sender;
- (IBAction)hideKeyBoard:(id)sender;

@end

