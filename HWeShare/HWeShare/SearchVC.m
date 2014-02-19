//
//  SearchVC.m
//  taobaoDemo
//
//  Created by MAC on 14-1-7.
//
//

#import "SearchVC.h"
#import "TestViewController.h"
#import "AppDelegate.h"
#import "UIViewController+AKTabBarController.h"
#import "FMDatabase.h"
#import "FMResultSet.h"
@interface SearchVC ()


@end

@implementation SearchVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"搜你所爱";
        self.array=[[NSMutableArray alloc]init];
    }
    return self;
}


- (NSString *)tabImageName
{
	return @"sousuonew";
}

- (NSString *)tabTitle
{
	return @"搜你所爱";
}

- (NSString*) getPath {
   
    NSArray* paths =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) ;
    return [[paths objectAtIndex:0]stringByAppendingPathComponent:@"MyTable"] ;
}

-(void)CreateTable;
{
    FMDatabase *dataBase = [FMDatabase databaseWithPath:[self getPath]];
    if (![dataBase open])
        NSLog(@"OPEN FAIL");


      [dataBase executeUpdate:@"CREATE TABLE IF NOT EXISTS MyTable(result text)"];
      [dataBase close];
}

-(void)QueryData
{
    [self.array removeAllObjects];
    FMDatabase *db = [FMDatabase databaseWithPath:[self getPath]];
    
    if([db open])
    {
        FMResultSet *rs=[db executeQuery:@"SELECT * FROM MyTable"];
        while ([rs next]) {
            [self.array addObject:[rs stringForColumn:@"result"]];
            
        }
        [rs close];
    }
    [db close];
    
    [self.tableview reloadData];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    { self.edgesForExtendedLayout = UIRectEdgeNone;}
    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]   initWithTarget:self action:@selector(dismissKeyboard)];
//    [self.view addGestureRecognizer:tap];
    
    
//    self.tableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    self.tableview.delegate=self;
    self.tableview.dataSource=self;
    [self CreateTable];
    
    [self QueryData];
//    [tap release];
}

-(void)dismissKeyboard {
    [self.search resignFirstResponder];
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    myDelegate.testsch = searchBar.text;
    
    
    FMDatabase *dataBase = [FMDatabase databaseWithPath:[self getPath]];
    BOOL res = [dataBase open];
    FMResultSet *rs=[dataBase executeQuery:@"SELECT * FROM MyTable WHERE result = ?",searchBar.text];
    
    if(![rs next])
    {
    
    res=[dataBase executeUpdate:@"insert into MyTable values (?)",searchBar.text];
    
   if(res==YES)
   {
       NSLog(@"成功");
   }
    
    }
    [self QueryData];
    
    NSLog( @"%s,%d" , __FUNCTION__ , __LINE__ );
    [searchBar resignFirstResponder];
    TestViewController *t = [[TestViewController alloc] init];
    [self.navigationController pushViewController:t animated:true];
    
    
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    
    [searchBar resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if(self.array!=nil)
        return self.array.count;
    else
        return 0;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    NSString *result=[self.array objectAtIndex:indexPath.row];
    cell.text=result;
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
    
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    myDelegate.testsch = [self.array objectAtIndex:indexPath.row];
    
    TestViewController *t = [[TestViewController alloc] init];
    [self.navigationController pushViewController:t animated:YES];

    
}


@end
