USE [master]
GO
/****** Object:  Database [RIDatabase]    Script Date: 23.01.2022 13:37:43 ******/
CREATE DATABASE [RIDatabase]
 WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS
GO
ALTER DATABASE [RIDatabase] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RIDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RIDatabase] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [RIDatabase] SET ANSI_NULLS ON 
GO
ALTER DATABASE [RIDatabase] SET ANSI_PADDING ON 
GO
ALTER DATABASE [RIDatabase] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [RIDatabase] SET ARITHABORT ON 
GO
ALTER DATABASE [RIDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RIDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RIDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RIDatabase] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [RIDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RIDatabase] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [RIDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RIDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RIDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RIDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RIDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RIDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RIDatabase] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [RIDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RIDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [RIDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RIDatabase] SET ENCRYPTION ON
GO
ALTER DATABASE [RIDatabase] SET QUERY_STORE = ON
GO
ALTER DATABASE [RIDatabase] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [RIDatabase]
GO
/****** Object:  Table [dbo].[Condition]    Script Date: 23.01.2022 13:37:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Condition](
	[Id] [int] NOT NULL,
	[StartStation] [int] NOT NULL,
	[EndStation] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Friction] [float] NOT NULL,
	[Evenness] [float] NOT NULL,
	[RutDepth] [float] NOT NULL,
	[CrackWidth] [float] NOT NULL,
	[RoadLaneKey] [nvarchar](50) NOT NULL,
	[InspID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Constructionproject]    Script Date: 23.01.2022 13:37:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Constructionproject](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[StartStation] [numeric](18, 0) NOT NULL,
	[EndStation] [numeric](18, 0) NOT NULL,
	[Projectname] [ntext] NOT NULL,
	[Year] [nchar](4) NOT NULL,
	[TrafficLoadingClass] [nvarchar](50) NOT NULL,
	[Methode] [nvarchar](50) NULL,
	[RoadLaneKey] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inspection]    Script Date: 23.01.2022 13:37:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inspection](
	[Id] [int] NOT NULL,
	[Organization] [nvarchar](50) NOT NULL,
	[MeasuringDevice] [nvarchar](50) NOT NULL,
	[Regulation] [nvarchar](50) NULL,
	[DesiredMeasureSpeed] [int] NULL,
	[RoadLaneKey] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Maintenanceplan]    Script Date: 23.01.2022 13:37:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maintenanceplan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PlanKey] [nvarchar](50) NOT NULL,
	[StartStation] [numeric](18, 0) NOT NULL,
	[EndStation] [numeric](18, 0) NOT NULL,
	[Planname] [ntext] NOT NULL,
	[Year] [nchar](4) NOT NULL,
	[Description] [text] NOT NULL,
	[Cost] [int] NOT NULL,
	[TrafficLoadingClass] [nvarchar](50) NOT NULL,
	[RoadLaneKey] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Maintenance] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pavementcomposition]    Script Date: 23.01.2022 13:37:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pavementcomposition](
	[Id] [int] NOT NULL,
	[WidthPavement] [int] NOT NULL,
	[WidthHardSurfacing] [int] NOT NULL,
	[Type_Layer1] [nvarchar](30) NULL,
	[Width_Layer1] [int] NULL,
	[Year_Layer1] [nvarchar](4) NULL,
	[Type_Layer2] [nvarchar](30) NULL,
	[Width_Layer2] [int] NULL,
	[Year_Layer2] [nvarchar](4) NULL,
	[Type_Layer3] [nvarchar](30) NULL,
	[Width_Layer3] [int] NULL,
	[Year_Layer3] [nvarchar](4) NULL,
	[Type_Layer4] [nvarchar](30) NULL,
	[Width_Layer4] [int] NULL,
	[Year_Layer4] [nvarchar](4) NULL,
	[Type_Layer5] [nvarchar](30) NULL,
	[Width_Layer5] [int] NULL,
	[Year_Layer5] [nvarchar](4) NULL,
	[Type_Layer6] [nvarchar](30) NULL,
	[Width_Layer6] [int] NULL,
	[Year_Layer6] [nvarchar](4) NULL,
	[Type_Layer7] [nvarchar](30) NULL,
	[Width_Layer7] [int] NULL,
	[Year_Layer7] [nvarchar](4) NULL,
	[RoadLaneKey] [nvarchar](50) NOT NULL,
	[StartStation] [numeric](18, 0) NOT NULL,
	[EndStation] [numeric](18, 0) NOT NULL,
	[ConstructionID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plannedcomposition]    Script Date: 23.01.2022 13:37:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plannedcomposition](
	[Id] [int] NOT NULL,
	[WidthPavement] [int] NOT NULL,
	[WidthHardSurfacing] [int] NOT NULL,
	[Type_Layer1] [nvarchar](30) NULL,
	[Width_Layer1] [int] NULL,
	[Type_Layer2] [nvarchar](30) NULL,
	[Width_Layer2] [int] NULL,
	[Type_Layer3] [nvarchar](30) NULL,
	[Width_Layer3] [int] NULL,
	[Type_Layer4] [nvarchar](30) NULL,
	[Width_Layer4] [int] NULL,
	[Type_Layer5] [nvarchar](30) NULL,
	[Width_Layer5] [int] NULL,
	[Type_Layer6] [nvarchar](30) NULL,
	[Width_Layer6] [int] NULL,
	[Type_Layer7] [nvarchar](30) NULL,
	[Width_Layer7] [int] NULL,
	[RoadLaneKey] [nvarchar](50) NOT NULL,
	[StartStation] [numeric](18, 0) NOT NULL,
	[EndStation] [numeric](18, 0) NOT NULL,
	[PlanKey] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roadnetwork]    Script Date: 23.01.2022 13:37:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roadnetwork](
	[ID] [int] NOT NULL,
	[RoadLaneKey] [nvarchar](50) NOT NULL,
	[RoadName] [nvarchar](50) NOT NULL,
	[TrafficAuthority] [nvarchar](50) NULL,
	[StartStation] [numeric](18, 0) NOT NULL,
	[EndStation] [numeric](18, 0) NOT NULL,
	[RoadLane] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Condition] ([Id], [StartStation], [EndStation], [Date], [Friction], [Evenness], [RutDepth], [CrackWidth], [RoadLaneKey], [InspID]) VALUES (41, 0, 100, CAST(N'2015-05-05' AS Date), 0.53, 0.5, 8.8, 3, N'NK1_NK2', 1)
INSERT [dbo].[Condition] ([Id], [StartStation], [EndStation], [Date], [Friction], [Evenness], [RutDepth], [CrackWidth], [RoadLaneKey], [InspID]) VALUES (42, 100, 200, CAST(N'2015-05-05' AS Date), 0.433, 0.47, 8.2, 0, N'NK1_NK2', 1)
INSERT [dbo].[Condition] ([Id], [StartStation], [EndStation], [Date], [Friction], [Evenness], [RutDepth], [CrackWidth], [RoadLaneKey], [InspID]) VALUES (43, 200, 300, CAST(N'2015-05-05' AS Date), 0.467, 0.47, 9, 0, N'NK1_NK2', 1)
INSERT [dbo].[Condition] ([Id], [StartStation], [EndStation], [Date], [Friction], [Evenness], [RutDepth], [CrackWidth], [RoadLaneKey], [InspID]) VALUES (44, 300, 400, CAST(N'2015-05-05' AS Date), 0.441, 0.73, 9.9, 0, N'NK1_NK2', 1)
INSERT [dbo].[Condition] ([Id], [StartStation], [EndStation], [Date], [Friction], [Evenness], [RutDepth], [CrackWidth], [RoadLaneKey], [InspID]) VALUES (45, 400, 500, CAST(N'2015-05-05' AS Date), 0.423, 1.11, 9.9, 0, N'NK1_NK2', 1)
INSERT [dbo].[Condition] ([Id], [StartStation], [EndStation], [Date], [Friction], [Evenness], [RutDepth], [CrackWidth], [RoadLaneKey], [InspID]) VALUES (46, 500, 600, CAST(N'2015-05-05' AS Date), 0.355, 0.7, 8.5, 0, N'NK1_NK2', 1)
INSERT [dbo].[Condition] ([Id], [StartStation], [EndStation], [Date], [Friction], [Evenness], [RutDepth], [CrackWidth], [RoadLaneKey], [InspID]) VALUES (47, 600, 700, CAST(N'2015-05-05' AS Date), 0.655, 0.22, 8, 0, N'NK1_NK2', 1)
INSERT [dbo].[Condition] ([Id], [StartStation], [EndStation], [Date], [Friction], [Evenness], [RutDepth], [CrackWidth], [RoadLaneKey], [InspID]) VALUES (48, 700, 800, CAST(N'2015-05-05' AS Date), 0.669, 0.47, 8.9, 0, N'NK1_NK2', 1)
INSERT [dbo].[Condition] ([Id], [StartStation], [EndStation], [Date], [Friction], [Evenness], [RutDepth], [CrackWidth], [RoadLaneKey], [InspID]) VALUES (49, 800, 900, CAST(N'2015-05-05' AS Date), 0.514, 0.48, 8.3, 0, N'NK1_NK2', 1)
INSERT [dbo].[Condition] ([Id], [StartStation], [EndStation], [Date], [Friction], [Evenness], [RutDepth], [CrackWidth], [RoadLaneKey], [InspID]) VALUES (50, 900, 1000, CAST(N'2015-05-05' AS Date), 0.565, 0.98, 8.3, 0, N'NK1_NK2', 1)
INSERT [dbo].[Condition] ([Id], [StartStation], [EndStation], [Date], [Friction], [Evenness], [RutDepth], [CrackWidth], [RoadLaneKey], [InspID]) VALUES (51, 0, 100, CAST(N'2020-08-26' AS Date), 0.439, 1.12, 15.3, 0, N'NK1_NK2', 2)
INSERT [dbo].[Condition] ([Id], [StartStation], [EndStation], [Date], [Friction], [Evenness], [RutDepth], [CrackWidth], [RoadLaneKey], [InspID]) VALUES (52, 100, 200, CAST(N'2020-08-26' AS Date), 0.42, 0.78, 14, 0, N'NK1_NK2', 2)
INSERT [dbo].[Condition] ([Id], [StartStation], [EndStation], [Date], [Friction], [Evenness], [RutDepth], [CrackWidth], [RoadLaneKey], [InspID]) VALUES (53, 200, 300, CAST(N'2020-08-26' AS Date), 0.448, 0.92, 11.6, 1.32, N'NK1_NK2', 2)
INSERT [dbo].[Condition] ([Id], [StartStation], [EndStation], [Date], [Friction], [Evenness], [RutDepth], [CrackWidth], [RoadLaneKey], [InspID]) VALUES (54, 300, 400, CAST(N'2020-08-26' AS Date), 0.405, 1.07, 13.6, 1.67, N'NK1_NK2', 2)
INSERT [dbo].[Condition] ([Id], [StartStation], [EndStation], [Date], [Friction], [Evenness], [RutDepth], [CrackWidth], [RoadLaneKey], [InspID]) VALUES (55, 400, 500, CAST(N'2020-08-26' AS Date), 0.434, 0.56, 16.8, 0, N'NK1_NK2', 2)
INSERT [dbo].[Condition] ([Id], [StartStation], [EndStation], [Date], [Friction], [Evenness], [RutDepth], [CrackWidth], [RoadLaneKey], [InspID]) VALUES (56, 500, 600, CAST(N'2020-08-26' AS Date), 0.365, 0.43, 15, 0, N'NK1_NK2', 2)
INSERT [dbo].[Condition] ([Id], [StartStation], [EndStation], [Date], [Friction], [Evenness], [RutDepth], [CrackWidth], [RoadLaneKey], [InspID]) VALUES (57, 600, 700, CAST(N'2020-08-26' AS Date), 0.373, 0.36, 14.4, 0.66, N'NK1_NK2', 2)
INSERT [dbo].[Condition] ([Id], [StartStation], [EndStation], [Date], [Friction], [Evenness], [RutDepth], [CrackWidth], [RoadLaneKey], [InspID]) VALUES (58, 700, 800, CAST(N'2020-08-26' AS Date), 0.444, 0.95, 11.5, 0, N'NK1_NK2', 2)
INSERT [dbo].[Condition] ([Id], [StartStation], [EndStation], [Date], [Friction], [Evenness], [RutDepth], [CrackWidth], [RoadLaneKey], [InspID]) VALUES (59, 800, 900, CAST(N'2020-08-26' AS Date), 0.384, 2.77, 10.1, 5.67, N'NK1_NK2', 2)
INSERT [dbo].[Condition] ([Id], [StartStation], [EndStation], [Date], [Friction], [Evenness], [RutDepth], [CrackWidth], [RoadLaneKey], [InspID]) VALUES (60, 900, 1000, CAST(N'2020-08-26' AS Date), 0.678, 3.01, 6.1, 11, N'NK1_NK2', 2)
GO
SET IDENTITY_INSERT [dbo].[Constructionproject] ON 

INSERT [dbo].[Constructionproject] ([ProjectID], [StartStation], [EndStation], [Projectname], [Year], [TrafficLoadingClass], [Methode], [RoadLaneKey]) VALUES (2, CAST(0 AS Numeric(18, 0)), CAST(1000 AS Numeric(18, 0)), N'Taltrasse A', N'1998', N'III', N'A', N'NK1_NK2')
INSERT [dbo].[Constructionproject] ([ProjectID], [StartStation], [EndStation], [Projectname], [Year], [TrafficLoadingClass], [Methode], [RoadLaneKey]) VALUES (3, CAST(850 AS Numeric(18, 0)), CAST(1000 AS Numeric(18, 0)), N'Deckschichterneuerung wegen Unfall', N'2015', N'III', N'A', N'NK1_NK2')
SET IDENTITY_INSERT [dbo].[Constructionproject] OFF
GO
INSERT [dbo].[Inspection] ([Id], [Organization], [MeasuringDevice], [Regulation], [DesiredMeasureSpeed], [RoadLaneKey]) VALUES (1, N' AN ZEB 2015', N'Messbalken, berührungslos', N'ZTV ZEB-StB 2006', 80, N'NK1_NK2')
INSERT [dbo].[Inspection] ([Id], [Organization], [MeasuringDevice], [Regulation], [DesiredMeasureSpeed], [RoadLaneKey]) VALUES (2, N'AN ZEB 2020', N'LIDAR', N'ZTV ZEB-StB 2006 (Stand 2018)', 80, N'NK1_NK2')
GO
SET IDENTITY_INSERT [dbo].[Maintenanceplan] ON 

INSERT [dbo].[Maintenanceplan] ([ID], [PlanKey], [StartStation], [EndStation], [Planname], [Year], [Description], [Cost], [TrafficLoadingClass], [RoadLaneKey]) VALUES (2, N'Plan2022_1', CAST(0 AS Numeric(18, 0)), CAST(750 AS Numeric(18, 0)), N'Deckschichterneuerung', N'2022', N'Deckschichterneuerung', 135000, N'III', N'NK1_NK2')
INSERT [dbo].[Maintenanceplan] ([ID], [PlanKey], [StartStation], [EndStation], [Planname], [Year], [Description], [Cost], [TrafficLoadingClass], [RoadLaneKey]) VALUES (3, N'Plan2025_1', CAST(750 AS Numeric(18, 0)), CAST(1000 AS Numeric(18, 0)), N'Ersatzneubau', N'2025', N'Grundhafte Erneuerung Taltrasse bei Astadt mit Anschlusssegment', 720000, N'BK32', N'NK1_NK2')
SET IDENTITY_INSERT [dbo].[Maintenanceplan] OFF
GO
INSERT [dbo].[Pavementcomposition] ([Id], [WidthPavement], [WidthHardSurfacing], [Type_Layer1], [Width_Layer1], [Year_Layer1], [Type_Layer2], [Width_Layer2], [Year_Layer2], [Type_Layer3], [Width_Layer3], [Year_Layer3], [Type_Layer4], [Width_Layer4], [Year_Layer4], [Type_Layer5], [Width_Layer5], [Year_Layer5], [Type_Layer6], [Width_Layer6], [Year_Layer6], [Type_Layer7], [Width_Layer7], [Year_Layer7], [RoadLaneKey], [StartStation], [EndStation], [ConstructionID]) VALUES (1, 70, 22, N'Deckschicht', 4, N'1998', N'Binderschicht', 8, N'1998', N'Tragschicht', 14, N'1998', N'Frostschutzschicht', 48, N'1998', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'NK1_NK2', CAST(0 AS Numeric(18, 0)), CAST(850 AS Numeric(18, 0)), 2)
INSERT [dbo].[Pavementcomposition] ([Id], [WidthPavement], [WidthHardSurfacing], [Type_Layer1], [Width_Layer1], [Year_Layer1], [Type_Layer2], [Width_Layer2], [Year_Layer2], [Type_Layer3], [Width_Layer3], [Year_Layer3], [Type_Layer4], [Width_Layer4], [Year_Layer4], [Type_Layer5], [Width_Layer5], [Year_Layer5], [Type_Layer6], [Width_Layer6], [Year_Layer6], [Type_Layer7], [Width_Layer7], [Year_Layer7], [RoadLaneKey], [StartStation], [EndStation], [ConstructionID]) VALUES (2, 70, 22, N'Deckschicht', 4, N'2015', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'NK1_NK2', CAST(850 AS Numeric(18, 0)), CAST(1000 AS Numeric(18, 0)), 3)
GO
INSERT [dbo].[Plannedcomposition] ([Id], [WidthPavement], [WidthHardSurfacing], [Type_Layer1], [Width_Layer1], [Type_Layer2], [Width_Layer2], [Type_Layer3], [Width_Layer3], [Type_Layer4], [Width_Layer4], [Type_Layer5], [Width_Layer5], [Type_Layer6], [Width_Layer6], [Type_Layer7], [Width_Layer7], [RoadLaneKey], [StartStation], [EndStation], [PlanKey]) VALUES (1, 70, 22, N'Deckschicht', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'NK1_NK2', CAST(0 AS Numeric(18, 0)), CAST(750 AS Numeric(18, 0)), N'Plan2022_1')
INSERT [dbo].[Plannedcomposition] ([Id], [WidthPavement], [WidthHardSurfacing], [Type_Layer1], [Width_Layer1], [Type_Layer2], [Width_Layer2], [Type_Layer3], [Width_Layer3], [Type_Layer4], [Width_Layer4], [Type_Layer5], [Width_Layer5], [Type_Layer6], [Width_Layer6], [Type_Layer7], [Width_Layer7], [RoadLaneKey], [StartStation], [EndStation], [PlanKey]) VALUES (2, 85, 30, N'Deckschicht', 4, N'Binderschicht', 8, N'Tragschicht', 18, N'Frostschutzschicht', 55, NULL, NULL, NULL, NULL, NULL, NULL, N'NK1_NK2', CAST(750 AS Numeric(18, 0)), CAST(1000 AS Numeric(18, 0)), N'Plan2025_1')
GO
INSERT [dbo].[Roadnetwork] ([ID], [RoadLaneKey], [RoadName], [TrafficAuthority], [StartStation], [EndStation], [RoadLane]) VALUES (1, N'NK1_NK2', N'B 20*45', N'RP Suedwest', CAST(0 AS Numeric(18, 0)), CAST(1000 AS Numeric(18, 0)), N'1')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AK_PlanKey]    Script Date: 23.01.2022 13:37:48 ******/
ALTER TABLE [dbo].[Maintenanceplan] ADD  CONSTRAINT [AK_PlanKey] UNIQUE NONCLUSTERED 
(
	[PlanKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AK_RoadLaneKey]    Script Date: 23.01.2022 13:37:48 ******/
ALTER TABLE [dbo].[Roadnetwork] ADD  CONSTRAINT [AK_RoadLaneKey] UNIQUE NONCLUSTERED 
(
	[RoadLaneKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Condition]  WITH CHECK ADD  CONSTRAINT [FK_Condition_ToInspection] FOREIGN KEY([InspID])
REFERENCES [dbo].[Inspection] ([Id])
GO
ALTER TABLE [dbo].[Condition] CHECK CONSTRAINT [FK_Condition_ToInspection]
GO
ALTER TABLE [dbo].[Condition]  WITH CHECK ADD  CONSTRAINT [FK_Condition_ToRoad] FOREIGN KEY([RoadLaneKey])
REFERENCES [dbo].[Roadnetwork] ([RoadLaneKey])
GO
ALTER TABLE [dbo].[Condition] CHECK CONSTRAINT [FK_Condition_ToRoad]
GO
ALTER TABLE [dbo].[Constructionproject]  WITH CHECK ADD  CONSTRAINT [FK_Construction_ToRoad] FOREIGN KEY([RoadLaneKey])
REFERENCES [dbo].[Roadnetwork] ([RoadLaneKey])
GO
ALTER TABLE [dbo].[Constructionproject] CHECK CONSTRAINT [FK_Construction_ToRoad]
GO
ALTER TABLE [dbo].[Inspection]  WITH CHECK ADD  CONSTRAINT [FK_Inspect_ToRoad] FOREIGN KEY([RoadLaneKey])
REFERENCES [dbo].[Roadnetwork] ([RoadLaneKey])
GO
ALTER TABLE [dbo].[Inspection] CHECK CONSTRAINT [FK_Inspect_ToRoad]
GO
ALTER TABLE [dbo].[Maintenanceplan]  WITH CHECK ADD  CONSTRAINT [FK_Plan_ToRoad] FOREIGN KEY([RoadLaneKey])
REFERENCES [dbo].[Roadnetwork] ([RoadLaneKey])
GO
ALTER TABLE [dbo].[Maintenanceplan] CHECK CONSTRAINT [FK_Plan_ToRoad]
GO
ALTER TABLE [dbo].[Pavementcomposition]  WITH CHECK ADD  CONSTRAINT [FK_Composition_ToProject] FOREIGN KEY([ConstructionID])
REFERENCES [dbo].[Constructionproject] ([ProjectID])
GO
ALTER TABLE [dbo].[Pavementcomposition] CHECK CONSTRAINT [FK_Composition_ToProject]
GO
ALTER TABLE [dbo].[Pavementcomposition]  WITH CHECK ADD  CONSTRAINT [FK_Composition_ToRoad] FOREIGN KEY([RoadLaneKey])
REFERENCES [dbo].[Roadnetwork] ([RoadLaneKey])
GO
ALTER TABLE [dbo].[Pavementcomposition] CHECK CONSTRAINT [FK_Composition_ToRoad]
GO
ALTER TABLE [dbo].[Plannedcomposition]  WITH CHECK ADD  CONSTRAINT [FK_PlanLayer_ToMaitenancePlan] FOREIGN KEY([PlanKey])
REFERENCES [dbo].[Maintenanceplan] ([PlanKey])
GO
ALTER TABLE [dbo].[Plannedcomposition] CHECK CONSTRAINT [FK_PlanLayer_ToMaitenancePlan]
GO
ALTER TABLE [dbo].[Plannedcomposition]  WITH CHECK ADD  CONSTRAINT [FK_PlanLayer_ToRoad] FOREIGN KEY([RoadLaneKey])
REFERENCES [dbo].[Roadnetwork] ([RoadLaneKey])
GO
ALTER TABLE [dbo].[Plannedcomposition] CHECK CONSTRAINT [FK_PlanLayer_ToRoad]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RoadID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Roadnetwork', @level2type=N'COLUMN',@level2name=N'ID'
GO
USE [master]
GO
ALTER DATABASE [RIDatabase] SET  READ_WRITE 
GO
