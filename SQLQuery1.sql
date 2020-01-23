USE [master]
GO
/****** Object:  Database [MUSICSHOP]    Script Date: 12/24/2019 9:22:45 PM ******/
CREATE DATABASE [MUSICSHOP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MUSICSHOP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\MUSICSHOP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MUSICSHOP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\MUSICSHOP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MUSICSHOP] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MUSICSHOP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MUSICSHOP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MUSICSHOP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MUSICSHOP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MUSICSHOP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MUSICSHOP] SET ARITHABORT OFF 
GO
ALTER DATABASE [MUSICSHOP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MUSICSHOP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MUSICSHOP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MUSICSHOP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MUSICSHOP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MUSICSHOP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MUSICSHOP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MUSICSHOP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MUSICSHOP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MUSICSHOP] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MUSICSHOP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MUSICSHOP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MUSICSHOP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MUSICSHOP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MUSICSHOP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MUSICSHOP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MUSICSHOP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MUSICSHOP] SET RECOVERY FULL 
GO
ALTER DATABASE [MUSICSHOP] SET  MULTI_USER 
GO
ALTER DATABASE [MUSICSHOP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MUSICSHOP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MUSICSHOP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MUSICSHOP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MUSICSHOP] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MUSICSHOP', N'ON'
GO
ALTER DATABASE [MUSICSHOP] SET QUERY_STORE = OFF
GO
USE [MUSICSHOP]
GO
/****** Object:  Table [dbo].[ACCESSORIES]    Script Date: 12/24/2019 9:22:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACCESSORIES](
	[ID] [int] NOT NULL,
	[Type] [varchar](20) NULL,
 CONSTRAINT [Accessories_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ADDRESS]    Script Date: 12/24/2019 9:22:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADDRESS](
	[AddressID] [int] NOT NULL,
	[Country] [varchar](15) NULL,
	[City] [varchar](15) NULL,
	[StreetName] [varchar](15) NULL,
	[BuildingName] [varchar](15) NULL,
	[FlatNumber] [int] NULL,
	[PostCode] [int] NULL,
 CONSTRAINT [Address_PK] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CABLE]    Script Date: 12/24/2019 9:22:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CABLE](
	[ID] [int] NOT NULL,
	[Length] [int] NULL,
	[Type] [varchar](20) NULL,
 CONSTRAINT [Cable_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 12/24/2019 9:22:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](15) NULL,
	[Surname] [varchar](15) NULL,
	[EMail] [varchar](25) NULL,
	[PhoneNumber] [varchar](11) NULL,
 CONSTRAINT [Customer_PK] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMPLOYEE]    Script Date: 12/24/2019 9:22:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLOYEE](
	[SSN] [int] NOT NULL,
	[Name] [varchar](15) NULL,
	[Surname] [varchar](15) NULL,
	[BirthDay] [date] NULL,
	[Salary] [int] NULL,
	[TotalItemsSold] [int] NULL,
	[StoreID] [int] NULL,
	[Age]  AS (datediff(year,[BirthDay],getdate())),
 CONSTRAINT [Employee_PK] PRIMARY KEY CLUSTERED 
(
	[SSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FLUTE]    Script Date: 12/24/2019 9:22:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FLUTE](
	[ID] [int] NOT NULL,
	[Type] [varchar](12) NULL,
	[TypeOfMaterial] [varchar](12) NULL,
 CONSTRAINT [Flute_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GUITAR]    Script Date: 12/24/2019 9:22:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GUITAR](
	[ID] [int] NOT NULL,
	[Type] [varchar](12) NULL,
	[NumberOfStrings] [int] NULL,
	[TypeOfMaterial] [varchar](12) NULL,
 CONSTRAINT [Guitar_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INSTRUMENT]    Script Date: 12/24/2019 9:22:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INSTRUMENT](
	[ID] [int] NOT NULL,
	[Type] [varchar](25) NULL,
 CONSTRAINT [Instrument_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INSTRUMENTCASE]    Script Date: 12/24/2019 9:22:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INSTRUMENTCASE](
	[ID] [int] NOT NULL,
	[Type] [varchar](4) NULL,
	[TypeOfInstrument] [varchar](20) NULL,
 CONSTRAINT [InstrumentCase_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ITEM]    Script Date: 12/24/2019 9:22:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ITEM](
	[ID] [int] NOT NULL,
	[Price] [int] NULL,
	[ProductionDate] [date] NULL,
	[Condition] [varchar](12) NULL,
	[Brand] [varchar](20) NULL,
	[AddressID] [int] NULL,
	[OrderID] [int] NULL,
	[ItemName] [varchar](15) NULL,
 CONSTRAINT [Item_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[METRONOME]    Script Date: 12/24/2019 9:22:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[METRONOME](
	[ID] [int] NOT NULL,
	[Type] [varchar](10) NULL,
 CONSTRAINT [Metronome_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MUSICCD]    Script Date: 12/24/2019 9:22:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MUSICCD](
	[ID] [int] NOT NULL,
	[AlbumName] [varchar](20) NULL,
	[AuthorName] [varchar](20) NULL,
	[ReleaseDate] [date] NULL,
	[NumberOfSongs] [int] NULL,
 CONSTRAINT [MusicCd_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ONLINECUSTOMER]    Script Date: 12/24/2019 9:22:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ONLINECUSTOMER](
	[CustomerID] [int] IDENTITY(1001,1) NOT NULL,
	[Name] [varchar](15) NULL,
	[Surname] [varchar](15) NULL,
	[EMail] [varchar](25) NULL,
	[PhoneNumber] [varchar](11) NULL,
	[AddressID] [int] NULL,
	[UserName] [varchar](15) NULL,
	[Password] [varchar](15) NULL,
 CONSTRAINT [OnlineCustomer_PK] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OPENHOURS]    Script Date: 12/24/2019 9:22:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OPENHOURS](
	[StoreID] [int] NOT NULL,
	[OpeningHour] [int] NULL,
	[ClosingHour] [int] NULL,
 CONSTRAINT [OpenHours_PK] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDER_T]    Script Date: 12/24/2019 9:22:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDER_T](
	[OrderID] [int] NOT NULL,
	[Date] [date] NULL,
	[TotalPrice] [int] NULL,
	[CustomerID] [int] NULL,
	[AddressID] [int] NULL,
 CONSTRAINT [Order_PK] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PEDAL]    Script Date: 12/24/2019 9:22:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PEDAL](
	[ID] [int] NOT NULL,
	[Type] [varchar](20) NULL,
 CONSTRAINT [Pedal_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PIANO]    Script Date: 12/24/2019 9:22:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PIANO](
	[ID] [int] NOT NULL,
	[Type] [varchar](12) NULL,
	[NumberOfPedals] [int] NULL,
	[NumberOfOctave] [int] NULL,
	[TypeOfMaterial] [varchar](12) NULL,
 CONSTRAINT [Piano_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SOUNDSYSTEM]    Script Date: 12/24/2019 9:22:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SOUNDSYSTEM](
	[ID] [int] NOT NULL,
	[Watt] [int] NULL,
	[DeviceType] [varchar](20) NULL,
	[Type] [varchar](12) NULL,
 CONSTRAINT [SoundSystem_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STAND]    Script Date: 12/24/2019 9:22:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STAND](
	[ID] [int] NOT NULL,
	[Height] [int] NULL,
	[Type] [varchar](20) NULL,
 CONSTRAINT [Stand_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STORE]    Script Date: 12/24/2019 9:22:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STORE](
	[StoreID] [int] NOT NULL,
	[Capacity] [int] NULL,
	[Rent] [int] NULL,
	[AddressID] [int] NULL,
 CONSTRAINT [Store_PK] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STRING]    Script Date: 12/24/2019 9:22:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STRING](
	[ID] [int] NOT NULL,
	[Type] [varchar](20) NULL,
 CONSTRAINT [String_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUPLIER]    Script Date: 12/24/2019 9:22:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUPLIER](
	[SuplierID] [int] NOT NULL,
	[SupName] [varchar](20) NULL,
	[AddressID] [int] NULL,
 CONSTRAINT [Suplier_PK] PRIMARY KEY CLUSTERED 
(
	[SuplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUPLIES]    Script Date: 12/24/2019 9:22:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUPLIES](
	[SuplierID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[BasePrice] [int] NULL,
	[ShipmentDate] [date] NULL,
 CONSTRAINT [Suplies_PK] PRIMARY KEY CLUSTERED 
(
	[SuplierID] ASC,
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TUNER]    Script Date: 12/24/2019 9:22:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TUNER](
	[ID] [int] NOT NULL,
	[Type] [varchar](10) NULL,
 CONSTRAINT [Tuner_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VIOLIN]    Script Date: 12/24/2019 9:22:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VIOLIN](
	[ID] [int] NOT NULL,
	[Type] [varchar](12) NULL,
	[TypeOfMaterial] [varchar](12) NULL,
 CONSTRAINT [Violin_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ACCESSORIES] ([ID], [Type]) VALUES (15, N'case')
GO
INSERT [dbo].[ACCESSORIES] ([ID], [Type]) VALUES (16, N'case')
GO
INSERT [dbo].[ACCESSORIES] ([ID], [Type]) VALUES (17, N'metronome')
GO
INSERT [dbo].[ACCESSORIES] ([ID], [Type]) VALUES (18, N'metronome')
GO
INSERT [dbo].[ACCESSORIES] ([ID], [Type]) VALUES (19, N'tuner')
GO
INSERT [dbo].[ACCESSORIES] ([ID], [Type]) VALUES (20, N'tuner')
GO
INSERT [dbo].[ACCESSORIES] ([ID], [Type]) VALUES (21, N'stand')
GO
INSERT [dbo].[ACCESSORIES] ([ID], [Type]) VALUES (22, N'stand')
GO
INSERT [dbo].[ACCESSORIES] ([ID], [Type]) VALUES (23, N'cable')
GO
INSERT [dbo].[ACCESSORIES] ([ID], [Type]) VALUES (24, N'cable')
GO
INSERT [dbo].[ACCESSORIES] ([ID], [Type]) VALUES (25, N'string')
GO
INSERT [dbo].[ACCESSORIES] ([ID], [Type]) VALUES (26, N'string')
GO
INSERT [dbo].[ADDRESS] ([AddressID], [Country], [City], [StreetName], [BuildingName], [FlatNumber], [PostCode]) VALUES (1, N'TURKEY', N'EDIRNE', N'STREET', N'MENEKSE', 3, 22000)
GO
INSERT [dbo].[ADDRESS] ([AddressID], [Country], [City], [StreetName], [BuildingName], [FlatNumber], [PostCode]) VALUES (2, N'TURKEY', N'EDIRNE', N'STREET', N'GUL', 4, 22000)
GO
INSERT [dbo].[ADDRESS] ([AddressID], [Country], [City], [StreetName], [BuildingName], [FlatNumber], [PostCode]) VALUES (3, N'TURKEY', N'BURSA', N'STREET', N'MELISA', 17, 16000)
GO
INSERT [dbo].[ADDRESS] ([AddressID], [Country], [City], [StreetName], [BuildingName], [FlatNumber], [PostCode]) VALUES (4, N'TURKEY', N'SIVAS', N'STREET', N'KENT', 384, 58000)
GO
INSERT [dbo].[ADDRESS] ([AddressID], [Country], [City], [StreetName], [BuildingName], [FlatNumber], [PostCode]) VALUES (5, N'TURKEY', N'IZMIR', N'STREET', N'TERAS', 27, 35000)
GO
INSERT [dbo].[ADDRESS] ([AddressID], [Country], [City], [StreetName], [BuildingName], [FlatNumber], [PostCode]) VALUES (6, N'TURKEY', N'ISTANBUL', N'STREET', N'GUNES', 5, 3400)
GO
INSERT [dbo].[ADDRESS] ([AddressID], [Country], [City], [StreetName], [BuildingName], [FlatNumber], [PostCode]) VALUES (7, N'TURKEY', N'ISTANBUL', N'STREET', N'YASEMIN', 51, 3400)
GO
INSERT [dbo].[ADDRESS] ([AddressID], [Country], [City], [StreetName], [BuildingName], [FlatNumber], [PostCode]) VALUES (8, N'TURKEY', N'ANKARA', N'STREET', N'PAPATYA', 68, 6000)
GO
INSERT [dbo].[ADDRESS] ([AddressID], [Country], [City], [StreetName], [BuildingName], [FlatNumber], [PostCode]) VALUES (9, N'TURKEY', N'ANTALYA', N'STREET', N'NILUFER', 6, 7000)
GO
INSERT [dbo].[ADDRESS] ([AddressID], [Country], [City], [StreetName], [BuildingName], [FlatNumber], [PostCode]) VALUES (10, N'TURKEY', N'BATMAN', N'STREET', N'ERTAN', 1, 72000)
GO
INSERT [dbo].[ADDRESS] ([AddressID], [Country], [City], [StreetName], [BuildingName], [FlatNumber], [PostCode]) VALUES (11, N'TURKEY', N'ANKARA', N'STREET', N'KUSE IS HANI', 14, 6000)
GO
INSERT [dbo].[ADDRESS] ([AddressID], [Country], [City], [StreetName], [BuildingName], [FlatNumber], [PostCode]) VALUES (12, N'TURKEY', N'ISTANBUL', N'STREET', N'OZCAN IS HANI', 62, 34000)
GO
INSERT [dbo].[ADDRESS] ([AddressID], [Country], [City], [StreetName], [BuildingName], [FlatNumber], [PostCode]) VALUES (13, N'TURKEY', N'EDIRNE', N'STREET', N'DURMAZ IS HANI', 95, 22000)
GO
INSERT [dbo].[CABLE] ([ID], [Length], [Type]) VALUES (23, 6, N'aluminium')
GO
INSERT [dbo].[CABLE] ([ID], [Length], [Type]) VALUES (24, 3, N'gold')
GO
SET IDENTITY_INSERT [dbo].[CUSTOMER] ON 
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [Surname], [EMail], [PhoneNumber]) VALUES (1, N'Furkan', N'KUSE', N'furkankuse@hotmail.com', N'05340000001')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [Surname], [EMail], [PhoneNumber]) VALUES (2, N'Cansel', N'OZCAN', N'canselozcan@hotmail.com', N'05340000002')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [Surname], [EMail], [PhoneNumber]) VALUES (3, N'Metehan', N'ERTAN', N'metehanertan@hotmail.com', N'05340000003')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [Surname], [EMail], [PhoneNumber]) VALUES (4, N'Melisa', N'DONMEZ', N'melisadonmez@hotmail.com', N'05340000004')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [Surname], [EMail], [PhoneNumber]) VALUES (5, N'Furkan Kemal', N'DONME', N'izmirlum@hotmail.com', N'05340000005')
GO
SET IDENTITY_INSERT [dbo].[CUSTOMER] OFF
GO
INSERT [dbo].[EMPLOYEE] ([SSN], [Name], [Surname], [BirthDay], [Salary], [TotalItemsSold], [StoreID]) VALUES (1, N'KAAN', N'UCAR', CAST(N'1999-11-11' AS Date), 3200, 0, 1)
GO
INSERT [dbo].[EMPLOYEE] ([SSN], [Name], [Surname], [BirthDay], [Salary], [TotalItemsSold], [StoreID]) VALUES (2, N'GOKHAN', N'UCAR', CAST(N'1999-01-01' AS Date), 3000, 0, 3)
GO
INSERT [dbo].[EMPLOYEE] ([SSN], [Name], [Surname], [BirthDay], [Salary], [TotalItemsSold], [StoreID]) VALUES (3, N'GULCE', N'SIRVANCI', CAST(N'1998-02-02' AS Date), 2800, 0, 2)
GO
INSERT [dbo].[EMPLOYEE] ([SSN], [Name], [Surname], [BirthDay], [Salary], [TotalItemsSold], [StoreID]) VALUES (4, N'FURKAN', N'ARAS', CAST(N'1998-03-03' AS Date), 2000, 0, 5)
GO
INSERT [dbo].[EMPLOYEE] ([SSN], [Name], [Surname], [BirthDay], [Salary], [TotalItemsSold], [StoreID]) VALUES (5, N'EVRIM', N'SAHIN', CAST(N'1998-04-04' AS Date), 1000, 0, 4)
GO
INSERT [dbo].[FLUTE] ([ID], [Type], [TypeOfMaterial]) VALUES (5, N'pan', N'metal')
GO
INSERT [dbo].[FLUTE] ([ID], [Type], [TypeOfMaterial]) VALUES (6, N'side-blow', N'plastic')
GO
INSERT [dbo].[GUITAR] ([ID], [Type], [NumberOfStrings], [TypeOfMaterial]) VALUES (1, N'classic', 6, N'wood')
GO
INSERT [dbo].[GUITAR] ([ID], [Type], [NumberOfStrings], [TypeOfMaterial]) VALUES (2, N'ukulele', 4, N'metal')
GO
INSERT [dbo].[INSTRUMENT] ([ID], [Type]) VALUES (1, N'bowed stringed instrument')
GO
INSERT [dbo].[INSTRUMENT] ([ID], [Type]) VALUES (2, N'bowed stringed instrument')
GO
INSERT [dbo].[INSTRUMENT] ([ID], [Type]) VALUES (3, N'bowed stringed instrument')
GO
INSERT [dbo].[INSTRUMENT] ([ID], [Type]) VALUES (4, N'bowed stringed instrument')
GO
INSERT [dbo].[INSTRUMENT] ([ID], [Type]) VALUES (5, N'wind instrument')
GO
INSERT [dbo].[INSTRUMENT] ([ID], [Type]) VALUES (6, N'wind instrument')
GO
INSERT [dbo].[INSTRUMENT] ([ID], [Type]) VALUES (7, N'clavier')
GO
INSERT [dbo].[INSTRUMENT] ([ID], [Type]) VALUES (8, N'clavier')
GO
INSERT [dbo].[INSTRUMENTCASE] ([ID], [Type], [TypeOfInstrument]) VALUES (15, N'hard', N'bass guitar')
GO
INSERT [dbo].[INSTRUMENTCASE] ([ID], [Type], [TypeOfInstrument]) VALUES (16, N'soft', N'flute')
GO
INSERT [dbo].[ITEM] ([ID], [Price], [ProductionDate], [Condition], [Brand], [AddressID], [OrderID], [ItemName]) VALUES (1, 1100, CAST(N'2017-05-07' AS Date), N'unused', N'Cort', 12, 1000000, N'WARBEAST')
GO
INSERT [dbo].[ITEM] ([ID], [Price], [ProductionDate], [Condition], [Brand], [AddressID], [OrderID], [ItemName]) VALUES (2, 220, CAST(N'2017-05-07' AS Date), N'unused', N'Kawai', 11, NULL, N'A5PLUS')
GO
INSERT [dbo].[ITEM] ([ID], [Price], [ProductionDate], [Condition], [Brand], [AddressID], [OrderID], [ItemName]) VALUES (3, 770, CAST(N'2016-10-12' AS Date), N'unused', N'Cort', 11, 1000000, N'SCFF')
GO
INSERT [dbo].[ITEM] ([ID], [Price], [ProductionDate], [Condition], [Brand], [AddressID], [OrderID], [ItemName]) VALUES (4, 660, CAST(N'2016-12-08' AS Date), N'unused', N'Ephipone', 11, NULL, N'CUSTOM')
GO
INSERT [dbo].[ITEM] ([ID], [Price], [ProductionDate], [Condition], [Brand], [AddressID], [OrderID], [ItemName]) VALUES (5, 990, CAST(N'2009-03-03' AS Date), N'unused', N'Cort', 12, NULL, N'STANDART')
GO
INSERT [dbo].[ITEM] ([ID], [Price], [ProductionDate], [Condition], [Brand], [AddressID], [OrderID], [ItemName]) VALUES (6, 770, CAST(N'2016-04-09' AS Date), N'unused', N'Kawai', 13, NULL, N'TOBY')
GO
INSERT [dbo].[ITEM] ([ID], [Price], [ProductionDate], [Condition], [Brand], [AddressID], [OrderID], [ItemName]) VALUES (7, 880, CAST(N'2019-10-10' AS Date), N'unused', N'Kawai', 13, 1000002, N'AU01L')
GO
INSERT [dbo].[ITEM] ([ID], [Price], [ProductionDate], [Condition], [Brand], [AddressID], [OrderID], [ItemName]) VALUES (8, 550, CAST(N'2019-09-11' AS Date), N'unused', N'Ephipone', 13, NULL, N'DJ25')
GO
INSERT [dbo].[ITEM] ([ID], [Price], [ProductionDate], [Condition], [Brand], [AddressID], [OrderID], [ItemName]) VALUES (9, 660, CAST(N'2017-06-11' AS Date), N'unused', N'Ephipone', 12, NULL, N'CLP-645PE')
GO
INSERT [dbo].[ITEM] ([ID], [Price], [ProductionDate], [Condition], [Brand], [AddressID], [OrderID], [ItemName]) VALUES (10, 440, CAST(N'2015-04-03' AS Date), N'unused', N'Kawai', 12, 1000001, N'P115')
GO
INSERT [dbo].[ITEM] ([ID], [Price], [ProductionDate], [Condition], [Brand], [AddressID], [OrderID], [ItemName]) VALUES (11, 110, CAST(N'2014-05-01' AS Date), N'unused', N'Cort', 11, NULL, N'MODEL1')
GO
INSERT [dbo].[ITEM] ([ID], [Price], [ProductionDate], [Condition], [Brand], [AddressID], [OrderID], [ItemName]) VALUES (12, 550, CAST(N'2013-02-09' AS Date), N'unused', N'Ephipone', 11, NULL, N'S100BK')
GO
INSERT [dbo].[ITEM] ([ID], [Price], [ProductionDate], [Condition], [Brand], [AddressID], [OrderID], [ItemName]) VALUES (13, 770, CAST(N'2019-02-28' AS Date), N'unused', N'Cort', 11, NULL, N'SK460')
GO
INSERT [dbo].[ITEM] ([ID], [Price], [ProductionDate], [Condition], [Brand], [AddressID], [OrderID], [ItemName]) VALUES (14, 110, CAST(N'1999-02-06' AS Date), N'unused', N'Cort', 11, NULL, N'DS-1X')
GO
INSERT [dbo].[ITEM] ([ID], [Price], [ProductionDate], [Condition], [Brand], [AddressID], [OrderID], [ItemName]) VALUES (15, 330, CAST(N'2013-12-09' AS Date), N'unused', N'Cort', 11, NULL, N'TS808DX')
GO
INSERT [dbo].[ITEM] ([ID], [Price], [ProductionDate], [Condition], [Brand], [AddressID], [OrderID], [ItemName]) VALUES (16, 660, CAST(N'2016-02-10' AS Date), N'unused', N'Kawai', 11, NULL, N'FV-30H')
GO
INSERT [dbo].[ITEM] ([ID], [Price], [ProductionDate], [Condition], [Brand], [AddressID], [OrderID], [ItemName]) VALUES (17, 880, CAST(N'2013-06-20' AS Date), N'unused', N'Ephipone', 11, NULL, N'CR32PK')
GO
INSERT [dbo].[ITEM] ([ID], [Price], [ProductionDate], [Condition], [Brand], [AddressID], [OrderID], [ItemName]) VALUES (18, 220, CAST(N'2015-02-15' AS Date), N'unused', N'Cort', 11, NULL, N'FL4116S')
GO
INSERT [dbo].[ITEM] ([ID], [Price], [ProductionDate], [Condition], [Brand], [AddressID], [OrderID], [ItemName]) VALUES (19, 330, CAST(N'2013-02-11' AS Date), N'unused', N'Kawai', 11, NULL, N'PLCLP25')
GO
INSERT [dbo].[ITEM] ([ID], [Price], [ProductionDate], [Condition], [Brand], [AddressID], [OrderID], [ItemName]) VALUES (20, 660, CAST(N'2013-01-12' AS Date), N'unused', N'Cort', 11, NULL, N'HT15')
GO
INSERT [dbo].[ITEM] ([ID], [Price], [ProductionDate], [Condition], [Brand], [AddressID], [OrderID], [ItemName]) VALUES (21, 990, CAST(N'2015-12-13' AS Date), N'unused', N'Ephipone', 11, NULL, N'BGS-21A')
GO
INSERT [dbo].[ITEM] ([ID], [Price], [ProductionDate], [Condition], [Brand], [AddressID], [OrderID], [ItemName]) VALUES (22, 110, CAST(N'2005-05-16' AS Date), N'unused', N'Cort', 11, NULL, N'BULL')
GO
INSERT [dbo].[ITEM] ([ID], [Price], [ProductionDate], [Condition], [Brand], [AddressID], [OrderID], [ItemName]) VALUES (23, 330, CAST(N'2004-05-16' AS Date), N'unused', N'Cort', 11, NULL, N'A60')
GO
INSERT [dbo].[ITEM] ([ID], [Price], [ProductionDate], [Condition], [Brand], [AddressID], [OrderID], [ItemName]) VALUES (24, 330, CAST(N'2013-02-18' AS Date), N'unused', N'Kawai', 11, NULL, N'P20N')
GO
INSERT [dbo].[ITEM] ([ID], [Price], [ProductionDate], [Condition], [Brand], [AddressID], [OrderID], [ItemName]) VALUES (25, 660, CAST(N'2002-06-23' AS Date), N'unused', N'Cort', 11, NULL, N'DR30')
GO
INSERT [dbo].[ITEM] ([ID], [Price], [ProductionDate], [Condition], [Brand], [AddressID], [OrderID], [ItemName]) VALUES (26, 440, CAST(N'2013-04-17' AS Date), N'unused', N'Ephipone', 11, NULL, N'DH-20')
GO
INSERT [dbo].[METRONOME] ([ID], [Type]) VALUES (17, N'mechanic')
GO
INSERT [dbo].[METRONOME] ([ID], [Type]) VALUES (18, N'electronic')
GO
INSERT [dbo].[MUSICCD] ([ID], [AlbumName], [AuthorName], [ReleaseDate], [NumberOfSongs]) VALUES (13, N'FOREVER', N'METE', CAST(N'2019-02-28' AS Date), 2)
GO
INSERT [dbo].[MUSICCD] ([ID], [AlbumName], [AuthorName], [ReleaseDate], [NumberOfSongs]) VALUES (14, N'ME', N'MINE', CAST(N'1999-02-06' AS Date), 20)
GO
SET IDENTITY_INSERT [dbo].[ONLINECUSTOMER] ON 
GO
INSERT [dbo].[ONLINECUSTOMER] ([CustomerID], [Name], [Surname], [EMail], [PhoneNumber], [AddressID], [UserName], [Password]) VALUES (1001, N'Emre', N'YIGIT', N'emreygt@gmail.com', N'0534000007', 1, N'emre', N'emreyigit')
GO
INSERT [dbo].[ONLINECUSTOMER] ([CustomerID], [Name], [Surname], [EMail], [PhoneNumber], [AddressID], [UserName], [Password]) VALUES (1002, N'Ertugrul', N'SAGDIC', N'ert@gmail.com', N'0534000008', 2, N'ert', N'ertsag')
GO
INSERT [dbo].[ONLINECUSTOMER] ([CustomerID], [Name], [Surname], [EMail], [PhoneNumber], [AddressID], [UserName], [Password]) VALUES (1003, N'Faruk', N'COLAK', N'farkclk@gmail.com', N'0534000009', 3, N'faruk', N'farukcolak')
GO
INSERT [dbo].[ONLINECUSTOMER] ([CustomerID], [Name], [Surname], [EMail], [PhoneNumber], [AddressID], [UserName], [Password]) VALUES (1004, N'Murat', N'SENOL', N'moruque@gmail.com', N'0534000010', 4, N'murat', N'fabulouse')
GO
INSERT [dbo].[ONLINECUSTOMER] ([CustomerID], [Name], [Surname], [EMail], [PhoneNumber], [AddressID], [UserName], [Password]) VALUES (1005, N'Berk', N'KOYLU', N'koylubrk@gmail.com', N'0534000011', 5, N'berk', N'datadankalan')
GO
INSERT [dbo].[ONLINECUSTOMER] ([CustomerID], [Name], [Surname], [EMail], [PhoneNumber], [AddressID], [UserName], [Password]) VALUES (1007, N'a', N'a', N'c@d.com', N'123', 1, N'a', N'b')
GO
SET IDENTITY_INSERT [dbo].[ONLINECUSTOMER] OFF
GO
INSERT [dbo].[OPENHOURS] ([StoreID], [OpeningHour], [ClosingHour]) VALUES (1, 9, 18)
GO
INSERT [dbo].[OPENHOURS] ([StoreID], [OpeningHour], [ClosingHour]) VALUES (2, 9, 20)
GO
INSERT [dbo].[OPENHOURS] ([StoreID], [OpeningHour], [ClosingHour]) VALUES (3, 11, 21)
GO
INSERT [dbo].[OPENHOURS] ([StoreID], [OpeningHour], [ClosingHour]) VALUES (4, 13, 24)
GO
INSERT [dbo].[OPENHOURS] ([StoreID], [OpeningHour], [ClosingHour]) VALUES (5, 9, 20)
GO
INSERT [dbo].[ORDER_T] ([OrderID], [Date], [TotalPrice], [CustomerID], [AddressID]) VALUES (1000000, CAST(N'2018-08-08' AS Date), 1870, 1001, 1)
GO
INSERT [dbo].[ORDER_T] ([OrderID], [Date], [TotalPrice], [CustomerID], [AddressID]) VALUES (1000001, CAST(N'2018-09-09' AS Date), 1320, 1003, 3)
GO
INSERT [dbo].[ORDER_T] ([OrderID], [Date], [TotalPrice], [CustomerID], [AddressID]) VALUES (1000002, CAST(N'2018-10-10' AS Date), 0, 1001, 1)
GO
INSERT [dbo].[PEDAL] ([ID], [Type]) VALUES (11, N'distortion')
GO
INSERT [dbo].[PEDAL] ([ID], [Type]) VALUES (12, N'delay')
GO
INSERT [dbo].[PIANO] ([ID], [Type], [NumberOfPedals], [NumberOfOctave], [TypeOfMaterial]) VALUES (7, N'electronic', 3, 8, N'wood')
GO
INSERT [dbo].[PIANO] ([ID], [Type], [NumberOfPedals], [NumberOfOctave], [TypeOfMaterial]) VALUES (8, N'grand piano', 4, 9, N'wood')
GO
INSERT [dbo].[SOUNDSYSTEM] ([ID], [Watt], [DeviceType], [Type]) VALUES (9, 15, N'amplifier', N'electro')
GO
INSERT [dbo].[SOUNDSYSTEM] ([ID], [Watt], [DeviceType], [Type]) VALUES (10, 35, N'speaker', N'power')
GO
INSERT [dbo].[STAND] ([ID], [Height], [Type]) VALUES (21, 1, N'guitar')
GO
INSERT [dbo].[STAND] ([ID], [Height], [Type]) VALUES (22, 2, N'microphone')
GO
INSERT [dbo].[STORE] ([StoreID], [Capacity], [Rent], [AddressID]) VALUES (1, 300, 300, 6)
GO
INSERT [dbo].[STORE] ([StoreID], [Capacity], [Rent], [AddressID]) VALUES (2, 400, 400, 7)
GO
INSERT [dbo].[STORE] ([StoreID], [Capacity], [Rent], [AddressID]) VALUES (3, 430, 430, 8)
GO
INSERT [dbo].[STORE] ([StoreID], [Capacity], [Rent], [AddressID]) VALUES (4, 380, 380, 9)
GO
INSERT [dbo].[STORE] ([StoreID], [Capacity], [Rent], [AddressID]) VALUES (5, 200, 200, 10)
GO
INSERT [dbo].[STRING] ([ID], [Type]) VALUES (25, N'bass')
GO
INSERT [dbo].[STRING] ([ID], [Type]) VALUES (26, N'ukulele')
GO
INSERT [dbo].[SUPLIER] ([SuplierID], [SupName], [AddressID]) VALUES (1, N'Cort', 11)
GO
INSERT [dbo].[SUPLIER] ([SuplierID], [SupName], [AddressID]) VALUES (2, N'Ephiphone', 12)
GO
INSERT [dbo].[SUPLIER] ([SuplierID], [SupName], [AddressID]) VALUES (3, N'Kawai', 13)
GO
INSERT [dbo].[SUPLIES] ([SuplierID], [ItemID], [BasePrice], [ShipmentDate]) VALUES (1, 1, 1000, CAST(N'2017-05-07' AS Date))
GO
INSERT [dbo].[SUPLIES] ([SuplierID], [ItemID], [BasePrice], [ShipmentDate]) VALUES (3, 2, 200, CAST(N'2017-05-07' AS Date))
GO
INSERT [dbo].[TUNER] ([ID], [Type]) VALUES (19, N'chromatic')
GO
INSERT [dbo].[TUNER] ([ID], [Type]) VALUES (20, N'digital')
GO
INSERT [dbo].[VIOLIN] ([ID], [Type], [TypeOfMaterial]) VALUES (3, N'classic', N'wood')
GO
INSERT [dbo].[VIOLIN] ([ID], [Type], [TypeOfMaterial]) VALUES (4, N'electro', N'glass')
GO
ALTER TABLE [dbo].[ORDER_T] ADD  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[ACCESSORIES]  WITH CHECK ADD  CONSTRAINT [Accessories_FK] FOREIGN KEY([ID])
REFERENCES [dbo].[ITEM] ([ID])
GO
ALTER TABLE [dbo].[ACCESSORIES] CHECK CONSTRAINT [Accessories_FK]
GO
ALTER TABLE [dbo].[CABLE]  WITH CHECK ADD  CONSTRAINT [Cable_FK] FOREIGN KEY([ID])
REFERENCES [dbo].[ACCESSORIES] ([ID])
GO
ALTER TABLE [dbo].[CABLE] CHECK CONSTRAINT [Cable_FK]
GO
ALTER TABLE [dbo].[EMPLOYEE]  WITH CHECK ADD  CONSTRAINT [Employee_FK] FOREIGN KEY([StoreID])
REFERENCES [dbo].[STORE] ([StoreID])
GO
ALTER TABLE [dbo].[EMPLOYEE] CHECK CONSTRAINT [Employee_FK]
GO
ALTER TABLE [dbo].[FLUTE]  WITH CHECK ADD  CONSTRAINT [Flute_FK] FOREIGN KEY([ID])
REFERENCES [dbo].[INSTRUMENT] ([ID])
GO
ALTER TABLE [dbo].[FLUTE] CHECK CONSTRAINT [Flute_FK]
GO
ALTER TABLE [dbo].[GUITAR]  WITH CHECK ADD  CONSTRAINT [Guitar_FK] FOREIGN KEY([ID])
REFERENCES [dbo].[INSTRUMENT] ([ID])
GO
ALTER TABLE [dbo].[GUITAR] CHECK CONSTRAINT [Guitar_FK]
GO
ALTER TABLE [dbo].[INSTRUMENT]  WITH CHECK ADD  CONSTRAINT [Instrument_FK] FOREIGN KEY([ID])
REFERENCES [dbo].[ITEM] ([ID])
GO
ALTER TABLE [dbo].[INSTRUMENT] CHECK CONSTRAINT [Instrument_FK]
GO
ALTER TABLE [dbo].[INSTRUMENTCASE]  WITH CHECK ADD  CONSTRAINT [InstrumentCase_FK] FOREIGN KEY([ID])
REFERENCES [dbo].[ACCESSORIES] ([ID])
GO
ALTER TABLE [dbo].[INSTRUMENTCASE] CHECK CONSTRAINT [InstrumentCase_FK]
GO
ALTER TABLE [dbo].[ITEM]  WITH CHECK ADD  CONSTRAINT [Item_FK1] FOREIGN KEY([AddressID])
REFERENCES [dbo].[ADDRESS] ([AddressID])
GO
ALTER TABLE [dbo].[ITEM] CHECK CONSTRAINT [Item_FK1]
GO
ALTER TABLE [dbo].[ITEM]  WITH CHECK ADD  CONSTRAINT [Item_FK2] FOREIGN KEY([OrderID])
REFERENCES [dbo].[ORDER_T] ([OrderID])
GO
ALTER TABLE [dbo].[ITEM] CHECK CONSTRAINT [Item_FK2]
GO
ALTER TABLE [dbo].[METRONOME]  WITH CHECK ADD  CONSTRAINT [Metronome_FK] FOREIGN KEY([ID])
REFERENCES [dbo].[ACCESSORIES] ([ID])
GO
ALTER TABLE [dbo].[METRONOME] CHECK CONSTRAINT [Metronome_FK]
GO
ALTER TABLE [dbo].[MUSICCD]  WITH CHECK ADD  CONSTRAINT [MusicCd_FK] FOREIGN KEY([ID])
REFERENCES [dbo].[ITEM] ([ID])
GO
ALTER TABLE [dbo].[MUSICCD] CHECK CONSTRAINT [MusicCd_FK]
GO
ALTER TABLE [dbo].[ONLINECUSTOMER]  WITH CHECK ADD  CONSTRAINT [OnlineCustomer_FK] FOREIGN KEY([AddressID])
REFERENCES [dbo].[ADDRESS] ([AddressID])
GO
ALTER TABLE [dbo].[ONLINECUSTOMER] CHECK CONSTRAINT [OnlineCustomer_FK]
GO
ALTER TABLE [dbo].[OPENHOURS]  WITH CHECK ADD  CONSTRAINT [OpenHours_FK] FOREIGN KEY([StoreID])
REFERENCES [dbo].[STORE] ([StoreID])
GO
ALTER TABLE [dbo].[OPENHOURS] CHECK CONSTRAINT [OpenHours_FK]
GO
ALTER TABLE [dbo].[ORDER_T]  WITH CHECK ADD  CONSTRAINT [Order_FK] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[ONLINECUSTOMER] ([CustomerID])
GO
ALTER TABLE [dbo].[ORDER_T] CHECK CONSTRAINT [Order_FK]
GO
ALTER TABLE [dbo].[ORDER_T]  WITH CHECK ADD  CONSTRAINT [Order_FK2] FOREIGN KEY([AddressID])
REFERENCES [dbo].[ADDRESS] ([AddressID])
GO
ALTER TABLE [dbo].[ORDER_T] CHECK CONSTRAINT [Order_FK2]
GO
ALTER TABLE [dbo].[PEDAL]  WITH CHECK ADD  CONSTRAINT [Pedal_FK] FOREIGN KEY([ID])
REFERENCES [dbo].[ITEM] ([ID])
GO
ALTER TABLE [dbo].[PEDAL] CHECK CONSTRAINT [Pedal_FK]
GO
ALTER TABLE [dbo].[PIANO]  WITH CHECK ADD  CONSTRAINT [Piano_FK] FOREIGN KEY([ID])
REFERENCES [dbo].[INSTRUMENT] ([ID])
GO
ALTER TABLE [dbo].[PIANO] CHECK CONSTRAINT [Piano_FK]
GO
ALTER TABLE [dbo].[SOUNDSYSTEM]  WITH CHECK ADD  CONSTRAINT [SoundSystem_FK] FOREIGN KEY([ID])
REFERENCES [dbo].[ITEM] ([ID])
GO
ALTER TABLE [dbo].[SOUNDSYSTEM] CHECK CONSTRAINT [SoundSystem_FK]
GO
ALTER TABLE [dbo].[STAND]  WITH CHECK ADD  CONSTRAINT [Stand_FK] FOREIGN KEY([ID])
REFERENCES [dbo].[ACCESSORIES] ([ID])
GO
ALTER TABLE [dbo].[STAND] CHECK CONSTRAINT [Stand_FK]
GO
ALTER TABLE [dbo].[STORE]  WITH CHECK ADD  CONSTRAINT [Store_FK] FOREIGN KEY([AddressID])
REFERENCES [dbo].[ADDRESS] ([AddressID])
GO
ALTER TABLE [dbo].[STORE] CHECK CONSTRAINT [Store_FK]
GO
ALTER TABLE [dbo].[STRING]  WITH CHECK ADD  CONSTRAINT [String_FK] FOREIGN KEY([ID])
REFERENCES [dbo].[ACCESSORIES] ([ID])
GO
ALTER TABLE [dbo].[STRING] CHECK CONSTRAINT [String_FK]
GO
ALTER TABLE [dbo].[SUPLIER]  WITH CHECK ADD  CONSTRAINT [Suplier_FK1] FOREIGN KEY([AddressID])
REFERENCES [dbo].[ADDRESS] ([AddressID])
GO
ALTER TABLE [dbo].[SUPLIER] CHECK CONSTRAINT [Suplier_FK1]
GO
ALTER TABLE [dbo].[SUPLIES]  WITH CHECK ADD  CONSTRAINT [Suplies_FK1] FOREIGN KEY([SuplierID])
REFERENCES [dbo].[SUPLIER] ([SuplierID])
GO
ALTER TABLE [dbo].[SUPLIES] CHECK CONSTRAINT [Suplies_FK1]
GO
ALTER TABLE [dbo].[SUPLIES]  WITH CHECK ADD  CONSTRAINT [Suplies_FK2] FOREIGN KEY([ItemID])
REFERENCES [dbo].[ITEM] ([ID])
GO
ALTER TABLE [dbo].[SUPLIES] CHECK CONSTRAINT [Suplies_FK2]
GO
ALTER TABLE [dbo].[TUNER]  WITH CHECK ADD  CONSTRAINT [Tuner_FK] FOREIGN KEY([ID])
REFERENCES [dbo].[ACCESSORIES] ([ID])
GO
ALTER TABLE [dbo].[TUNER] CHECK CONSTRAINT [Tuner_FK]
GO
ALTER TABLE [dbo].[VIOLIN]  WITH CHECK ADD  CONSTRAINT [Violin_FK] FOREIGN KEY([ID])
REFERENCES [dbo].[INSTRUMENT] ([ID])
GO
ALTER TABLE [dbo].[VIOLIN] CHECK CONSTRAINT [Violin_FK]
GO
ALTER TABLE [dbo].[ACCESSORIES]  WITH CHECK ADD CHECK  (([Type]='string' OR [Type]='cable' OR [Type]='stand' OR [Type]='tuner' OR [Type]='metronome' OR [Type]='case'))
GO
ALTER TABLE [dbo].[CABLE]  WITH CHECK ADD CHECK  (([Type]='gold' OR [Type]='aluminium'))
GO
ALTER TABLE [dbo].[FLUTE]  WITH CHECK ADD CHECK  (([Type]='side-blow' OR [Type]='pan'))
GO
ALTER TABLE [dbo].[GUITAR]  WITH CHECK ADD CHECK  (([Type]='electro' OR [Type]='ukulele' OR [Type]='bass' OR [Type]='acoustic' OR [Type]='classic'))
GO
ALTER TABLE [dbo].[INSTRUMENT]  WITH CHECK ADD CHECK  (([Type]='clavier' OR [Type]='wind instrument' OR [Type]='bowed stringed instrument'))
GO
ALTER TABLE [dbo].[INSTRUMENTCASE]  WITH CHECK ADD CHECK  (([TypeOfInstrument]='flute' OR [TypeOfInstrument]='violin' OR [TypeOfInstrument]='acoustic guitar' OR [TypeOfInstrument]='bass guitar' OR [TypeOfInstrument]='electro guitar'))
GO
ALTER TABLE [dbo].[INSTRUMENTCASE]  WITH CHECK ADD CHECK  (([Type]='soft' OR [Type]='hard'))
GO
ALTER TABLE [dbo].[ITEM]  WITH CHECK ADD CHECK  (([Condition]='second hand' OR [Condition]='unused'))
GO
ALTER TABLE [dbo].[METRONOME]  WITH CHECK ADD CHECK  (([Type]='electronic' OR [Type]='mechanic'))
GO
ALTER TABLE [dbo].[PEDAL]  WITH CHECK ADD CHECK  (([Type]='overdrive' OR [Type]='delay' OR [Type]='loop' OR [Type]='volume' OR [Type]='reverb' OR [Type]='distortion'))
GO
ALTER TABLE [dbo].[PIANO]  WITH CHECK ADD CHECK  (([Type]='grand piano' OR [Type]='upright' OR [Type]='electronic'))
GO
ALTER TABLE [dbo].[SOUNDSYSTEM]  WITH CHECK ADD CHECK  (([DeviceType]='speaker' OR [DeviceType]='mixer' OR [DeviceType]='amplifier'))
GO
ALTER TABLE [dbo].[SOUNDSYSTEM]  WITH CHECK ADD CHECK  (([Type]='passive' OR [Type]='active' OR [Type]='power' OR [Type]='normal' OR [Type]='bas' OR [Type]='acoustic' OR [Type]='electro'))
GO
ALTER TABLE [dbo].[STAND]  WITH CHECK ADD CHECK  (([Type]='speaker' OR [Type]='note sheet' OR [Type]='guitar' OR [Type]='microphone'))
GO
ALTER TABLE [dbo].[STRING]  WITH CHECK ADD CHECK  (([Type]='electro' OR [Type]='ukulele' OR [Type]='bass' OR [Type]='acoustic' OR [Type]='classic'))
GO
ALTER TABLE [dbo].[TUNER]  WITH CHECK ADD CHECK  (([Type]='digital' OR [Type]='chromatic'))
GO
ALTER TABLE [dbo].[VIOLIN]  WITH CHECK ADD CHECK  (([Type]='electro' OR [Type]='classic'))
GO
USE [master]
GO
ALTER DATABASE [MUSICSHOP] SET  READ_WRITE 
GO
