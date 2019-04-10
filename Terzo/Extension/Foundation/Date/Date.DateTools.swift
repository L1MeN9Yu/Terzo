//
//  Date.DateTools.swift
//
//  Created by Mengyu Li on 16/3/25.
//  Copyright © 2019 L1MeN9Yu. All rights reserved.
//

import Foundation

private let YearUnit = Calendar.Component.year
private let MonthUnit = Calendar.Component.month
private let DayUnit = Calendar.Component.day
private let HourUnit = Calendar.Component.hour
private let MinuteUnit = Calendar.Component.minute
private let secondUnit = Calendar.Component.second

private let AllUnits: Set<Calendar.Component> = [YearUnit, MonthUnit, DayUnit, HourUnit, MinuteUnit, secondUnit]
private let DayUnits: Set<Calendar.Component> = [YearUnit, MonthUnit, DayUnit]

extension Date {

    private static var calendar: Calendar {
        return Calendar.current
    }

    public init?(year: Int?,
                 month: Int?,
                 day: Int?) {
        self.init(year: year, month: month, day: day, hour: nil, minute: nil, second: nil)
    }

    public init?(hour: Int?,
                 minute: Int?,
                 second: Int?) {
        self.init(year: nil, month: nil, day: nil, hour: hour, minute: minute, second: second)
    }

    public init?(year: Int?,
                 month: Int?,
                 day: Int?,
                 hour: Int?,
                 minute: Int?,
                 second: Int?) {
        let components = DateComponents(year: year, month: month, day: day, hour: hour, minute: minute, second: second)
        guard let date = Date.calendar.date(from: components) else { return nil }
        self = date
    }

    public var components: DateComponents {
        return Date.calendar.dateComponents(AllUnits, from: self)
    }

    public func dateByAdding(years: Int? = nil,
                             months: Int? = nil,
                             days: Int? = nil,
                             hours: Int? = nil,
                             minutes: Int? = nil,
                             seconds: Int? = nil) -> Date? {
        let components = DateComponents(year: years, month: months, day: days, hour: hours, minute: minutes, second: seconds)

        return Date.calendar.date(byAdding: components, to: self)
    }

    public var year: Int? {
        return self.components.year
    }

    public var month: Int? {
        return self.components.month
    }

    public var day: Int? {
        return self.components.day
    }

    public var hour: Int? {
        return self.components.hour
    }

    public var minute: Int? {
        return self.components.minute
    }

    public var second: Int? {
        return self.components.second
    }

    public func isEarlierThanOrEqualTo(_ date: Date) -> Bool {
        if self.timeIntervalSince1970 <= date.timeIntervalSince1970 {
            return true
        }
        return false
    }

    public func isEarlierThan(_ date: Date) -> Bool {
        if self.timeIntervalSince1970 < date.timeIntervalSince1970 {
            return true
        }
        return false
    }

    public func isLaterThanOrEqualTo(_ date: Date) -> Bool {
        if self.timeIntervalSince1970 >= date.timeIntervalSince1970 {
            return true
        }
        return false
    }

    public func isLaterThan(_ date: Date) -> Bool {
        if self.timeIntervalSince1970 > date.timeIntervalSince1970 {
            return true
        }
        return false
    }

    public var isToday: Bool {
        let calendar = NSCalendar.current
        var components = calendar.dateComponents(DayUnits, from: Date())
        let today = calendar.date(from: components)
        components = calendar.dateComponents(DayUnits, from: self)
        let otherDate = calendar.date(from: components)
        return today == otherDate
    }

    public var isYesterday: Bool {
        let calendar = NSCalendar.current
        let todayComponents = calendar.dateComponents(DayUnits, from: Date())
        let todayDay = todayComponents.day ?? 0
        let dateComponents = calendar.dateComponents(DayUnits, from: self)
        let dateDay = dateComponents.day ?? 0
        return todayDay - dateDay == 1
    }


    public func isSameDay(date: Date) -> Bool {
        let calendar = NSCalendar.current
        let componentsOne = calendar.dateComponents(DayUnits, from: self)
        let dateOne = calendar.date(from: componentsOne)

        let componentsTwo = calendar.dateComponents(DayUnits, from: date)
        let dateTwo = calendar.date(from: componentsTwo)

        return dateOne == dateTwo
    }

    /// "yyyyMMdd"时间样式
    public var toYYYYMMDDString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let dateStr = formatter.string(from: self)
        return dateStr
    }

    //指定年月的开始日期
    public static func startOfMonth(year: Int, month: Int) -> Date {
        let calendar = Calendar.current
        var startComps = DateComponents()
        startComps.day = 1
        startComps.month = month
        startComps.year = year
        let startDate = calendar.date(from: startComps)
        return startDate ?? Date()
    }

    //指定年月的结束日期
    public static func endOfMonth(year: Int, month: Int, returnEndTime: Bool = false) -> Date {
        let calendar = Calendar.current
        var components = DateComponents()
        components.month = 1
        if returnEndTime {
            components.second = -1
        } else {
            components.day = -1
        }
        let endOfYear = calendar.date(byAdding: components, to: startOfMonth(year: year, month: month))
        return endOfYear ?? Date()
    }
}

extension Date {
    public func days(from date: Date) -> Int? {
        let components = Date.calendar.dateComponents([.day], from: self, to: date)
        return components.day
    }
}

extension Date {
    ///  get number of seconds between two date
    ///
    /// - Parameter date: date to compate self to.
    /// - Returns: number of seconds between self and given date.
    public func secondsSince(_ date: Date) -> Double {
        return timeIntervalSince(date)
    }

    ///  get number of minutes between two date
    ///
    /// - Parameter date: date to compate self to.
    /// - Returns: number of minutes between self and given date.
    public func minutesSince(_ date: Date) -> Double {
        return timeIntervalSince(date) / 60
    }

    ///  get number of hours between two date
    ///
    /// - Parameter date: date to compate self to.
    /// - Returns: number of hours between self and given date.
    public func hoursSince(_ date: Date) -> Double {
        return timeIntervalSince(date) / 3600
    }

    ///  get number of days between two date
    ///
    /// - Parameter date: date to compate self to.
    /// - Returns: number of days between self and given date.
    public func daysSince(_ date: Date) -> Double {
        return timeIntervalSince(date) / (3600 * 24)
    }
}