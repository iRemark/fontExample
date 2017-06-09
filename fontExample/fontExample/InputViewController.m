//
//  InputViewController.m
//  fontExample
//
//  Created by lc-macbook pro on 2017/6/8.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "InputViewController.h"

@interface InputViewController ()

@property (nonatomic, strong) UITextView *textView;

@end

@implementation InputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
    self.view.backgroundColor = [UIColor whiteColor];
    [self.textView becomeFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - lazy load
- (UITextView *)textView {
    if (_textView == nil) {
        _textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 300)];
        _textView.center = self.view.center;
        
        _textView.font = [UIFont fontWithName:self.sendFont size:50];
        
        _textView.backgroundColor = [UIColor clearColor];
        _textView.textColor = [UIColor blackColor];
        
         [self.view addSubview:self.textView];
    }
    return _textView;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
