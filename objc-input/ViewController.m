//
//  ViewController.m
//  objc-input
//
//  Created by shunnamiki on 2021/07/14.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UITextField *textField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    // text field
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 200)];
    [self.view addSubview:_textField];
    [_textField setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_textField.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [_textField.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    [_textField.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:0.9].active = YES;
    _textField.backgroundColor = UIColor.lightGrayColor; // TODO:
    [_textField addTarget:self action:@selector(onChange:) forControlEvents:UIControlEventEditingChanged];
    
}

- (void) onChange:(UITextField *) sender
{
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:sender.text];
    NSString *string = [[NSString alloc] initWithString:sender.text];
    NSString *substring = @"red";
    
    NSRange searchRange = NSMakeRange(0, string.length);
    NSRange foundRange;
    while (searchRange.location < string.length) {
        searchRange.length = string.length - searchRange.location;
        foundRange = [string rangeOfString:substring options:NSCaseInsensitiveSearch range:searchRange];
        if (foundRange.location != NSNotFound) {
            // found an occurrence of the substring! do stuff here
            [text addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:1 green:0 blue:0 alpha:1] range:foundRange];
            
            // next step
            searchRange.location = foundRange.location+foundRange.length;
        } else {
            // no more substring to find
            break;
        }
    }
    
    _textField.attributedText = text;
}

@end
