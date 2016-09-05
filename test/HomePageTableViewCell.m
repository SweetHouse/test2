//
//  HomePageTableViewCell.m
//  test
//
//  Created by MacBook on 16/9/2.
//  Copyright © 2016年 MacBook. All rights reserved.
//

#import "HomePageTableViewCell.h"
#import <Masonry.h>
#define MYBOUNDS ([[UIScreen mainScreen] bounds])//设备尺寸
#define MYWIDTH (MYBOUNDS.size.width)       //设备宽度
#define MYHEIGHT (MYBOUNDS.size.height)     //设备高度
#define MYCOLOR(R,G,B,a) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:a] //快捷颜色
@implementation HomePageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //view1
        UIView * view1 =  [[UIView alloc]initWithFrame:CGRectMake(0, 0, MYWIDTH, MYWIDTH/2)];
        view1.backgroundColor = [UIColor whiteColor];
        _view1Price = [UILabel new];
        [view1 addSubview:_view1Price];
        _view1Price.textColor = [UIColor blackColor];
        _view1Price.font = [UIFont systemFontOfSize:33];
        [_view1Price mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view1).with.offset(50);
            make.top.equalTo(view1).with.offset(65);
            
        }];

        
        
        _view1Certificate = [UILabel new];
        _view1Certificate.textColor = [UIColor blackColor];
        _view1Certificate.font = [UIFont systemFontOfSize:13];
        [view1 addSubview:_view1Certificate];
        [_view1Certificate mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view1).with.offset(50);
            make.top.equalTo(_view1Price.mas_bottom).with.offset(0);
        }];
        
        _view1Image = [UIImageView new];
        _view1Image.backgroundColor = MYCOLOR(222, 222, 222, 1);
        [view1 addSubview:_view1Image];
        [_view1Image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(view1.mas_right).with.offset(-20);
            make.top.equalTo(view1).with.offset(30);
            make.size.mas_equalTo(CGSizeMake(MYWIDTH/3, MYWIDTH/3));
        }];
        
        _view1BuyNow = [UIButton new];
        _view1BuyNow.backgroundColor = MYCOLOR(46, 166, 206, 1);
        _view1BuyNow.layer.masksToBounds = YES;
        _view1BuyNow.layer.cornerRadius = 3;
        [_view1BuyNow setTitle:@"立刻购买" forState:UIControlStateNormal];
        _view1BuyNow.titleLabel.font = [UIFont systemFontOfSize:14];
        [view1 addSubview:_view1BuyNow];
        [_view1BuyNow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view1).with.offset(123);
            make.left.equalTo(view1).with.offset(50);
            make.size.mas_equalTo(CGSizeMake(100, 23));
        }];
        
        [self.contentView addSubview:view1];
        
        //view2
        UIView * view2 =  [[UIView alloc]initWithFrame:CGRectMake(0, MYWIDTH/2, MYWIDTH, MYWIDTH/1.5)];
        view2.backgroundColor = MYCOLOR(238, 238, 238, 1);
        
        _view2Image = [UIImageView new];
        _view2Image.backgroundColor = MYCOLOR(222, 222, 222, 1);
        [view2 addSubview:_view2Image];
        [_view2Image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view2).with.offset(20);
            make.top.equalTo(view2).with.offset(50);
            make.size.mas_equalTo(CGSizeMake(MYWIDTH/2, MYWIDTH/2.3));
        }];
        
        _view2Name = [UILabel new];
        _view2Name.font = [UIFont systemFontOfSize:21];
        _view2Name.textColor = [UIColor blackColor];
        _view2Name.textAlignment = NSTextAlignmentRight;
        [view2 addSubview:_view2Name];
        [_view2Name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(view2.mas_right).with.offset(-20);
            make.top.equalTo(view2).with.offset(35);
            make.size.mas_equalTo(CGSizeMake(150, 30));
        }];
        
        _view2Formate = [UILabel new];
        _view2Formate.font = [UIFont systemFontOfSize:14];
        _view2Formate.textColor = [UIColor lightGrayColor];
        _view2Formate.textAlignment = NSTextAlignmentRight;
        [view2 addSubview:_view2Formate];
        [_view2Formate mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(view2.mas_right).with.offset(-20);
            make.top.equalTo(_view2Name.mas_bottom).offset(0);
        }];
        
        UILabel * yuan = [UILabel new];
        yuan.font = [UIFont systemFontOfSize:16];
        yuan.textColor = [UIColor darkGrayColor];
        yuan.textAlignment = NSTextAlignmentRight;
        yuan.text = @"元";
        [view2 addSubview:yuan];
        [yuan mas_makeConstraints:^(MASConstraintMaker *make) {
           make.right.equalTo(view2.mas_right).with.offset(-20);
            make.top.equalTo(_view2Formate.mas_bottom).offset(60);
        }];
        
        _view2Price = [UILabel new];
        _view2Price.font = [UIFont systemFontOfSize:33];
        _view2Price.textColor = MYCOLOR(215, 0, 0, 1);
        _view2Price.textAlignment = NSTextAlignmentRight;
        [view2 addSubview:_view2Price];
        [_view2Price mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(yuan.mas_left);
            make.bottom.equalTo(yuan.mas_bottom).offset(4);
        }];
        
        _view2BuyNow = [UIButton new];
        _view2BuyNow.backgroundColor = MYCOLOR(46, 166, 206, 1);
        _view2BuyNow.layer.masksToBounds = YES;
        _view2BuyNow.layer.cornerRadius = 3;
        [_view2BuyNow setTitle:@"立刻购买" forState:UIControlStateNormal];
        _view2BuyNow.titleLabel.font = [UIFont systemFontOfSize:14];
        [view2 addSubview:_view2BuyNow];
        [_view2BuyNow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_view2Price.mas_bottom).with.offset(20);
            make.right.equalTo(view2.mas_right).with.offset(-20);
            make.size.mas_equalTo(CGSizeMake(100, 23));
        }];
        
        [self.contentView addSubview:view2];
        
        //view3
        UIView * view3 =  [[UIView alloc]initWithFrame:CGRectMake(0, MYWIDTH*7/6, MYWIDTH, MYWIDTH/1.3)];
        view3.backgroundColor = MYCOLOR(232, 155, 66, 1);
        
        [self.contentView addSubview:view3];
        
    }
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    return self;
}
@end
