//
//  BERSearchWinningDealDataModel.h
//  Beero
//
//  Created by Chris Lin on 7/29/15.
//  Copyright (c) 2015 Beero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Global.h"
#import "BERStoreDataModel.h"

@interface BERSearchWinningDealDataModel : NSObject

@property (strong, nonatomic) NSString *m_szName;
@property int m_nQty;
@property int m_indexImage;
@property BERENUM_SEARCH_CONTAINERTYPE m_enumContainerType;
@property int m_nContainerSize;
@property float m_fPrice;
@property int m_nDrivingDistance;
@property int m_nDrivingTime;
@property BOOL m_isExclusive;
@property BERStoreDataModel *m_modelStore;

- (id) init;
- (void) setWithDictionary: (NSDictionary *) dict;
- (NSString *) getBeautifiedVolumeSpecification;
- (NSString *) getBeautifiedDriveDistance;

@end
