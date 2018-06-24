//
//  TimeStamp.swift
//  MeasurePoints
//
//  Created by Pedro Rivera on 6/5/18.
//  Copyright © 2018 sadcrow. All rights reserved.
//

import Foundation

struct MeasureReading: Codable {
    let Value: String?
    let ReadingDate: String?
    
    private enum CodingKeys: String, CodingKey {
        case Value = "value"
        case ReadingDate = "dateTime"
    }
}

struct MeasureInfo: Codable {
    let Values: [MeasureReading]?
    
    private enum CodingKeys: String, CodingKey {
        case Values = "value"
      
    }
}
//////////////////
struct RootObject: Codable {
    let DataValue: DataValue?
    private enum CodingKeys: String, CodingKey {
        case DataValue = "value"
    }
}


struct DataValue: Codable {
    let DetailInfo: [DetailInfo]?
    
    private enum CodingKeys: String, CodingKey {
        case DetailInfo = "timeSeries"
    }
}


struct DetailInfo : Codable {
    let ValuesM: [MeasureInfo]?
    let Name : String?
    
    private enum CodingKeys: String, CodingKey {
        case ValuesM = "values"
        case Name = "name"
    }
}

/*
struct Values : Codable {
    let Value : [MeasureInfo]?
    //let qualifier : [Qualifier]?
   // let qualityControlLevel : [String]?
   // let method : [Method]?
   // let source : [String]?
   // let offset : [String]?
   // let sample : [String]?
   // let censorCode : [String]?
    
    private enum CodingKeys: String, CodingKey {
        
        case Value = "value"
       // case qualifier = "qualifier"
       // case qualityControlLevel = "qualityControlLevel"
       // case method = "method"
       // case source = "source"
       // case offset = "offset"
       // case sample = "sample"
       // case censorCode = "censorCode"
    }
}
*/

/*
public class TimeSery
{
    public SourceInfo sourceInfo { get; set; } <--good also
    public Variable variable { get; set; }
    public List<Value2> values { get; set; }<------------
    public string name { get; set; }
}

//
//
//

//public class Criteria
{
    public string locationParam { get; set; }
    public string variableParam { get; set; }
    public List<object> parameter { get; set; }
}

public class Note
{
    public object value { get; set; }
    public string title { get; set; }
}



public class SiteCode
{
    public string value { get; set; }
    public string network { get; set; }
    public string agencyCode { get; set; }
}

public class DefaultTimeZone
{
    public string zoneOffset { get; set; }
    public string zoneAbbreviation { get; set; }
}

public class DaylightSavingsTimeZone
{
    public string zoneOffset { get; set; }
    public string zoneAbbreviation { get; set; }
}

public class TimeZoneInfo
{
    public DefaultTimeZone defaultTimeZone { get; set; }
    public DaylightSavingsTimeZone daylightSavingsTimeZone { get; set; }
    public bool siteUsesDaylightSavingsTime { get; set; }
}

public class GeogLocation
{
    public string srs { get; set; }
    public double latitude { get; set; }
    public double longitude { get; set; }
}

public class GeoLocation
{
    public GeogLocation geogLocation { get; set; }
    public List<object> localSiteXY { get; set; }
}

public class SiteProperty
{
    public string value { get; set; }
    public string name { get; set; }
}

public class SourceInfo
{
    public string siteName { get; set; }
    public List<SiteCode> siteCode { get; set; }
    public TimeZoneInfo timeZoneInfo { get; set; }
    public GeoLocation geoLocation { get; set; }
    public List<object> note { get; set; }
    public List<object> siteType { get; set; }
    public List<SiteProperty> siteProperty { get; set; }
}

public class VariableCode
{
    public string value { get; set; }
    public string network { get; set; }
    public string vocabulary { get; set; }
    public int variableID { get; set; }
    public bool @default { get; set; }
}

public class Unit
{
    public string unitCode { get; set; }
}

public class Option
{
    public string name { get; set; }
    public string optionCode { get; set; }
}

public class Options
{
    public List<Option> option { get; set; }
}

public class Variable
{
    public List<VariableCode> variableCode { get; set; }
    public string variableName { get; set; }
    public string variableDescription { get; set; }
    public string valueType { get; set; }
    public Unit unit { get; set; }
    public Options options { get; set; }
    public List<object> note { get; set; }
    public int noDataValue { get; set; }
    public List<object> variableProperty { get; set; }
    public string oid { get; set; }
}

public class Value3
{
    public string value { get; set; }
    public List<string> qualifiers { get; set; }
    public DateTime dateTime { get; set; }
}

public class Qualifier
{
    public string qualifierCode { get; set; }
    public string qualifierDescription { get; set; }
    public int qualifierID { get; set; }
    public string network { get; set; }
    public string vocabulary { get; set; }
}

public class Method
{
    public string methodDescription { get; set; }
    public int methodID { get; set; }
}

public class Value2
{
    public List<Value3> value { get; set; }
    public List<Qualifier> qualifier { get; set; }
    public List<object> qualityControlLevel { get; set; }
    public List<Method> method { get; set; }
    public List<object> source { get; set; }
    public List<object> offset { get; set; }
    public List<object> sample { get; set; }
    public List<object> censorCode { get; set; }
}

public class TimeSery
{
    public SourceInfo sourceInfo { get; set; }
    public Variable variable { get; set; }
    public List<Value2> values { get; set; }
    public string name { get; set; }
}

public class Value
{
    public QueryInfo queryInfo { get; set; }
    public List<TimeSery> timeSeries { get; set; }
}

public class RootObject
{
    public string name { get; set; }
    public string declaredType { get; set; }
    public string scope { get; set; }
    public Value value { get; set; }
    public bool nil { get; set; }
    public bool globalScope { get; set; }
    public bool typeSubstituted { get; set; }
}

*/
