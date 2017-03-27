//
//  HomeViewController.m
//  Big_CoreAnimation
//
//  Created by juliu on 17/3/6.
//  Copyright © 2017年 juliu. All rights reserved.
//

#import "HomeViewController.h"
#import "Module.h"

@interface HomeViewController ()<UITableViewDataSource, UITableViewDelegate>

// 主模板
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSArray *modules;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI {
//    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.title = @"demo list";
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.tableView.frame = self.view.bounds;
}

#pragma mark - tableView datasource/delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.modules.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ModuleCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ModuleCell"];
        
    }
    Module *module = self.modules[indexPath.row];
    cell.textLabel.text = module.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Module *module = self.modules[indexPath.row];
    Class clazz = NSClassFromString(module.classStr);
    UIViewController *vc = [[clazz alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - setter/getter
- (NSArray *)modules {
    if (!_modules) {
        _modules = [Module modules];
    }
    return _modules;
}

#pragma mark - setter/getter

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:tableView];
        _tableView = tableView;
        tableView.rowHeight = 44;
    }
    return _tableView;
}

@end
