[DefaultOutputDestinationSettings = [DestinationDefinition = [Kind = "Reference", QueryName = "DefaultDestination", IsNewTarget = true], UpdateMethod = [Kind = "Replace"], DestinationTypeSettings = [Kind = "Table"]], StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Global_Supply_Chain_Risk_2026_DataDestination", IsNewTarget = true], Settings = [Kind = "Manual", AllowCreation = true, ColumnSettings = [Mappings = {[SourceColumnName = "Shipment_ID", DestinationColumnName = "Shipment_ID"], [SourceColumnName = "Date", DestinationColumnName = "Date"], [SourceColumnName = "Origin_Port", DestinationColumnName = "Origin_Port"], [SourceColumnName = "Destination_Port", DestinationColumnName = "Destination_Port"], [SourceColumnName = "Transport_Mode", DestinationColumnName = "Transport_Mode"], [SourceColumnName = "Product_Category", DestinationColumnName = "Product_Category"], [SourceColumnName = "Distance_km", DestinationColumnName = "Distance_km"], [SourceColumnName = "Weight_MT", DestinationColumnName = "Weight_MT"], [SourceColumnName = "Fuel_Price_Index", DestinationColumnName = "Fuel_Price_Index"], [SourceColumnName = "Geopolitical_Risk_Score", DestinationColumnName = "Geopolitical_Risk_Score"], [SourceColumnName = "Weather_Condition", DestinationColumnName = "Weather_Condition"], [SourceColumnName = "Carrier_Reliability_Score", DestinationColumnName = "Carrier_Reliability_Score"], [SourceColumnName = "Lead_Time_Days", DestinationColumnName = "Lead_Time_Days"], [SourceColumnName = "Disruption_Occurred", DestinationColumnName = "Disruption_Occurred"]}], DynamicSchema = true, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared Global_Supply_Chain_Risk_2026 = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "f96795bf-9182-428e-abca-0c9159674f2d"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "7ed5a142-0472-4653-9e62-32e4a64e775c"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "Files", ItemKind = "Folder"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Name = "global_supply_chain_risk_2026 2.csv"]}[Content],
  #"Imported CSV" = Csv.Document(#"Navigation 3", [Delimiter = ",", Columns = 14, QuoteStyle = QuoteStyle.None]),
  #"Promoted headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"Shipment_ID", type text}, {"Date", type date}, {"Origin_Port", type text}, {"Destination_Port", type text}, {"Transport_Mode", type text}, {"Product_Category", type text}, {"Distance_km", type number}, {"Weight_MT", type number}, {"Fuel_Price_Index", type number}, {"Geopolitical_Risk_Score", type number}, {"Weather_Condition", type text}, {"Carrier_Reliability_Score", type number}, {"Lead_Time_Days", type number}, {"Disruption_Occurred", Int64.Type}})
in
  #"Changed column type";
shared Global_Supply_Chain_Risk_2026_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = null]),
  Navigation_1 = Pattern{[workspaceId = "f96795bf-9182-428e-abca-0c9159674f2d"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "7ed5a142-0472-4653-9e62-32e4a64e775c"]}[Data],
  TableNavigation = Navigation_2{[Id = "Global_Supply_Chain_Risk_2026", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared DefaultDestination = Lakehouse.Contents([EnableFolding = false]){[workspaceId = "f96795bf-9182-428e-abca-0c9159674f2d"]}[Data]{[lakehouseId = "7ed5a142-0472-4653-9e62-32e4a64e775c"]}[Data];
[BindToDefaultDestination = true]
shared #"DimDate csv" = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "f96795bf-9182-428e-abca-0c9159674f2d"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "7ed5a142-0472-4653-9e62-32e4a64e775c"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "Files", ItemKind = "Folder"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Name = "DimDate.csv"]}[Content],
  #"Imported CSV" = Csv.Document(#"Navigation 3", [Delimiter = ",", Columns = 10, QuoteStyle = QuoteStyle.None]),
  #"Promoted headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"DateKey", Int64.Type}, {"Date", type date}, {"Year", Int64.Type}, {"Quarter", type text}, {"MonthNo", Int64.Type}, {"MonthName", type text}, {"YearMonth", type date}, {"WeekNo", Int64.Type}, {"Day", Int64.Type}, {"DayName", type text}})
in
  #"Changed column type";
[BindToDefaultDestination = true]
shared #"DimPort csv" = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "f96795bf-9182-428e-abca-0c9159674f2d"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "7ed5a142-0472-4653-9e62-32e4a64e775c"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "Files", ItemKind = "Folder"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Name = "DimPort.csv"]}[Content],
  #"Imported CSV" = Csv.Document(#"Navigation 3", [Delimiter = ",", Columns = 3, QuoteStyle = QuoteStyle.None]),
  #"Promoted headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"PortKey", Int64.Type}, {"PortName", type text}, {"PortRegion", type text}})
in
  #"Changed column type";
[BindToDefaultDestination = true]
shared #"DimProductCategory csv" = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "f96795bf-9182-428e-abca-0c9159674f2d"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "7ed5a142-0472-4653-9e62-32e4a64e775c"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "Files", ItemKind = "Folder"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Name = "DimProductCategory.csv"]}[Content],
  #"Imported CSV" = Csv.Document(#"Navigation 3", [Delimiter = ",", Columns = 3, QuoteStyle = QuoteStyle.None]),
  #"Promoted headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"ProductCategoryKey", Int64.Type}, {"Product_Category", type text}, {"CategoryGroup", type text}})
in
  #"Changed column type";
[BindToDefaultDestination = true]
shared #"DimTransportMode csv" = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "f96795bf-9182-428e-abca-0c9159674f2d"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "7ed5a142-0472-4653-9e62-32e4a64e775c"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "Files", ItemKind = "Folder"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Name = "DimTransportMode.csv"]}[Content],
  #"Imported CSV" = Csv.Document(#"Navigation 3", [Delimiter = ",", Columns = 3, QuoteStyle = QuoteStyle.None]),
  #"Promoted headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"TransportModeKey", Int64.Type}, {"Transport_Mode", type text}, {"ModeGroup", type text}})
in
  #"Changed column type";
[BindToDefaultDestination = true]
shared #"DimWeatherCondition csv" = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "f96795bf-9182-428e-abca-0c9159674f2d"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "7ed5a142-0472-4653-9e62-32e4a64e775c"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "Files", ItemKind = "Folder"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Name = "DimWeatherCondition.csv"]}[Content],
  #"Imported CSV" = Csv.Document(#"Navigation 3", [Delimiter = ",", Columns = 3, QuoteStyle = QuoteStyle.None]),
  #"Promoted headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"WeatherKey", Int64.Type}, {"Weather_Condition", type text}, {"WeatherSeverity", type text}})
in
  #"Changed column type";
