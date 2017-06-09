//
//  ViewController.m
//  fontExample
//
//  Created by lc-macbook pro on 2017/6/8.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

#import "InputViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataArr;

@end

@implementation ViewController

static NSString *cellID = @"cellID";


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"iOS 字体";
    
    self.dataArr = [NSMutableArray arrayWithArray:[UIFont familyNames]];

    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:self.tableView];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.rowHeight = 100;
    self.tableView.backgroundColor = [UIColor blackColor];
}


/** 1.系统字体库 **/
- (IBAction)systemFontAction:(id)sender {
    [self.dataArr removeAllObjects];
    [self.dataArr addObjectsFromArray:[UIFont familyNames]];
    [self.tableView reloadData];
}


/** 2.自定义字体 **/
- (IBAction)diyFontAction:(id)sender {
    [self.dataArr removeAllObjects];
    [self.dataArr addObject:@"HYZHongSongJ"];
    [self.tableView reloadData];
}


#pragma mark - <UITableViewDelegate,UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    
    cell.contentLabel.text = self.dataArr[indexPath.row];
    cell.contentLabel.font = [UIFont fontWithName:self.dataArr[indexPath.row] size:20];
    
    cell.miniLabel.text = @"中文样式";
    cell.miniLabel.font = [UIFont fontWithName:self.dataArr[indexPath.row] size:20];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    InputViewController *vc = [[InputViewController alloc]init];
    vc.sendFont = self.dataArr[indexPath.row];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
