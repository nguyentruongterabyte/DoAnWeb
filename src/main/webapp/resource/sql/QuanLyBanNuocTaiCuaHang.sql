USE [master]
GO
/****** Object:  Database [QuanLyBanNuoc]    Script Date: 27/05/2023 7:51:23 SA ******/
CREATE DATABASE [QuanLyBanNuoc]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyBanNuoc', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QuanLyBanNuoc.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyBanNuoc_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QuanLyBanNuoc_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuanLyBanNuoc] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyBanNuoc].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyBanNuoc] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyBanNuoc] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyBanNuoc] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyBanNuoc] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyBanNuoc] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyBanNuoc] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyBanNuoc] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyBanNuoc] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyBanNuoc] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyBanNuoc] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyBanNuoc] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyBanNuoc] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyBanNuoc] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyBanNuoc] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyBanNuoc] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyBanNuoc] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyBanNuoc] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyBanNuoc] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyBanNuoc] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyBanNuoc] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyBanNuoc] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyBanNuoc] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyBanNuoc] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLyBanNuoc] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyBanNuoc] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyBanNuoc] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyBanNuoc] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyBanNuoc] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyBanNuoc] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyBanNuoc] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLyBanNuoc', N'ON'
GO
ALTER DATABASE [QuanLyBanNuoc] SET QUERY_STORE = OFF
GO
USE [QuanLyBanNuoc]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 27/05/2023 7:51:23 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupId] [int] NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Gender] [bit] NOT NULL,
	[Phone] [varchar](16) NULL,
	[Email] [varchar](64) NULL,
	[Address] [nvarchar](64) NOT NULL,
	[IdentifyNumber] [varchar](32) NOT NULL,
	[Birthday] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerBill]    Script Date: 27/05/2023 7:51:23 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerBill](
	[Id] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[ReceivedMoney] [float] NOT NULL,
	[ChangeMoney] [float] NOT NULL,
	[Payment] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_CustomerPay] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerOrder]    Script Date: 27/05/2023 7:51:23 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerOrder](
	[Id] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Discount] [float] NOT NULL,
	[ExtraPaid] [float] NOT NULL,
 CONSTRAINT [PK_CustomerOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Document]    Script Date: 27/05/2023 7:51:23 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](32) NOT NULL,
	[Creator] [int] NOT NULL,
	[CreateDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Document] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupOfCustomer]    Script Date: 27/05/2023 7:51:23 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupOfCustomer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Label] [nvarchar](32) NOT NULL,
	[Discount] [float] NOT NULL,
 CONSTRAINT [PK_GroupOfCustomer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InOutInventory]    Script Date: 27/05/2023 7:51:23 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InOutInventory](
	[Id] [int] NOT NULL,
	[Respond] [int] NOT NULL,
	[InventoryId] [int] NOT NULL,
	[CarryFee] [float] NOT NULL,
	[Term] [int] NOT NULL,
	[Type] [bit] NOT NULL,
 CONSTRAINT [PK_InOutInventory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InOutInventoryDetail]    Script Date: 27/05/2023 7:51:23 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InOutInventoryDetail](
	[OrderId] [int] NOT NULL,
	[InOutInventoryId] [int] NOT NULL,
 CONSTRAINT [PK_InOutInventoryDetail] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[InOutInventoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 27/05/2023 7:51:23 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Address] [nvarchar](128) NOT NULL,
	[RentPrice] [float] NOT NULL,
	[Term] [int] NOT NULL,
 CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryCapability]    Script Date: 27/05/2023 7:51:23 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryCapability](
	[InventoryId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[MaxCount] [int] NOT NULL,
	[Last] [int] NOT NULL,
	[CurrentCount] [int] NOT NULL,
 CONSTRAINT [PK_InventoryCapability] PRIMARY KEY CLUSTERED 
(
	[InventoryId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 27/05/2023 7:51:23 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] NOT NULL,
	[TransactionDate] [smalldatetime] NULL,
	[TotalPrice] [float] NOT NULL,
	[VAT] [float] NOT NULL,
	[FinalPrice] [float] NOT NULL,
	[Status] [nvarchar](16) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 27/05/2023 7:51:23 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetail_1] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 27/05/2023 7:51:23 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[BarCode] [varchar](32) NOT NULL,
	[Picture] [varchar](128) NULL,
	[InPrice] [int] NOT NULL,
	[OutPrice] [int] NOT NULL,
	[Unit] [nvarchar](32) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 27/05/2023 7:51:23 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Phone] [varchar](16) NULL,
	[Gender] [bit] NOT NULL,
	[Email] [varchar](64) NULL,
	[Address] [nvarchar](256) NOT NULL,
	[IdentifyNumber] [varchar](32) NOT NULL,
	[Func] [nvarchar](32) NOT NULL,
	[Birthday] [smalldatetime] NOT NULL,
	[Salary] [float] NOT NULL,
	[Resigned] [bit] NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 27/05/2023 7:51:23 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Username] [nchar](128) NOT NULL,
	[Password] [nchar](128) NOT NULL,
	[Email] [varchar](63) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 27/05/2023 7:51:23 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Phone] [varchar](16) NULL,
	[Email] [varchar](64) NULL,
	[Address] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Vendor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorBill]    Script Date: 27/05/2023 7:51:23 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorBill](
	[Id] [int] NOT NULL,
	[VendorId] [int] NOT NULL,
	[PaidStaff] [int] NOT NULL,
 CONSTRAINT [PK_VendorBill] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorDebt]    Script Date: 27/05/2023 7:51:23 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorDebt](
	[Id] [int] NOT NULL,
	[VendorId] [int] NOT NULL,
	[VendorOrderId] [int] NOT NULL,
	[OutCome] [float] NOT NULL,
 CONSTRAINT [PK_VendorDebt] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorOrder]    Script Date: 27/05/2023 7:51:23 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorOrder](
	[Id] [int] NOT NULL,
	[VendorId] [int] NOT NULL,
 CONSTRAINT [PK_VendorOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [GroupId], [Name], [Gender], [Phone], [Email], [Address], [IdentifyNumber], [Birthday]) VALUES (1, 1, N'Nguyễn Thái Trường', 0, N'094891501', N'nguyenthaitruong1223@gmail.com', N'ĐL', N'242110211429', CAST(N'2023-05-21T00:00:00' AS SmallDateTime))
INSERT [dbo].[Customer] ([Id], [GroupId], [Name], [Gender], [Phone], [Email], [Address], [IdentifyNumber], [Birthday]) VALUES (2, 1, N'Lê Văn Phúc', 0, N'0987654321', N'levanphuc@gmail.com', N'DL', N'16464164954', CAST(N'2023-05-21T00:00:00' AS SmallDateTime))
INSERT [dbo].[Customer] ([Id], [GroupId], [Name], [Gender], [Phone], [Email], [Address], [IdentifyNumber], [Birthday]) VALUES (3, 2, N'Võ Thành Đạt', 0, N'0123456788', N'vothanhdat@gmail.com', N'Quảng Ngãi', N'544875464655', CAST(N'2023-05-21T00:00:00' AS SmallDateTime))
INSERT [dbo].[Customer] ([Id], [GroupId], [Name], [Gender], [Phone], [Email], [Address], [IdentifyNumber], [Birthday]) VALUES (4, 5, N'Nguyễn Văn Hoài Nam', 0, N'0156886466', N'nguyenvanhoainam@gmail.com', N'Bình Phước', N'445884466444', CAST(N'2023-05-21T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Document] ON 

INSERT [dbo].[Document] ([Id], [Type], [Creator], [CreateDate]) VALUES (1, N'inoutinventory', 1, CAST(N'2023-01-01T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Document] OFF
GO
SET IDENTITY_INSERT [dbo].[GroupOfCustomer] ON 

INSERT [dbo].[GroupOfCustomer] ([Id], [Label], [Discount]) VALUES (1, N'Thông thường', 0)
INSERT [dbo].[GroupOfCustomer] ([Id], [Label], [Discount]) VALUES (2, N'Thân thiết', 0.05)
INSERT [dbo].[GroupOfCustomer] ([Id], [Label], [Discount]) VALUES (5, N'Thường xuyên', 0.1)
SET IDENTITY_INSERT [dbo].[GroupOfCustomer] OFF
GO
SET IDENTITY_INSERT [dbo].[Inventory] ON 

INSERT [dbo].[Inventory] ([Id], [Name], [Address], [RentPrice], [Term]) VALUES (1, N'Thủ Đức', N'Thủ Đức', 2300000, 1)
SET IDENTITY_INSERT [dbo].[Inventory] OFF
GO
INSERT [dbo].[InventoryCapability] ([InventoryId], [ProductId], [MaxCount], [Last], [CurrentCount]) VALUES (1, 1, 50, 0, 50)
INSERT [dbo].[InventoryCapability] ([InventoryId], [ProductId], [MaxCount], [Last], [CurrentCount]) VALUES (1, 2, 50, 0, 50)
INSERT [dbo].[InventoryCapability] ([InventoryId], [ProductId], [MaxCount], [Last], [CurrentCount]) VALUES (1, 3, 50, 0, 50)
INSERT [dbo].[InventoryCapability] ([InventoryId], [ProductId], [MaxCount], [Last], [CurrentCount]) VALUES (1, 4, 50, 0, 50)
INSERT [dbo].[InventoryCapability] ([InventoryId], [ProductId], [MaxCount], [Last], [CurrentCount]) VALUES (1, 7, 50, 0, 50)
GO
INSERT [dbo].[Order] ([Id], [TransactionDate], [TotalPrice], [VAT], [FinalPrice], [Status]) VALUES (1, CAST(N'2023-01-01T00:00:00' AS SmallDateTime), 10000000, 0.1, 100000, N'1')
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [BarCode], [Picture], [InPrice], [OutPrice], [Unit]) VALUES (1, N'RockStar 3', N'123456', N'/resource/images/product/loc-6-lon-nuoc-tang-luc-rockstar-250ml-202112111144335411.jpg', 10000, 34567, N'Chai')
INSERT [dbo].[Product] ([Id], [Name], [BarCode], [Picture], [InPrice], [OutPrice], [Unit]) VALUES (2, N'Redpull', N'4525688788', N'/resource/images/product/download.jpg', 10000, 11000, N'Chai')
INSERT [dbo].[Product] ([Id], [Name], [BarCode], [Picture], [InPrice], [OutPrice], [Unit]) VALUES (3, N'7 Up', N'46789556525', N'/resource/images/product/download (1).jpg', 10000, 12000, N'Lon')
INSERT [dbo].[Product] ([Id], [Name], [BarCode], [Picture], [InPrice], [OutPrice], [Unit]) VALUES (4, N'Number one', N'44554565', N'/resource/images/product/download (3).jpg', 12500, 13000, N'Chai')
INSERT [dbo].[Product] ([Id], [Name], [BarCode], [Picture], [InPrice], [OutPrice], [Unit]) VALUES (7, N'CocaCola', N'4525688788', N'/resource/images/product/cocacola-lon-350ml-1.jpg', 8000, 10000, N'Lon')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Staff] ON 

INSERT [dbo].[Staff] ([Id], [Name], [Phone], [Gender], [Email], [Address], [IdentifyNumber], [Func], [Birthday], [Salary], [Resigned]) VALUES (1, N'NGUYEN THAI TRUONG', N'0948915051', 0, N'nguyenthaitruong1223@gmail.com', N'55555', N'555555555', N'manager', CAST(N'2023-05-18T00:00:00' AS SmallDateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[Staff] OFF
GO
INSERT [dbo].[User] ([Username], [Password], [Email]) VALUES (N'admin                                                                                                                           ', N'123456                                                                                                                          ', N'nguyenthaitruong1223@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Vendor] ON 

INSERT [dbo].[Vendor] ([Id], [Name], [Phone], [Email], [Address]) VALUES (1, N'Nhà phân phối nước đóng chai Bách Khoa (Hà Nội)', N'0903214646', N'Sonvkt@Gmail.Com', N'Ngõ 27 Đại Cồ Việt, Hai Bà Trưng, Hà Nội')
INSERT [dbo].[Vendor] ([Id], [Name], [Phone], [Email], [Address]) VALUES (2, N' Đại lý bia nước giải khát Hựu Hưng (Hà Nội)', N'0903231321', N'', N'285 Nguyễn Khoái, Thanh Lương, Hai Bà Trưng, Hà Nội')
INSERT [dbo].[Vendor] ([Id], [Name], [Phone], [Email], [Address]) VALUES (6, N' Đại lý bia nước ngọt Khương Duу (TP.HCM)', N'01633344084', N'a@gmail.com', N'44/3a 13 Đường TTH10, Khu phố 3, phường Tân Thới Hiệp, Quận 12')
INSERT [dbo].[Vendor] ([Id], [Name], [Phone], [Email], [Address]) VALUES (7, N'Đại lý bia nước ngọt Vạn Hưng (TP.HCM)', N'0794969144', N'', N'702/1H Sư Vạn Hạnh, Phường 12, Quận 10, Thành phố Hồ Chí Minh')
INSERT [dbo].[Vendor] ([Id], [Name], [Phone], [Email], [Address]) VALUES (8, N'Chuỗi cửa hàng HT Sài Gòn (TP.HCM)', N'0888030777', N'htsaigon54@gmail.com', N'Phường Bình Hưng Hòa, Quận Bình Tân, Tp HCM')
INSERT [dbo].[Vendor] ([Id], [Name], [Phone], [Email], [Address]) VALUES (9, N'Nhà phân phối Quỳnh Anh (TP.HCM)', N'0906109050', N'nhaphanphoiquynhanh@gmail.com', N'206/9 Lê Văn Quới, Quận Bình Tân, TP.HCM')
SET IDENTITY_INSERT [dbo].[Vendor] OFF
GO
/****** Object:  Index [IX_Product]    Script Date: 27/05/2023 7:51:24 SA ******/
CREATE NONCLUSTERED INDEX [IX_Product] ON [dbo].[Product]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CustomerBill] ADD  CONSTRAINT [DF_ReceivedMoney]  DEFAULT ((0.0)) FOR [ReceivedMoney]
GO
ALTER TABLE [dbo].[CustomerBill] ADD  CONSTRAINT [DF_ChangeMoney]  DEFAULT ((0.0)) FOR [ChangeMoney]
GO
ALTER TABLE [dbo].[CustomerOrder] ADD  CONSTRAINT [DF_Discount]  DEFAULT ((0.0)) FOR [Discount]
GO
ALTER TABLE [dbo].[CustomerOrder] ADD  CONSTRAINT [DF_Customer_ExtraPaid]  DEFAULT ((0.0)) FOR [ExtraPaid]
GO
ALTER TABLE [dbo].[Inventory] ADD  CONSTRAINT [DF_Address]  DEFAULT ('') FOR [Address]
GO
ALTER TABLE [dbo].[Inventory] ADD  CONSTRAINT [DF_RentPrice]  DEFAULT ((0.0)) FOR [RentPrice]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_BarCode]  DEFAULT ('') FOR [BarCode]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_InPrice]  DEFAULT ((0.0)) FOR [InPrice]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_OutPrice]  DEFAULT ((0.0)) FOR [OutPrice]
GO
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [DF_Salary]  DEFAULT ((0.0)) FOR [Salary]
GO
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [DF_Staff_Resigned]  DEFAULT ((0)) FOR [Resigned]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_GroupOfCustomer] FOREIGN KEY([GroupId])
REFERENCES [dbo].[GroupOfCustomer] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_GroupOfCustomer]
GO
ALTER TABLE [dbo].[CustomerBill]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBill_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[CustomerBill] CHECK CONSTRAINT [FK_CustomerBill_Customer]
GO
ALTER TABLE [dbo].[CustomerOrder]  WITH CHECK ADD  CONSTRAINT [FK_CustomerOrder_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CustomerOrder] CHECK CONSTRAINT [FK_CustomerOrder_Customer]
GO
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_Staff] FOREIGN KEY([Creator])
REFERENCES [dbo].[Staff] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_Staff]
GO
ALTER TABLE [dbo].[InOutInventory]  WITH CHECK ADD  CONSTRAINT [FK_InOutInventory_Inventory] FOREIGN KEY([InventoryId])
REFERENCES [dbo].[Inventory] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[InOutInventory] CHECK CONSTRAINT [FK_InOutInventory_Inventory]
GO
ALTER TABLE [dbo].[InOutInventoryDetail]  WITH CHECK ADD  CONSTRAINT [FK_InOutInventoryDetail_InOutInventory1] FOREIGN KEY([InOutInventoryId])
REFERENCES [dbo].[InOutInventory] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[InOutInventoryDetail] CHECK CONSTRAINT [FK_InOutInventoryDetail_InOutInventory1]
GO
ALTER TABLE [dbo].[InOutInventoryDetail]  WITH CHECK ADD  CONSTRAINT [FK_InOutInventoryDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[InOutInventoryDetail] CHECK CONSTRAINT [FK_InOutInventoryDetail_Order]
GO
ALTER TABLE [dbo].[InventoryCapability]  WITH CHECK ADD  CONSTRAINT [FK_InventoryCapability_Inventory] FOREIGN KEY([InventoryId])
REFERENCES [dbo].[Inventory] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[InventoryCapability] CHECK CONSTRAINT [FK_InventoryCapability_Inventory]
GO
ALTER TABLE [dbo].[InventoryCapability]  WITH CHECK ADD  CONSTRAINT [FK_InventoryCapability_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[InventoryCapability] CHECK CONSTRAINT [FK_InventoryCapability_Product]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[VendorBill]  WITH CHECK ADD  CONSTRAINT [FK_VendorBill_Staff] FOREIGN KEY([PaidStaff])
REFERENCES [dbo].[Staff] ([Id])
GO
ALTER TABLE [dbo].[VendorBill] CHECK CONSTRAINT [FK_VendorBill_Staff]
GO
ALTER TABLE [dbo].[VendorBill]  WITH CHECK ADD  CONSTRAINT [FK_VendorBill_Vendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[VendorBill] CHECK CONSTRAINT [FK_VendorBill_Vendor]
GO
ALTER TABLE [dbo].[VendorDebt]  WITH CHECK ADD  CONSTRAINT [FK_VendorDebt_Vendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[VendorDebt] CHECK CONSTRAINT [FK_VendorDebt_Vendor]
GO
ALTER TABLE [dbo].[VendorDebt]  WITH CHECK ADD  CONSTRAINT [FK_VendorDebt_VendorOrder] FOREIGN KEY([VendorOrderId])
REFERENCES [dbo].[VendorOrder] ([Id])
GO
ALTER TABLE [dbo].[VendorDebt] CHECK CONSTRAINT [FK_VendorDebt_VendorOrder]
GO
ALTER TABLE [dbo].[VendorOrder]  WITH CHECK ADD  CONSTRAINT [FK_VendorOrder_Vendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[VendorOrder] CHECK CONSTRAINT [FK_VendorOrder_Vendor]
GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Orders_Without_OutInventory]    Script Date: 27/05/2023 7:51:24 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Get_Orders_Without_OutInventory]
AS
BEGIN
    SELECT o.*
    FROM [Order] o
    LEFT JOIN InOutInventoryDetail ioid ON o.Id = ioid.OrderId
    WHERE ioid.InOutInventoryId IS NULL;
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Định danh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Định danh của nhóm khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'GroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Giới tính' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'Gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số điện thoại khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Địa chỉ của khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số CMND/CCCD của khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'IdentifyNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày sinh của khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'Birthday'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Định danh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CustomerBill', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Định danh của Customer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CustomerBill', @level2type=N'COLUMN',@level2name=N'CustomerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số tiền nhận vào' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CustomerBill', @level2type=N'COLUMN',@level2name=N'ReceivedMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số tiền trả lại' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CustomerBill', @level2type=N'COLUMN',@level2name=N'ChangeMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Định danh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CustomerOrder', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Định danh của Customer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CustomerOrder', @level2type=N'COLUMN',@level2name=N'CustomerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số tiền được giảm giá' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CustomerOrder', @level2type=N'COLUMN',@level2name=N'Discount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tiền phụ thu dịch vụ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CustomerOrder', @level2type=N'COLUMN',@level2name=N'ExtraPaid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Định danh đơn từ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Document', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Loại đơn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Document', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nhân viên tạo đơn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Document', @level2type=N'COLUMN',@level2name=N'Creator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày tạo đơn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Document', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Định danh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GroupOfCustomer', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên nhóm khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GroupOfCustomer', @level2type=N'COLUMN',@level2name=N'Label'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tỉ lệ giảm giá của nhóm khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GroupOfCustomer', @level2type=N'COLUMN',@level2name=N'Discount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Định danh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InOutInventory', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Người chịu trách nhiệm quản lý' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InOutInventory', @level2type=N'COLUMN',@level2name=N'Respond'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Định danh của kho hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InOutInventory', @level2type=N'COLUMN',@level2name=N'InventoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số thứ tự kỳ (khoảng thời gian)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InOutInventory', @level2type=N'COLUMN',@level2name=N'Term'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Loại (1: đơn xuất hàng; 0: đơn nhập hàng)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InOutInventory', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Định danh của đơn hàng được nhập vào kho' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InOutInventoryDetail', @level2type=N'COLUMN',@level2name=N'OrderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Định danh của đơn nhập xuất kho' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InOutInventoryDetail', @level2type=N'COLUMN',@level2name=N'InOutInventoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Định danh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên kho' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Địa chỉ của kho' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tiền thuê kho trong thời gian hiện tại' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory', @level2type=N'COLUMN',@level2name=N'RentPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số thứ tự kỳ (Khoảng thời gian)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory', @level2type=N'COLUMN',@level2name=N'Term'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Định danh của kho hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryCapability', @level2type=N'COLUMN',@level2name=N'InventoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Định danh của sản phẩm' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryCapability', @level2type=N'COLUMN',@level2name=N'ProductId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lượng tối đa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryCapability', @level2type=N'COLUMN',@level2name=N'MaxCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lượng tồn kỳ trước ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryCapability', @level2type=N'COLUMN',@level2name=N'Last'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lượng tồn hiện tại' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryCapability', @level2type=N'COLUMN',@level2name=N'CurrentCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Định danh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày giao dịch bán hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'TransactionDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tổng tiền của đơn hàng. Được tính bằng tổng các món hàng trong chi tiết đơn hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'TotalPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Thuế GTGT. Được tính bằng TotalPrice nhân với VATRate trong bảng CONSTRAINT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'VAT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tiền phải trả của đơn hàng. Tùy vào thể hiện đơn là bán hàng hay đơn nhập hàng mà có công thức tính khác nhau' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'FinalPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Trạng thái đơn hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Định danh của Order' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetail', @level2type=N'COLUMN',@level2name=N'OrderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Định danh của Product' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetail', @level2type=N'COLUMN',@level2name=N'ProductId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lượng mua' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetail', @level2type=N'COLUMN',@level2name=N'Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Định danh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên sản phẩm' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã vạch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'BarCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đường dẫn tương đối tới file ảnh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'Picture'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Giá nhập' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'InPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Giá bán' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'OutPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Định danh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên nhân viên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'số điện thoại của nhân viên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Giới tính của nhân viên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'Gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email của nhân viên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Địa chỉ liên hệ của nhân viên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số CMND/CCCD của nhân viên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'IdentifyNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chức vụ của nhân viên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'Func'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày sinh của nhân viên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'Birthday'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tiền lương hiện tại của nhân viên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'Salary'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Định danh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên nhà cung cấp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số điện thoại nhà cung cấp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email nhà cung cấp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Địa chỉ liên hệ của nhà cung cấp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Định danh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VendorBill', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Định danh của Vendor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VendorBill', @level2type=N'COLUMN',@level2name=N'VendorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nhân viên đã trả tiền cho nhà cung cấp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VendorBill', @level2type=N'COLUMN',@level2name=N'PaidStaff'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Định danh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VendorDebt', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Định danh của Vendor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VendorDebt', @level2type=N'COLUMN',@level2name=N'VendorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Định danh của VendorOrder' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VendorDebt', @level2type=N'COLUMN',@level2name=N'VendorOrderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tổng chi phí' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VendorDebt', @level2type=N'COLUMN',@level2name=N'OutCome'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Định danh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VendorOrder', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Định danh của Vendor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VendorOrder', @level2type=N'COLUMN',@level2name=N'VendorId'
GO
USE [master]
GO
ALTER DATABASE [QuanLyBanNuoc] SET  READ_WRITE 
GO
