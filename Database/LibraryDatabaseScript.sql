USE [master]
GO
/****** Object:  Database [Library]    Script Date: 20.06.2023 13:24:45 ******/
CREATE DATABASE [Library]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Library', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Library.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Library_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Library_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Library] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Library].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Library] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Library] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Library] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Library] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Library] SET ARITHABORT OFF 
GO
ALTER DATABASE [Library] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Library] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Library] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Library] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Library] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Library] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Library] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Library] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Library] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Library] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Library] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Library] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Library] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Library] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Library] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Library] SET RECOVERY FULL 
GO
ALTER DATABASE [Library] SET  MULTI_USER 
GO
ALTER DATABASE [Library] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Library] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Library] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Library] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Library] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Library] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Library', N'ON'
GO
ALTER DATABASE [Library] SET QUERY_STORE = ON
GO
ALTER DATABASE [Library] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Library]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 20.06.2023 13:24:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 20.06.2023 13:24:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[PageCount] [nvarchar](max) NULL,
	[AuthorID] [int] NOT NULL,
	[BookTypeID] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookTypes]    Script Date: 20.06.2023 13:24:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_BookTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operasyonlar]    Script Date: 20.06.2023 13:24:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operasyonlar](
	[StudentID] [int] NOT NULL,
	[BookID] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Operasyonlar] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentDetail]    Script Date: 20.06.2023 13:24:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BirthDay] [datetime2](7) NOT NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[SchoolNumber] [nvarchar](max) NULL,
	[StudentID] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_StudentDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 20.06.2023 13:24:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Gender] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 20.06.2023 13:24:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Role] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yazarlar]    Script Date: 20.06.2023 13:24:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yazarlar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Isim] [nvarchar](max) NULL,
	[Soyisim] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Yazarlar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230620081946_InitialData', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230620085911_addSeedData', N'5.0.17')
GO
SET IDENTITY_INSERT [dbo].[StudentDetail] ON 

INSERT [dbo].[StudentDetail] ([ID], [BirthDay], [PhoneNumber], [SchoolNumber], [StudentID], [Status], [CreatedDate], [ModifiedDate]) VALUES (1, CAST(N'1997-12-17T00:00:00.0000000' AS DateTime2), NULL, N'100', 1, 1, CAST(N'2023-06-20T11:59:10.8751824' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[StudentDetail] ([ID], [BirthDay], [PhoneNumber], [SchoolNumber], [StudentID], [Status], [CreatedDate], [ModifiedDate]) VALUES (2, CAST(N'1992-12-17T00:00:00.0000000' AS DateTime2), NULL, N'101', 2, 1, CAST(N'2023-06-20T11:59:10.8752481' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[StudentDetail] ([ID], [BirthDay], [PhoneNumber], [SchoolNumber], [StudentID], [Status], [CreatedDate], [ModifiedDate]) VALUES (3, CAST(N'1990-12-17T00:00:00.0000000' AS DateTime2), NULL, N'102', 3, 1, CAST(N'2023-06-20T11:59:10.8752485' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[StudentDetail] ([ID], [BirthDay], [PhoneNumber], [SchoolNumber], [StudentID], [Status], [CreatedDate], [ModifiedDate]) VALUES (4, CAST(N'1999-12-17T00:00:00.0000000' AS DateTime2), NULL, N'103', 4, 1, CAST(N'2023-06-20T11:59:10.8752486' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[StudentDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([ID], [FirstName], [LastName], [Gender], [Status], [CreatedDate], [ModifiedDate]) VALUES (1, N'Alperen', N'Bozkurt', 1, 1, CAST(N'2023-06-20T11:59:10.8750612' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Students] ([ID], [FirstName], [LastName], [Gender], [Status], [CreatedDate], [ModifiedDate]) VALUES (2, N'Yusuf', N'Bozkurt', 1, 1, CAST(N'2023-06-20T11:59:10.8751333' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Students] ([ID], [FirstName], [LastName], [Gender], [Status], [CreatedDate], [ModifiedDate]) VALUES (3, N'Kaan', N'Gülla.', 1, 1, CAST(N'2023-06-20T11:59:10.8751338' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Students] ([ID], [FirstName], [LastName], [Gender], [Status], [CreatedDate], [ModifiedDate]) VALUES (4, N'Umut', N'Turhan', 1, 1, CAST(N'2023-06-20T11:59:10.8751339' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [UserName], [Password], [Role], [Status], [CreatedDate], [ModifiedDate]) VALUES (1, N'Administrator', N'$2a$11$w9SHb1CPFa0q/YJMl2ZOfO9JAhmFPvYYu99hxmdW3ty39QnW3rshy', 1, 1, CAST(N'2023-06-20T11:59:10.8727319' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Users] ([ID], [UserName], [Password], [Role], [Status], [CreatedDate], [ModifiedDate]) VALUES (2, N'alperen', N'$2a$11$KD1lDq9I4BJK3Y2PFWsZSeFOCykkbvuMKlEtrGRGnAYVxcWsucZxm', 2, 1, CAST(N'2023-06-20T11:59:10.8740470' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Yazarlar] ON 

INSERT [dbo].[Yazarlar] ([ID], [Isim], [Soyisim], [Status], [CreatedDate], [ModifiedDate]) VALUES (1, N'Yusuf Alperen', N'Bozkurtt', 3, CAST(N'2023-06-20T12:03:02.4245227' AS DateTime2), CAST(N'2023-06-20T12:03:03.9866009' AS DateTime2))
INSERT [dbo].[Yazarlar] ([ID], [Isim], [Soyisim], [Status], [CreatedDate], [ModifiedDate]) VALUES (2, N'Yusuf Alperen', N'Bozkurt', 1, CAST(N'2023-06-20T12:03:07.5720917' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Yazarlar] ([ID], [Isim], [Soyisim], [Status], [CreatedDate], [ModifiedDate]) VALUES (3, N'Kaan', N'Güllaç', 2, CAST(N'2023-06-20T12:03:45.4050461' AS DateTime2), CAST(N'2023-06-20T12:03:45.4051150' AS DateTime2))
INSERT [dbo].[Yazarlar] ([ID], [Isim], [Soyisim], [Status], [CreatedDate], [ModifiedDate]) VALUES (4, N'Umutcan', N'Turhan', 1, CAST(N'2023-06-20T12:03:57.5112915' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Yazarlar] ([ID], [Isim], [Soyisim], [Status], [CreatedDate], [ModifiedDate]) VALUES (5, NULL, NULL, 3, CAST(N'2023-06-20T12:13:21.4620767' AS DateTime2), CAST(N'2023-06-20T12:13:28.0027248' AS DateTime2))
INSERT [dbo].[Yazarlar] ([ID], [Isim], [Soyisim], [Status], [CreatedDate], [ModifiedDate]) VALUES (6, NULL, NULL, 3, CAST(N'2023-06-20T12:24:22.2444761' AS DateTime2), CAST(N'2023-06-20T12:24:27.3122580' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Yazarlar] OFF
GO
/****** Object:  Index [IX_Books_AuthorID]    Script Date: 20.06.2023 13:24:45 ******/
CREATE NONCLUSTERED INDEX [IX_Books_AuthorID] ON [dbo].[Books]
(
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Books_BookTypeID]    Script Date: 20.06.2023 13:24:45 ******/
CREATE NONCLUSTERED INDEX [IX_Books_BookTypeID] ON [dbo].[Books]
(
	[BookTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Operasyonlar_BookID]    Script Date: 20.06.2023 13:24:45 ******/
CREATE NONCLUSTERED INDEX [IX_Operasyonlar_BookID] ON [dbo].[Operasyonlar]
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentDetail_StudentID]    Script Date: 20.06.2023 13:24:45 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_StudentDetail_StudentID] ON [dbo].[StudentDetail]
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_BookTypes_BookTypeID] FOREIGN KEY([BookTypeID])
REFERENCES [dbo].[BookTypes] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_BookTypes_BookTypeID]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Yazarlar_AuthorID] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Yazarlar] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Yazarlar_AuthorID]
GO
ALTER TABLE [dbo].[Operasyonlar]  WITH CHECK ADD  CONSTRAINT [FK_Operasyonlar_Books_BookID] FOREIGN KEY([BookID])
REFERENCES [dbo].[Books] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Operasyonlar] CHECK CONSTRAINT [FK_Operasyonlar_Books_BookID]
GO
ALTER TABLE [dbo].[Operasyonlar]  WITH CHECK ADD  CONSTRAINT [FK_Operasyonlar_Students_StudentID] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Operasyonlar] CHECK CONSTRAINT [FK_Operasyonlar_Students_StudentID]
GO
ALTER TABLE [dbo].[StudentDetail]  WITH CHECK ADD  CONSTRAINT [FK_StudentDetail_Students_StudentID] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentDetail] CHECK CONSTRAINT [FK_StudentDetail_Students_StudentID]
GO
USE [master]
GO
ALTER DATABASE [Library] SET  READ_WRITE 
GO
