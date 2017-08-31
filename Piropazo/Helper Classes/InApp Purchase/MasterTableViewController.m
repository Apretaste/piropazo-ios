//
//  MasterTableViewController.m
//  Slot Game
//
//  Created by OneClick on 12/03/14.
//
//

#import "MasterTableViewController.h"
#import "RageIAPHelper.h"
#import <StoreKit/StoreKit.h>

@interface MasterTableViewController ()
{
    NSArray *_products;
    NSNumberFormatter * _priceFormatter;
}

@end

@implementation MasterTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    myTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 480, 300) style:UITableViewStylePlain];
//    myTableView.delegate=self;
//    myTableView.dataSource=self;
//    [self.view addSubview:myTableView];
    self.title = @"In App Rage";
    
//    myTableView.refreshControl = [[UIRefreshControl alloc] init];
//    [myTableView.refreshControl addTarget:self action:@selector(reload) forControlEvents:UIControlEventValueChanged];
    [self reload];
//    [myTableView.refreshControl beginRefreshing];
    
    _priceFormatter = [[NSNumberFormatter alloc] init];
    [_priceFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
    [_priceFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Restore" style:UIBarButtonItemStyleBordered target:self action:@selector(restoreTapped:)];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)restoreTapped:(id)sender {
    [[RageIAPHelper sharedInstance] restoreCompletedTransactions];
}

- (void)viewWillAppear:(BOOL)animated
{
}

- (void)viewWillDisappear:(BOOL)animated
{
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)productPurchased:(NSNotification *)notification {
    
    NSString * productIdentifier = notification.object;
    [_products enumerateObjectsUsingBlock:^(SKProduct * product, NSUInteger idx, BOOL *stop) {
        if ([product.productIdentifier isEqualToString:productIdentifier]) {
//            [myTableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:idx inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
            *stop = YES;
        }
    }];
    
}

- (void)reload {
    _products = nil;
//    [myTableView reloadData];
    [[RageIAPHelper sharedInstance] requestProductsWithCompletionHandler:^(BOOL success, NSArray *products) {
        if (success) {
            _products = products;
            NSLog(@"products %@",_products);
//            [myTableView reloadData];
        }
//        [self.refreshControl endRefreshing];
    }];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _products.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text=@"test";
//    SKProduct *product=[_products objectAtIndex:indexPath.row];
    NSLog(@"sk product %@",[_products objectAtIndex:indexPath.row]);
//    SKProduct * product = (SKProduct *) [_products objectAtIndex:indexPath.row];
//    cell.textLabel.text = product.localizedTitle;
//    [_priceFormatter setLocale:product.priceLocale];
//    cell.detailTextLabel.text = [_priceFormatter stringFromNumber:product.price];
//    
//    if ([[RageIAPHelper sharedInstance] productPurchased:product.productIdentifier]) {
//        cell.accessoryType = UITableViewCellAccessoryCheckmark;
//        cell.accessoryView = nil;
//    } else {
//        UIButton *buyButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        buyButton.frame = CGRectMake(0, 0, 72, 37);
//        [buyButton setTitle:@"Buy" forState:UIControlStateNormal];
//        buyButton.tag = indexPath.row;
//        [buyButton addTarget:self action:@selector(buyButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
//        cell.accessoryType = UITableViewCellAccessoryNone;
//        cell.accessoryView = buyButton;
//    }

    return cell;
}

- (void)buyButtonTapped:(id)sender
{
    UIButton *buyButton = (UIButton *)sender;
    SKProduct *product = _products[buyButton.tag];
    
    NSLog(@"Buying %@...", product.productIdentifier);
    [[RageIAPHelper sharedInstance] buyProduct:product];
}

@end
