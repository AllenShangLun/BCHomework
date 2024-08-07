USE [master]
GO
/****** Object:  Database [ShopeeDB]    Script Date: 2024/7/25 下午 02:14:49 ******/
CREATE DATABASE [ShopeeDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopeeDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\ShopeeDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopeeDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\ShopeeDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ShopeeDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopeeDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopeeDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopeeDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopeeDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopeeDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopeeDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopeeDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopeeDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopeeDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopeeDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopeeDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopeeDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopeeDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopeeDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopeeDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopeeDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopeeDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopeeDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopeeDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopeeDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopeeDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopeeDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopeeDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopeeDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ShopeeDB] SET  MULTI_USER 
GO
ALTER DATABASE [ShopeeDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopeeDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopeeDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopeeDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopeeDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopeeDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShopeeDB', N'ON'
GO
ALTER DATABASE [ShopeeDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [ShopeeDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ShopeeDB]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 2024/7/25 下午 02:14:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[MemberID] [int] NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Password] [nvarchar](100) NULL,
	[Name] [nvarchar](50) NULL,
	[Account] [nvarchar](50) NULL,
	[Mobile] [varchar](20) NULL,
	[Gender] [smallint] NULL,
	[Birthday] [date] NULL,
	[CDate] [datetime] NULL,
	[UDate] [datetime] NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OderDetail]    Script Date: 2024/7/25 下午 02:14:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OderDetail](
	[OrderID] [int] NOT NULL,
	[LineID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [smallint] NULL,
	[UnitPrice] [money] NULL,
	[CDate] [datetime] NULL,
	[UDate] [datetime] NULL,
	[DDate] [datetime] NULL,
 CONSTRAINT [PK_OderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[LineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2024/7/25 下午 02:14:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] NOT NULL,
	[MemberID] [int] NULL,
	[ShipName] [nvarchar](50) NULL,
	[ShipAddress] [nvarchar](100) NULL,
	[ShipCity] [nvarchar](10) NULL,
	[ShipCountry] [nvarchar](10) NULL,
	[Subtotal] [money] NULL,
	[Discount] [money] NULL,
	[Freight] [money] NULL,
	[FreightDiscount] [money] NULL,
	[TotalAmount] [money] NULL,
	[OrderStatus] [smallint] NULL,
	[CDate] [datetime] NULL,
	[UDate] [datetime] NULL,
	[DDate] [datetime] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 2024/7/25 下午 02:14:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[OrderStatusID] [smallint] NOT NULL,
	[OrderStatusName] [nvarchar](50) NULL,
	[CDate] [datetime] NULL,
	[UDate] [datetime] NULL,
	[DDate] [datetime] NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[OrderStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2024/7/25 下午 02:14:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](40) NOT NULL,
	[Spec] [nvarchar](100) NULL,
	[Contents] [ntext] NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [smallint] NULL,
	[IsOnSale] [bit] NOT NULL,
	[CDate] [datetime] NULL,
	[UDate] [datetime] NULL,
	[DDate] [datetime] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShopCard]    Script Date: 2024/7/25 下午 02:14:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopCard](
	[MemberID] [int] NOT NULL,
	[CDate] [datetime] NULL,
	[UDate] [datetime] NULL,
	[DDate] [datetime] NULL,
 CONSTRAINT [PK_ShopCard] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShopCardDetail]    Script Date: 2024/7/25 下午 02:14:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopCardDetail](
	[MemberID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
	[LinID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [smallint] NULL,
	[UnitPrice] [money] NULL,
	[Discount] [decimal](18, 2) NULL,
	[LineTotal] [money] NULL,
 CONSTRAINT [PK_ShopCardDetail] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC,
	[SupplierID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Member] ADD  CONSTRAINT [DF_Member_CDate]  DEFAULT (getdate()) FOR [CDate]
GO
ALTER TABLE [dbo].[OderDetail] ADD  CONSTRAINT [DF_OderDetails_CDate]  DEFAULT (getdate()) FOR [CDate]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Orders_CDate]  DEFAULT (getdate()) FOR [CDate]
GO
ALTER TABLE [dbo].[OrderStatus] ADD  CONSTRAINT [DF_OrderStatus_CDate]  DEFAULT (getdate()) FOR [CDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Products_IsOnSale]  DEFAULT ((0)) FOR [IsOnSale]
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [FK_Member_ShopCard] FOREIGN KEY([MemberID])
REFERENCES [dbo].[ShopCard] ([MemberID])
GO
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [FK_Member_ShopCard]
GO
ALTER TABLE [dbo].[OderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OderDetail_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OderDetail] CHECK CONSTRAINT [FK_OderDetail_Order]
GO
ALTER TABLE [dbo].[OderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OderDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OderDetail] CHECK CONSTRAINT [FK_OderDetail_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Member] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Member]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderStatus] FOREIGN KEY([OrderStatus])
REFERENCES [dbo].[OrderStatus] ([OrderStatusID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderStatus]
GO
ALTER TABLE [dbo].[ShopCardDetail]  WITH CHECK ADD  CONSTRAINT [FK_ShopCardDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ShopCardDetail] CHECK CONSTRAINT [FK_ShopCardDetail_Product]
GO
ALTER TABLE [dbo].[ShopCardDetail]  WITH CHECK ADD  CONSTRAINT [FK_ShopCardDetail_ShopCard] FOREIGN KEY([MemberID])
REFERENCES [dbo].[ShopCard] ([MemberID])
GO
ALTER TABLE [dbo].[ShopCardDetail] CHECK CONSTRAINT [FK_ShopCardDetail_ShopCard]
GO
USE [master]
GO
ALTER DATABASE [ShopeeDB] SET  READ_WRITE 
GO
