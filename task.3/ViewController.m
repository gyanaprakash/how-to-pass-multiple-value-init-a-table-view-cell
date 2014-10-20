//
//  ViewController.m
//  task.3
//
//  Created by Bsetecip10 on 20/10/14.
//  Copyright (c) 2014 Bsetecip10. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize txtFldAge,txtFldName,pickerAge,Agepicker,dataTable,textarray;

- (void)viewDidLoad
{
    
    dataTable=[[UITableView alloc]init];
    [dataTable setDataSource:self];
    [dataTable setDelegate:self];
    [dataTable setHidden:YES];
    [dataTable setFrame:CGRectMake(0, 300, 370, 150)];
    [self.view addSubview:dataTable];
    
    textarray=[[NSMutableArray alloc]init];

    txtFldAge.inputView = pickerAge;
    
    Agepicker=[NSArray arrayWithObjects:@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30", nil];
    [pickerAge setFrame:CGRectMake(207, 50, 97, 50)];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)hideKeyBoard:(id)sender
{
    [txtFldAge resignFirstResponder];
    [txtFldName resignFirstResponder];

}


- (void)didReceiveMemoryWarning

{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)savebutton:(id)sender
{
    if (txtFldName.text.length==0 )
    {
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Warning !" message:@"Enter the Name:" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alrt show];
    }
    else if (txtFldAge.text.length==0)
    {
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Warning !" message:@"Enter the Age:" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alrt show];
    }
    else
    {
        NSMutableDictionary *detail=[[NSMutableDictionary alloc]init];
        [detail setObject:txtFldName.text forKey:@"Name"];
        [detail setObject:txtFldAge.text forKey:@"Age"];
        
        [textarray addObject:detail];
        
        [dataTable setHidden:NO];
        [dataTable reloadData];
    }
}

#pragma mark - UIPicker view datasource methods

// returns the number of 'columns' to display.

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView

{
    return 1;
}

// returns the # of rows in each component..

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component

{
    return Agepicker.count;
}

#pragma mark - UIPicker view delegate methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component

{
    return Agepicker[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component

{
    txtFldAge.text=Agepicker[row];
    [txtFldAge resignFirstResponder];
}

#pragma mark uitableview data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    return [textarray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell1"];
    if (cell==nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell1"];
    }
    
   cell.textLabel.text= [NSString stringWithFormat:@"Name : %@",[[textarray objectAtIndex:indexPath.row]  valueForKey:@"Name"]];
   cell.detailTextLabel.text= [NSString stringWithFormat:@"Age : %@",[[textarray objectAtIndex:indexPath.row]  valueForKey:@"Age"]];

    return cell;
}

@end
