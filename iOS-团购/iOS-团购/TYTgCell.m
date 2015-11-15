//
//  TYTgCell.m
//  iOS-团购
//
//  Created by terry on 15/11/9.
//  Copyright © 2015年 terry. All rights reserved.
//

#import "TYTgCell.h"
#import "TYTg.h"

@interface TYTgCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UILabel *priceView;
@property (weak, nonatomic) IBOutlet UILabel *buyCountView;

@end
@implementation TYTgCell
+(instancetype)cellWithTableView:(UITableView *)tableView
{

    static NSString *ID = @"tg";
    
    TYTgCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        //        从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TYTgCell" owner:nil options:nil] lastObject];
    }
    return cell;
}
- (void)setTg:(TYTg *)tg
{

    _tg = tg;
    //1.图片
    self.iconView.image = [UIImage imageNamed:tg.icon];
    
    //2.标题
    self.titleView.text = tg.title;
    //
    self.priceView.text = tg.price;
    self.buyCountView.text = [NSString stringWithFormat:@"%@人已购买",tg.buyCount];
}

@end
