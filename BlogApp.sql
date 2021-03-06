USE [master]
GO
/****** Object:  Database [BlogApp]    Script Date: 6/12/2022 1:27:17 PM ******/
CREATE DATABASE [BlogApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BlogApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BlogApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BlogApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BlogApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BlogApp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BlogApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BlogApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BlogApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BlogApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BlogApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BlogApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [BlogApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BlogApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BlogApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BlogApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BlogApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BlogApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BlogApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BlogApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BlogApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BlogApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BlogApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BlogApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BlogApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BlogApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BlogApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BlogApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BlogApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BlogApp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BlogApp] SET  MULTI_USER 
GO
ALTER DATABASE [BlogApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BlogApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BlogApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BlogApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BlogApp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BlogApp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BlogApp] SET QUERY_STORE = OFF
GO
USE [BlogApp]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/12/2022 1:27:17 PM ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 6/12/2022 1:27:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 6/12/2022 1:27:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](500) NOT NULL,
	[UserId] [int] NOT NULL,
	[ParentId] [int] NULL,
	[PostId] [int] NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LikedComments]    Script Date: 6/12/2022 1:27:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LikedComments](
	[UserId] [int] NOT NULL,
	[CommentId] [int] NOT NULL,
 CONSTRAINT [PK_LikedComments] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LikedPosts]    Script Date: 6/12/2022 1:27:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LikedPosts](
	[UserId] [int] NOT NULL,
	[PostId] [int] NOT NULL,
 CONSTRAINT [PK_LikedPosts] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NavigationLinks]    Script Date: 6/12/2022 1:27:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NavigationLinks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Route] [nvarchar](30) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_NavigationLinks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 6/12/2022 1:27:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](20) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[UserId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostsImages]    Script Date: 6/12/2022 1:27:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostsImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PostId] [int] NOT NULL,
	[Source] [nvarchar](255) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_PostsImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/12/2022 1:27:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/12/2022 1:27:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [nvarchar](30) NOT NULL,
	[Lastname] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Username] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[RoleId] [int] NOT NULL,
	[ProfilePicture] [nvarchar](max) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersUseCases]    Script Date: 6/12/2022 1:27:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersUseCases](
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
 CONSTRAINT [PK_UsersUseCases] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[UseCaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220611092124_Initial', N'5.0.17')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [UpdatedAt], [UpdatedBy], [CreatedAt], [IsActive]) VALUES (1, N'Sports', NULL, NULL, CAST(N'2022-06-11T09:23:04.9293488' AS DateTime2), 1)
INSERT [dbo].[Categories] ([Id], [Name], [UpdatedAt], [UpdatedBy], [CreatedAt], [IsActive]) VALUES (2, N'Science', NULL, NULL, CAST(N'2022-06-11T09:23:04.9293499' AS DateTime2), 1)
INSERT [dbo].[Categories] ([Id], [Name], [UpdatedAt], [UpdatedBy], [CreatedAt], [IsActive]) VALUES (3, N'Phylosophy', NULL, NULL, CAST(N'2022-06-11T09:23:04.9293505' AS DateTime2), 1)
INSERT [dbo].[Categories] ([Id], [Name], [UpdatedAt], [UpdatedBy], [CreatedAt], [IsActive]) VALUES (4, N'Psychology', NULL, NULL, CAST(N'2022-06-11T09:23:04.9293510' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ParentId], [PostId], [UpdatedAt], [UpdatedBy], [CreatedAt], [IsActive]) VALUES (1, N'Izmenjeni komentar', 1, NULL, 1, CAST(N'2022-06-12T11:12:05.2832229' AS DateTime2), N'aleksandar.milijanovic.91.19@ict.edu.rs', CAST(N'2022-06-12T10:45:48.6245994' AS DateTime2), 1)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ParentId], [PostId], [UpdatedAt], [UpdatedBy], [CreatedAt], [IsActive]) VALUES (2, N'Novi komentar prve objave', 1, NULL, 1, NULL, NULL, CAST(N'2022-06-12T11:12:49.3634354' AS DateTime2), 1)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [ParentId], [PostId], [UpdatedAt], [UpdatedBy], [CreatedAt], [IsActive]) VALUES (3, N'Odgovor na drugi komentar', 1, 2, 1, NULL, NULL, CAST(N'2022-06-12T11:13:44.1395800' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
INSERT [dbo].[LikedComments] ([UserId], [CommentId]) VALUES (1, 1)
INSERT [dbo].[LikedComments] ([UserId], [CommentId]) VALUES (1, 3)
GO
INSERT [dbo].[LikedPosts] ([UserId], [PostId]) VALUES (1, 1)
INSERT [dbo].[LikedPosts] ([UserId], [PostId]) VALUES (1, 2)
GO
SET IDENTITY_INSERT [dbo].[NavigationLinks] ON 

INSERT [dbo].[NavigationLinks] ([Id], [Name], [Route], [UpdatedAt], [UpdatedBy], [CreatedAt], [IsActive]) VALUES (1, N'Home', N'home', NULL, NULL, CAST(N'2022-06-11T14:59:04.3503944' AS DateTime2), 1)
INSERT [dbo].[NavigationLinks] ([Id], [Name], [Route], [UpdatedAt], [UpdatedBy], [CreatedAt], [IsActive]) VALUES (2, N'Contact', N'contact', NULL, NULL, CAST(N'2022-06-11T14:59:17.6064170' AS DateTime2), 1)
INSERT [dbo].[NavigationLinks] ([Id], [Name], [Route], [UpdatedAt], [UpdatedBy], [CreatedAt], [IsActive]) VALUES (3, N'Browse', N'browse', NULL, NULL, CAST(N'2022-06-11T14:59:55.3654470' AS DateTime2), 1)
INSERT [dbo].[NavigationLinks] ([Id], [Name], [Route], [UpdatedAt], [UpdatedBy], [CreatedAt], [IsActive]) VALUES (4, N'Register', N'register', CAST(N'2022-06-11T16:41:50.3439534' AS DateTime2), N'aleksandar.milijanovic.91.19@ict.edu.rs', CAST(N'2022-06-11T15:00:08.7232845' AS DateTime2), 1)
INSERT [dbo].[NavigationLinks] ([Id], [Name], [Route], [UpdatedAt], [UpdatedBy], [CreatedAt], [IsActive]) VALUES (5, N'Test', N'test', CAST(N'2022-06-11T16:01:52.1626179' AS DateTime2), N'aleksandar.milijanovic.91.19@ict.edu.rs', CAST(N'2022-06-11T15:34:53.0732875' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[NavigationLinks] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([Id], [Title], [Content], [UserId], [CategoryId], [UpdatedAt], [UpdatedBy], [CreatedAt], [IsActive]) VALUES (1, N'Updated title', N'Content1', 1, 2, CAST(N'2022-06-11T10:21:20.3511186' AS DateTime2), N'aleksandar.milijanovic.91.19@ict.edu.rs', CAST(N'2022-06-11T09:53:25.8134839' AS DateTime2), 1)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [UserId], [CategoryId], [UpdatedAt], [UpdatedBy], [CreatedAt], [IsActive]) VALUES (2, N'Naslov druge objave', N'Sadrzaj druge objave', 1, 3, NULL, NULL, CAST(N'2022-06-12T11:18:52.4039019' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[PostsImages] ON 

INSERT [dbo].[PostsImages] ([Id], [PostId], [Source], [UpdatedAt], [UpdatedBy], [CreatedAt], [IsActive]) VALUES (4, 1, N'647d2c97-0993-46fa-8355-6c9ebf4298bephoto1.jpg', CAST(N'2022-06-11T12:48:45.1015261' AS DateTime2), N'aleksandar.milijanovic.91.19@ict.edu.rs', CAST(N'2022-06-11T12:48:17.0615011' AS DateTime2), 0)
INSERT [dbo].[PostsImages] ([Id], [PostId], [Source], [UpdatedAt], [UpdatedBy], [CreatedAt], [IsActive]) VALUES (5, 1, N'104c9764-4bd5-491b-ab6e-6025acbc2503photo2.jpg', NULL, NULL, CAST(N'2022-06-11T12:48:45.1015254' AS DateTime2), 1)
INSERT [dbo].[PostsImages] ([Id], [PostId], [Source], [UpdatedAt], [UpdatedBy], [CreatedAt], [IsActive]) VALUES (6, 1, N'74d1b460-b752-4328-a22c-727dcaaf7380photo3.jpg', NULL, NULL, CAST(N'2022-06-11T12:48:45.1015205' AS DateTime2), 1)
INSERT [dbo].[PostsImages] ([Id], [PostId], [Source], [UpdatedAt], [UpdatedBy], [CreatedAt], [IsActive]) VALUES (7, 2, N'48d46c86-c522-41ed-ac93-e33003954076photo1.jpg', NULL, NULL, CAST(N'2022-06-12T11:19:32.8084077' AS DateTime2), 1)
INSERT [dbo].[PostsImages] ([Id], [PostId], [Source], [UpdatedAt], [UpdatedBy], [CreatedAt], [IsActive]) VALUES (8, 2, N'37945a65-3d04-407e-9715-d882fcf69aa6photo2.jpeg', NULL, NULL, CAST(N'2022-06-12T11:19:32.8084122' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[PostsImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Name], [UpdatedAt], [UpdatedBy], [CreatedAt], [IsActive]) VALUES (1, N'Administrator', NULL, NULL, CAST(N'2022-06-11T09:23:04.9286266' AS DateTime2), 1)
INSERT [dbo].[Roles] ([Id], [Name], [UpdatedAt], [UpdatedBy], [CreatedAt], [IsActive]) VALUES (2, N'User', NULL, NULL, CAST(N'2022-06-11T09:23:04.9293425' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Firstname], [Lastname], [Email], [Username], [Password], [RoleId], [ProfilePicture], [UpdatedAt], [UpdatedBy], [CreatedAt], [IsActive]) VALUES (1, N'Aleksandar', N'Milijanovic', N'aleksandar.milijanovic.91.19@ict.edu.rs', N'milijan', N'$2a$11$4DpKMrue57AcleYdFKC55.QD24AarmFZT38MSHDxod7OO9glhMD66', 1, N'77d038d2-b0c1-4ab6-a46d-46e1d8efff87.jpg', CAST(N'2022-06-12T07:38:35.8317655' AS DateTime2), N'aleksandar.milijanovic.91.19@ict.edu.rs', CAST(N'2022-06-11T09:23:04.9293522' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 1)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 2)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 3)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 4)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 5)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 6)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 7)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 8)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 9)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 10)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 11)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 12)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 13)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 14)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 15)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 16)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 17)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 18)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 19)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 20)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 21)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 22)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 23)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 24)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 25)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 26)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 27)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 28)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 29)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 30)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 31)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 32)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 33)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 34)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 35)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 36)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 37)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 38)
INSERT [dbo].[UsersUseCases] ([UserId], [UseCaseId]) VALUES (1, 39)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Categories_Name]    Script Date: 6/12/2022 1:27:18 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Categories_Name] ON [dbo].[Categories]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_ParentId]    Script Date: 6/12/2022 1:27:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_ParentId] ON [dbo].[Comments]
(
	[ParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_PostId]    Script Date: 6/12/2022 1:27:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_PostId] ON [dbo].[Comments]
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_UserId]    Script Date: 6/12/2022 1:27:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_UserId] ON [dbo].[Comments]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_LikedComments_UserId]    Script Date: 6/12/2022 1:27:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_LikedComments_UserId] ON [dbo].[LikedComments]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_LikedPosts_UserId]    Script Date: 6/12/2022 1:27:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_LikedPosts_UserId] ON [dbo].[LikedPosts]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Posts_CategoryId]    Script Date: 6/12/2022 1:27:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Posts_CategoryId] ON [dbo].[Posts]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Posts_Title]    Script Date: 6/12/2022 1:27:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Posts_Title] ON [dbo].[Posts]
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Posts_UserId]    Script Date: 6/12/2022 1:27:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Posts_UserId] ON [dbo].[Posts]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PostsImages_PostId]    Script Date: 6/12/2022 1:27:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_PostsImages_PostId] ON [dbo].[PostsImages]
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Roles_Name]    Script Date: 6/12/2022 1:27:18 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Roles_Name] ON [dbo].[Roles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Email]    Script Date: 6/12/2022 1:27:18 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Firstname]    Script Date: 6/12/2022 1:27:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Users_Firstname] ON [dbo].[Users]
(
	[Firstname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Lastname]    Script Date: 6/12/2022 1:27:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Users_Lastname] ON [dbo].[Users]
(
	[Lastname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_RoleId]    Script Date: 6/12/2022 1:27:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Users_RoleId] ON [dbo].[Users]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Username]    Script Date: 6/12/2022 1:27:18 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Username] ON [dbo].[Users]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[NavigationLinks] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Posts] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[PostsImages] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Comments_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Comments] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Comments_ParentId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Posts_PostId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users_UserId]
GO
ALTER TABLE [dbo].[LikedComments]  WITH CHECK ADD  CONSTRAINT [FK_LikedComments_Comments_CommentId] FOREIGN KEY([CommentId])
REFERENCES [dbo].[Comments] ([Id])
GO
ALTER TABLE [dbo].[LikedComments] CHECK CONSTRAINT [FK_LikedComments_Comments_CommentId]
GO
ALTER TABLE [dbo].[LikedComments]  WITH CHECK ADD  CONSTRAINT [FK_LikedComments_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[LikedComments] CHECK CONSTRAINT [FK_LikedComments_Users_UserId]
GO
ALTER TABLE [dbo].[LikedPosts]  WITH CHECK ADD  CONSTRAINT [FK_LikedPosts_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LikedPosts] CHECK CONSTRAINT [FK_LikedPosts_Posts_PostId]
GO
ALTER TABLE [dbo].[LikedPosts]  WITH CHECK ADD  CONSTRAINT [FK_LikedPosts_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LikedPosts] CHECK CONSTRAINT [FK_LikedPosts_Users_UserId]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users_UserId]
GO
ALTER TABLE [dbo].[PostsImages]  WITH CHECK ADD  CONSTRAINT [FK_PostsImages_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PostsImages] CHECK CONSTRAINT [FK_PostsImages_Posts_PostId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles_RoleId]
GO
ALTER TABLE [dbo].[UsersUseCases]  WITH CHECK ADD  CONSTRAINT [FK_UsersUseCases_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsersUseCases] CHECK CONSTRAINT [FK_UsersUseCases_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [BlogApp] SET  READ_WRITE 
GO
