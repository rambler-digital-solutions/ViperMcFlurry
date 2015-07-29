//
//  RamblerTableViewAnimator.h
//  Pods
//
//  Created by Egor Tolstoy on 29/07/15.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RamblerTableViewAnimator : NSObject

+ (instancetype)objectWithTableView:(UITableView *)tableView;

/**
 *  @author Egor Tolstoy
 *
 *  Метод позволяет анимированно вставить/изменить/удалить ячейки таблицы.
 *
 *  @param insertedRowsIndexPaths Массив indexPath'ов вставленных ячеек
 *  @param insertingAnimation     Анимация вставки ячейки
 *  @param updatedRowsIndexPaths  Массив indexPath'ов обновленных ячеек
 *  @param updatingAnimation      Анимация обновления ячейки
 *  @param removedRowsIndexPaths  Массив indexPath'ов удаленных ячеек
 *  @param removingAnimation      Анимация удаления ячейки
 *  @param isBatchUpdate          Является ли обновление контента таблицы пакетным, т.е. требует ли дополнительных вызовов beginUpdates и endUpdates.
 */
- (void)animateTableViewWithInsertedRowsIndexPaths:(NSArray *)insertedRowsIndexPaths
                                     withAnimation:(UITableViewRowAnimation)insertingAnimation
                             updatedRowsIndexPaths:(NSArray *)updatedRowsIndexPaths
                                     withAnimation:(UITableViewRowAnimation)updatingAnimation
                             removedRowsIndexPaths:(NSArray *)removedRowsIndexPaths
                                     withAnimation:(UITableViewRowAnimation)removingAnimation
                                      batchUpdates:(BOOL)isBatchUpdate;

/**
 *  @author Egor Tolstoy
 *
 *  Метод аналогичен предыдущему с той разницей, что используется стандартный набор анимаций (Automatic/None/Fade соответственно)
 *
 *  @param insertedRowsIndexPaths Массив indexPath'ов вставленных ячеек
 *  @param updatedRowsIndexPaths  Массив indexPath'ов обновленных ячеек
 *  @param removedRowsIndexPaths  Массив indexPath'ов удаленных ячеек
 */
- (void)animateTableViewWithInsertedRowsIndexPaths:(NSArray *)insertedRowsIndexPaths
                             updatedRowsIndexPaths:(NSArray *)updatedRowsIndexPaths
                             removedRowsIndexPaths:(NSArray *)removedRowsIndexPaths
                                      batchUpdates:(BOOL)isBatchUpdate;

/**
 *  @author Egor Tolstoy
 *
 *  Метод позволяет анимированно вставить/изменить/удалить ячейки таблицы.
 *
 *  @param insertedSectionsIndexSet NSIndexSet вставляемых секций
 *  @param insertingAnimation       Анимация вставки секции
 *  @param updatedSectionsIndexSet  NSIndexSet обновляемых секций
 *  @param updatingAnimation        Анимация обновления секции
 *  @param removedSectionsIndexSet  NSIndexSet удаляемых секций
 *  @param removingAnimation        Анимация удаления секции
 *  @param isBatchUpdate            Является ли обновление контента таблицы пакетным, т.е. требует ли дополнительных вызовов beginUpdates и endUpdates.
 */
- (void)animateTableViewWithInsertedSectionsIndexSet:(NSIndexSet *)insertedSectionsIndexSet
                                       withAnimation:(UITableViewRowAnimation)insertingAnimation
                             updatedSectionsIndexSet:(NSIndexSet *)updatedSectionsIndexSet
                                       withAnimation:(UITableViewRowAnimation)updatingAnimation
                             removedSectionsIndexSet:(NSIndexSet *)removedSectionsIndexSet
                                       withAnimation:(UITableViewRowAnimation)removingAnimation
                                        batchUpdates:(BOOL)isBatchUpdate;

/**
 *  @author Egor Tolstoy
 *
 *  Метод аналогичен предыдущему с той разницей, что используется стандартный набор анимаций (Automatic/None/Fade соответственно)
 *
 *  @param insertedSectionsIndexSet NSIndexSet вставляемых секций
 *  @param updatedSectionsIndexSet  NSIndexSet обновляемых секций
 *  @param removedSectionsIndexSet  NSIndexSet удаляемых секций
 *  @param isBatchUpdate            Является ли обновление контента таблицы пакетным, т.е. требует ли дополнительных вызовов beginUpdates и endUpdates.
 */
- (void)animateTableViewWithInsertedSectionsIndexSet:(NSIndexSet *)insertedSectionsIndexSet
                             updatedSectionsIndexSet:(NSIndexSet *)updatedSectionsIndexSet
                             removedSectionsIndexSet:(NSIndexSet *)removedSectionsIndexSet
                                        batchUpdates:(BOOL)isBatchUpdate;

/**
 *  @author Egor Tolstoy
 *
 *  Метод вызывается перед началом анимаций таблицы
 */
- (void)beginTableViewUpdates;

/**
 *  @author Egor Tolstoy
 *
 *  Метод вызывается перед началом окончанием таблицы
 */
- (void)endTableViewUpdates;

/**
 *  @author Egor Tolstoy
 *
 *  Инициирует обновление таблицы
 */
- (void)redrawTableView;

@end