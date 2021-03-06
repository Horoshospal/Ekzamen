USE [master]
GO
/****** Object:  Database [СалонКрасоты]    Script Date: 13.04.2022 10:53:44 ******/
CREATE DATABASE [СалонКрасоты]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'СалонКрасоты', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\СалонКрасоты.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'СалонКрасоты_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\СалонКрасоты_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [СалонКрасоты] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [СалонКрасоты].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [СалонКрасоты] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [СалонКрасоты] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [СалонКрасоты] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [СалонКрасоты] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [СалонКрасоты] SET ARITHABORT OFF 
GO
ALTER DATABASE [СалонКрасоты] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [СалонКрасоты] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [СалонКрасоты] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [СалонКрасоты] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [СалонКрасоты] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [СалонКрасоты] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [СалонКрасоты] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [СалонКрасоты] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [СалонКрасоты] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [СалонКрасоты] SET  DISABLE_BROKER 
GO
ALTER DATABASE [СалонКрасоты] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [СалонКрасоты] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [СалонКрасоты] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [СалонКрасоты] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [СалонКрасоты] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [СалонКрасоты] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [СалонКрасоты] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [СалонКрасоты] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [СалонКрасоты] SET  MULTI_USER 
GO
ALTER DATABASE [СалонКрасоты] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [СалонКрасоты] SET DB_CHAINING OFF 
GO
ALTER DATABASE [СалонКрасоты] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [СалонКрасоты] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [СалонКрасоты] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [СалонКрасоты] SET QUERY_STORE = OFF
GO
USE [СалонКрасоты]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 13.04.2022 10:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[MiddleName] [nvarchar](max) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 13.04.2022 10:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[MiddleName] [nvarchar](max) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[Login] [nvarchar](60) NOT NULL,
	[Password] [nvarchar](60) NOT NULL,
	[PositionId] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 13.04.2022 10:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Accepted] [bit] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderService]    Script Date: 13.04.2022 10:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
 CONSTRAINT [PK_OrderService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 13.04.2022 10:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](60) NOT NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 13.04.2022 10:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 13.04.2022 10:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Логин] [nvarchar](max) NOT NULL,
	[Пароль] [nvarchar](max) NOT NULL,
	[Должность] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [LastName], [MiddleName], [FirstName], [Phone]) VALUES (1, N'Тарасова', N'Алиса', N'Кирилловна', N'+7 (922) 291-9524')
INSERT [dbo].[Client] ([ID], [LastName], [MiddleName], [FirstName], [Phone]) VALUES (2, N'Акимова', N'Елизавета', N'Максимовна', N'+7 (922) 731-2868')
INSERT [dbo].[Client] ([ID], [LastName], [MiddleName], [FirstName], [Phone]) VALUES (3, N'Захаров', N'Константин', N'Константинович', N'+7 (922) 701-1950')
INSERT [dbo].[Client] ([ID], [LastName], [MiddleName], [FirstName], [Phone]) VALUES (4, N'Гончаров', N'Давид', N'Никитич', N'+7 (922) 865-8116')
INSERT [dbo].[Client] ([ID], [LastName], [MiddleName], [FirstName], [Phone]) VALUES (5, N'Федорова', N'Маргарита', N'Тихоновна', N'+7 (922) 778-1015')
INSERT [dbo].[Client] ([ID], [LastName], [MiddleName], [FirstName], [Phone]) VALUES (6, N'Завьялова', N'София', N'Тихоновна', N'+7 (800)615-0708')
INSERT [dbo].[Client] ([ID], [LastName], [MiddleName], [FirstName], [Phone]) VALUES (7, N'Кузнецов', N'Максим', N'Ильич', N'+7 (922) 867-5881')
INSERT [dbo].[Client] ([ID], [LastName], [MiddleName], [FirstName], [Phone]) VALUES (8, N'Евсеев', N'Артур', N'Иванович', N'+7 (922) 239-3788')
INSERT [dbo].[Client] ([ID], [LastName], [MiddleName], [FirstName], [Phone]) VALUES (9, N'Алексеев', N'Антон', N'Елисеевич', N'+7 (922) 916-5890')
INSERT [dbo].[Client] ([ID], [LastName], [MiddleName], [FirstName], [Phone]) VALUES (10, N'Павлов', N'Дамир', N'Даниэльевич', N'+7 (922) 006-0229')
INSERT [dbo].[Client] ([ID], [LastName], [MiddleName], [FirstName], [Phone]) VALUES (11, N'Козлова', N'Дарья', N'Никитична', N'+7 (922) 948-6760')
INSERT [dbo].[Client] ([ID], [LastName], [MiddleName], [FirstName], [Phone]) VALUES (12, N'Кузнецова', N'Аиша', N'Викторовна', N'+7 (922) 519-3109')
INSERT [dbo].[Client] ([ID], [LastName], [MiddleName], [FirstName], [Phone]) VALUES (13, N'Митрофанова', N'Василиса', N'Андреевна', N'+7 (922) 570-9676')
INSERT [dbo].[Client] ([ID], [LastName], [MiddleName], [FirstName], [Phone]) VALUES (14, N'Некрасова', N'Татьяна', N'Михайловна', N'+7 (922) 238-1407')
INSERT [dbo].[Client] ([ID], [LastName], [MiddleName], [FirstName], [Phone]) VALUES (15, N'Егоров', N'Денис', N'Демидович', N'+7 (922) 991-5023')
INSERT [dbo].[Client] ([ID], [LastName], [MiddleName], [FirstName], [Phone]) VALUES (16, N'Мельникова', N'Мария', N'Романовна', N'+7 (922) 538-0693')
INSERT [dbo].[Client] ([ID], [LastName], [MiddleName], [FirstName], [Phone]) VALUES (17, N'Румянцев', N'Артём', N'Михайлович', N'+7 (922) 027-7880')
INSERT [dbo].[Client] ([ID], [LastName], [MiddleName], [FirstName], [Phone]) VALUES (18, N'Носов', N'Марк', N'Максимович', N'+7 (922) 982-7300')
INSERT [dbo].[Client] ([ID], [LastName], [MiddleName], [FirstName], [Phone]) VALUES (19, N'Елисеева', N'Мария', N'Олеговна', N'+7 (922) 387-8214')
INSERT [dbo].[Client] ([ID], [LastName], [MiddleName], [FirstName], [Phone]) VALUES (20, N'Самсонов', N'Марк', N'Арсентьевич', N'+7 (922) 249-3231')
INSERT [dbo].[Client] ([ID], [LastName], [MiddleName], [FirstName], [Phone]) VALUES (21, N'Борисов', N'Артём', N'Ильич', N'+7 (922) 011-8902')
INSERT [dbo].[Client] ([ID], [LastName], [MiddleName], [FirstName], [Phone]) VALUES (22, N'Степанов', N'Роман', N'Дмитриевич', N'+7 (922) 456-5409')
INSERT [dbo].[Client] ([ID], [LastName], [MiddleName], [FirstName], [Phone]) VALUES (23, N'Архипова', N'Дарья', N'Никитична', N'+7 (922) 014-9057')
INSERT [dbo].[Client] ([ID], [LastName], [MiddleName], [FirstName], [Phone]) VALUES (24, N'Воронков', N'Сергей', N'Тимофеевич', N'+7 (922) 800-6098')
INSERT [dbo].[Client] ([ID], [LastName], [MiddleName], [FirstName], [Phone]) VALUES (25, N'Морозов', N'Кирилл', N'Львович', N'+7 (922) 156-6151')
INSERT [dbo].[Client] ([ID], [LastName], [MiddleName], [FirstName], [Phone]) VALUES (26, N'Парамонова', N'Ульяна', N'Руслановна', N'+7 (922) 219-3019')
INSERT [dbo].[Client] ([ID], [LastName], [MiddleName], [FirstName], [Phone]) VALUES (27, N'Тарасова', N'Стефания', N'Тимуровна', N'+7 (922) 827-8299')
INSERT [dbo].[Client] ([ID], [LastName], [MiddleName], [FirstName], [Phone]) VALUES (28, N'Давыдов', N'Кирилл', N'Васильевич', N'+7 (922) 705-8843')
INSERT [dbo].[Client] ([ID], [LastName], [MiddleName], [FirstName], [Phone]) VALUES (29, N'Петрова', N'Ярослава', N'Юрьевна', N'+7 (922) 005-5835')
INSERT [dbo].[Client] ([ID], [LastName], [MiddleName], [FirstName], [Phone]) VALUES (30, N'Маслова', N'Лада', N'Егоровна', N'+7 (922) 260-8372')
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([ID], [LastName], [MiddleName], [FirstName], [Login], [Password], [PositionId]) VALUES (1, N'Баженова', N'Ольга', N'Адамовна', N'Weiaaaa', N'aS2vVf', 1)
INSERT [dbo].[Employee] ([ID], [LastName], [MiddleName], [FirstName], [Login], [Password], [PositionId]) VALUES (2, N'Тихомиров', N'Даниил', N'Михайлович', N'Xiadney', N'OA6yHe', 2)
INSERT [dbo].[Employee] ([ID], [LastName], [MiddleName], [FirstName], [Login], [Password], [PositionId]) VALUES (3, N'Юдина', N'Анна', N'Богдановна', N'Ziya', N'9mZXNo', 3)
INSERT [dbo].[Employee] ([ID], [LastName], [MiddleName], [FirstName], [Login], [Password], [PositionId]) VALUES (4, N'Козлова', N'Виктория', N'Максимовна', N'Sabig', N'U6ixif', 4)
INSERT [dbo].[Employee] ([ID], [LastName], [MiddleName], [FirstName], [Login], [Password], [PositionId]) VALUES (5, N'Мартынов', N'Виктор', N'Тимофеевич', N'Iscat', N'gpkVgv', 5)
INSERT [dbo].[Employee] ([ID], [LastName], [MiddleName], [FirstName], [Login], [Password], [PositionId]) VALUES (6, N'Иванова', N'Ксения', N'Сергеевна', N'Ungingri', N'1GyrjC', 6)
INSERT [dbo].[Employee] ([ID], [LastName], [MiddleName], [FirstName], [Login], [Password], [PositionId]) VALUES (7, N'Куприянова', N'Стефания', N'Ярославовна', N'Gannar', N'ASiywI', 7)
INSERT [dbo].[Employee] ([ID], [LastName], [MiddleName], [FirstName], [Login], [Password], [PositionId]) VALUES (8, N'Ефимова', N'Надежда', N'Сергеевна', N'Drago', N'ILtw4T', 8)
INSERT [dbo].[Employee] ([ID], [LastName], [MiddleName], [FirstName], [Login], [Password], [PositionId]) VALUES (9, N'Баранова', N'Елизавета', N'Мироновна', N'Farric', N'udKryM', 9)
INSERT [dbo].[Employee] ([ID], [LastName], [MiddleName], [FirstName], [Login], [Password], [PositionId]) VALUES (10, N'Попова', N'Нина', N'Глебовна', N'Candra', N'kXgSnh', 10)
INSERT [dbo].[Employee] ([ID], [LastName], [MiddleName], [FirstName], [Login], [Password], [PositionId]) VALUES (11, N'Золотова', N'Алиса', N'Тимофеевна', N'Enari', N'6YZBvD', 2)
INSERT [dbo].[Employee] ([ID], [LastName], [MiddleName], [FirstName], [Login], [Password], [PositionId]) VALUES (12, N'Казакова', N'Василиса', N'Ильинична', N'Merolena', N'OJDbOb', 6)
INSERT [dbo].[Employee] ([ID], [LastName], [MiddleName], [FirstName], [Login], [Password], [PositionId]) VALUES (13, N'Дмитриева', N'Елизавета', N'Никитична', N'Lley', N'yzfwH5', 10)
INSERT [dbo].[Employee] ([ID], [LastName], [MiddleName], [FirstName], [Login], [Password], [PositionId]) VALUES (14, N'Николаева', N'Александра', N'Данииловна', N'Onaeve', N'2zAR2x', 3)
INSERT [dbo].[Employee] ([ID], [LastName], [MiddleName], [FirstName], [Login], [Password], [PositionId]) VALUES (15, N'Шевелева', N'Анна', N'Артёмовна', N'Donanda', N'QhYfl5', 5)
INSERT [dbo].[Employee] ([ID], [LastName], [MiddleName], [FirstName], [Login], [Password], [PositionId]) VALUES (16, N'Краснова', N'Полина', N'Ивановна', N'Vereha', N'7JoKTt', 7)
INSERT [dbo].[Employee] ([ID], [LastName], [MiddleName], [FirstName], [Login], [Password], [PositionId]) VALUES (17, N'Третьяков', N'Глеб', N'Тимофеевич', N'Winifama', N'UAccxy', 9)
INSERT [dbo].[Employee] ([ID], [LastName], [MiddleName], [FirstName], [Login], [Password], [PositionId]) VALUES (18, N'Дубова', N'София', N'Сергеевна', N'Parsono', N'2hj7bY', 8)
INSERT [dbo].[Employee] ([ID], [LastName], [MiddleName], [FirstName], [Login], [Password], [PositionId]) VALUES (19, N'Смирнова', N'Виктория', N'Ильинична', N'Jener', N'nFuceb', 7)
INSERT [dbo].[Employee] ([ID], [LastName], [MiddleName], [FirstName], [Login], [Password], [PositionId]) VALUES (20, N'Егоров', N'Виктор', N'Никитич', N'Iann', N'w4PlZn', 6)
INSERT [dbo].[Employee] ([ID], [LastName], [MiddleName], [FirstName], [Login], [Password], [PositionId]) VALUES (21, N'Зайцева', N'Таисия', N'Александровна', N'Manue', N'LAjH12', 5)
INSERT [dbo].[Employee] ([ID], [LastName], [MiddleName], [FirstName], [Login], [Password], [PositionId]) VALUES (22, N'Егорова', N'Ксения', N'Тимофеевна', N'Fiore', N'8CkoIF', 4)
INSERT [dbo].[Employee] ([ID], [LastName], [MiddleName], [FirstName], [Login], [Password], [PositionId]) VALUES (23, N'Гусев', N'Матвей', N'Александрович', N'Woodr', N'wwjd1d', 3)
INSERT [dbo].[Employee] ([ID], [LastName], [MiddleName], [FirstName], [Login], [Password], [PositionId]) VALUES (24, N'Исаева', N'Александра', N'Максимовна', N'Zionetic', N'mN1uNq', 2)
INSERT [dbo].[Employee] ([ID], [LastName], [MiddleName], [FirstName], [Login], [Password], [PositionId]) VALUES (25, N'Макаров', N'Алексей', N'Кириллович', N'Vachilo', N'55hSaG', 2)
INSERT [dbo].[Employee] ([ID], [LastName], [MiddleName], [FirstName], [Login], [Password], [PositionId]) VALUES (26, N'Розанова', N'Ирина', N'Георгиевна', N'Xton', N'5W3Oq5', 3)
INSERT [dbo].[Employee] ([ID], [LastName], [MiddleName], [FirstName], [Login], [Password], [PositionId]) VALUES (27, N'Осипова', N'Софья', N'Кирилловна', N'Orit', N'kVFrFc', 4)
INSERT [dbo].[Employee] ([ID], [LastName], [MiddleName], [FirstName], [Login], [Password], [PositionId]) VALUES (28, N'Гончарова', N'Варвара', N'Павловна', N'Unee', N'PEHLTs', 5)
INSERT [dbo].[Employee] ([ID], [LastName], [MiddleName], [FirstName], [Login], [Password], [PositionId]) VALUES (29, N'Беляева', N'Мила', N'Львовна', N'Brinal', N'ER01WL', 1)
INSERT [dbo].[Employee] ([ID], [LastName], [MiddleName], [FirstName], [Login], [Password], [PositionId]) VALUES (30, N'Медведева', N'Майя', N'Никитична', N'Hadaira', N'O1I03A', 1)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [ClientID], [Date], [EmployeeID], [Accepted]) VALUES (1, 1, CAST(N'2021-05-06' AS Date), 15, 1)
INSERT [dbo].[Order] ([ID], [ClientID], [Date], [EmployeeID], [Accepted]) VALUES (2, 15, CAST(N'2021-05-18' AS Date), 14, 0)
INSERT [dbo].[Order] ([ID], [ClientID], [Date], [EmployeeID], [Accepted]) VALUES (3, 3, CAST(N'2021-04-13' AS Date), 27, 1)
INSERT [dbo].[Order] ([ID], [ClientID], [Date], [EmployeeID], [Accepted]) VALUES (4, 4, CAST(N'2021-05-12' AS Date), 12, 1)
INSERT [dbo].[Order] ([ID], [ClientID], [Date], [EmployeeID], [Accepted]) VALUES (5, 11, CAST(N'2021-04-26' AS Date), 11, 1)
INSERT [dbo].[Order] ([ID], [ClientID], [Date], [EmployeeID], [Accepted]) VALUES (6, 6, CAST(N'2021-04-29' AS Date), 10, 0)
INSERT [dbo].[Order] ([ID], [ClientID], [Date], [EmployeeID], [Accepted]) VALUES (7, 7, CAST(N'2021-05-13' AS Date), 22, 1)
INSERT [dbo].[Order] ([ID], [ClientID], [Date], [EmployeeID], [Accepted]) VALUES (8, 8, CAST(N'2021-04-27' AS Date), 25, 1)
INSERT [dbo].[Order] ([ID], [ClientID], [Date], [EmployeeID], [Accepted]) VALUES (9, 12, CAST(N'2021-04-21' AS Date), 19, 1)
INSERT [dbo].[Order] ([ID], [ClientID], [Date], [EmployeeID], [Accepted]) VALUES (10, 10, CAST(N'2021-05-31' AS Date), 23, 0)
INSERT [dbo].[Order] ([ID], [ClientID], [Date], [EmployeeID], [Accepted]) VALUES (11, 23, CAST(N'2021-05-10' AS Date), 8, 1)
INSERT [dbo].[Order] ([ID], [ClientID], [Date], [EmployeeID], [Accepted]) VALUES (12, 28, CAST(N'2021-05-14' AS Date), 3, 1)
INSERT [dbo].[Order] ([ID], [ClientID], [Date], [EmployeeID], [Accepted]) VALUES (13, 13, CAST(N'2021-04-14' AS Date), 7, 1)
INSERT [dbo].[Order] ([ID], [ClientID], [Date], [EmployeeID], [Accepted]) VALUES (14, 25, CAST(N'2021-05-07' AS Date), 10, 0)
INSERT [dbo].[Order] ([ID], [ClientID], [Date], [EmployeeID], [Accepted]) VALUES (15, 15, CAST(N'2021-04-15' AS Date), 12, 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderService] ON 

INSERT [dbo].[OrderService] ([ID], [ServiceID], [OrderID]) VALUES (1, 4, 1)
INSERT [dbo].[OrderService] ([ID], [ServiceID], [OrderID]) VALUES (2, 12, 2)
INSERT [dbo].[OrderService] ([ID], [ServiceID], [OrderID]) VALUES (3, 10, 3)
INSERT [dbo].[OrderService] ([ID], [ServiceID], [OrderID]) VALUES (4, 11, 4)
INSERT [dbo].[OrderService] ([ID], [ServiceID], [OrderID]) VALUES (5, 21, 5)
INSERT [dbo].[OrderService] ([ID], [ServiceID], [OrderID]) VALUES (6, 26, 6)
INSERT [dbo].[OrderService] ([ID], [ServiceID], [OrderID]) VALUES (7, 23, 7)
INSERT [dbo].[OrderService] ([ID], [ServiceID], [OrderID]) VALUES (8, 8, 8)
INSERT [dbo].[OrderService] ([ID], [ServiceID], [OrderID]) VALUES (9, 4, 9)
INSERT [dbo].[OrderService] ([ID], [ServiceID], [OrderID]) VALUES (10, 13, 10)
INSERT [dbo].[OrderService] ([ID], [ServiceID], [OrderID]) VALUES (11, 22, 11)
INSERT [dbo].[OrderService] ([ID], [ServiceID], [OrderID]) VALUES (12, 7, 12)
INSERT [dbo].[OrderService] ([ID], [ServiceID], [OrderID]) VALUES (13, 3, 13)
INSERT [dbo].[OrderService] ([ID], [ServiceID], [OrderID]) VALUES (14, 5, 14)
INSERT [dbo].[OrderService] ([ID], [ServiceID], [OrderID]) VALUES (15, 1, 15)
SET IDENTITY_INSERT [dbo].[OrderService] OFF
GO
SET IDENTITY_INSERT [dbo].[Position] ON 

INSERT [dbo].[Position] ([ID], [Name]) VALUES (1, N'Администратор')
INSERT [dbo].[Position] ([ID], [Name]) VALUES (2, N'Парикмахер-стилист')
INSERT [dbo].[Position] ([ID], [Name]) VALUES (3, N'Мастер маникюра и педикюра')
INSERT [dbo].[Position] ([ID], [Name]) VALUES (4, N'Косметолог')
INSERT [dbo].[Position] ([ID], [Name]) VALUES (5, N'Визажист')
INSERT [dbo].[Position] ([ID], [Name]) VALUES (6, N'Помощник парикмахера')
INSERT [dbo].[Position] ([ID], [Name]) VALUES (7, N'Менеджер')
INSERT [dbo].[Position] ([ID], [Name]) VALUES (8, N'Мастер эпиляции')
INSERT [dbo].[Position] ([ID], [Name]) VALUES (9, N'Парикмахер-универсал')
INSERT [dbo].[Position] ([ID], [Name]) VALUES (10, N'Стилист')
SET IDENTITY_INSERT [dbo].[Position] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ID], [Name], [Price]) VALUES (1, N'Женская стрижка с укладкой', 2200.0000)
INSERT [dbo].[Service] ([ID], [Name], [Price]) VALUES (2, N'Укладка волос повседневная', 1500.0000)
INSERT [dbo].[Service] ([ID], [Name], [Price]) VALUES (3, N'Укладка волос вечерняя (свадебная, коктейльная и пр.)', 3300.0000)
INSERT [dbo].[Service] ([ID], [Name], [Price]) VALUES (4, N'Окрашивание волос однотонное (Wella Professionals)', 4400.0000)
INSERT [dbo].[Service] ([ID], [Name], [Price]) VALUES (5, N'Окрашивание волос комбинированное/многоцветное (Wella Professionals)', 6000.0000)
INSERT [dbo].[Service] ([ID], [Name], [Price]) VALUES (6, N'Тонирование (Wella Professionals)', 4400.0000)
INSERT [dbo].[Service] ([ID], [Name], [Price]) VALUES (7, N'Мелирование на фольгу', 4500.0000)
INSERT [dbo].[Service] ([ID], [Name], [Price]) VALUES (8, N'Мелирование Freelights', 3500.0000)
INSERT [dbo].[Service] ([ID], [Name], [Price]) VALUES (9, N'Окрашивание балаяж', 10300.0000)
INSERT [dbo].[Service] ([ID], [Name], [Price]) VALUES (10, N'Маникюр', 1100.0000)
INSERT [dbo].[Service] ([ID], [Name], [Price]) VALUES (11, N'Спа-маникюр', 1600.0000)
INSERT [dbo].[Service] ([ID], [Name], [Price]) VALUES (12, N'Спа-педикюр', 3300.0000)
INSERT [dbo].[Service] ([ID], [Name], [Price]) VALUES (13, N'SPA-уход за ногами (пилинг, массаж, маска)', 500.0000)
INSERT [dbo].[Service] ([ID], [Name], [Price]) VALUES (14, N'Консультация врача-дерматокосметолога', 600.0000)
INSERT [dbo].[Service] ([ID], [Name], [Price]) VALUES (15, N'Чистка лица (Holy Land)', 3500.0000)
INSERT [dbo].[Service] ([ID], [Name], [Price]) VALUES (16, N'Чистка лица (Carita)', 3500.0000)
INSERT [dbo].[Service] ([ID], [Name], [Price]) VALUES (17, N'Программа ухода CARITA', 5120.0000)
INSERT [dbo].[Service] ([ID], [Name], [Price]) VALUES (18, N'Экспресс-макияж', 2500.0000)
INSERT [dbo].[Service] ([ID], [Name], [Price]) VALUES (19, N'Дневной макияж', 3500.0000)
INSERT [dbo].[Service] ([ID], [Name], [Price]) VALUES (20, N'Коктейльный макияж', 3500.0000)
INSERT [dbo].[Service] ([ID], [Name], [Price]) VALUES (21, N'Вечерний макияж', 4500.0000)
INSERT [dbo].[Service] ([ID], [Name], [Price]) VALUES (22, N'Окрашивание бровей', 700.0000)
INSERT [dbo].[Service] ([ID], [Name], [Price]) VALUES (23, N'Окрашивание бровей хной', 1000.0000)
INSERT [dbo].[Service] ([ID], [Name], [Price]) VALUES (24, N'Окрашивание ресниц', 700.0000)
INSERT [dbo].[Service] ([ID], [Name], [Price]) VALUES (25, N'Форма бровей', 1000.0000)
INSERT [dbo].[Service] ([ID], [Name], [Price]) VALUES (26, N'Консультация «Цветотип внешности - природная палитра человека» (60 мин.)', 5500.0000)
INSERT [dbo].[Service] ([ID], [Name], [Price]) VALUES (27, N'Консультация «Подбор прически/образа с учетом модных тенденций» (30 мин.)', 2000.0000)
INSERT [dbo].[Service] ([ID], [Name], [Price]) VALUES (28, N'Фотоэпиляция ног целиком', 30000.0000)
INSERT [dbo].[Service] ([ID], [Name], [Price]) VALUES (29, N'Фотоэпиляция пальца', 300.0000)
INSERT [dbo].[Service] ([ID], [Name], [Price]) VALUES (30, N'Фотоэпиляция кисти', 3000.0000)
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
INSERT [dbo].[User] ([Логин], [Пароль], [Должность]) VALUES (N'Login1', N'Password1', N'Сотрудник')
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Position] FOREIGN KEY([PositionId])
REFERENCES [dbo].[Position] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Position]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Client]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Employee]
GO
ALTER TABLE [dbo].[OrderService]  WITH CHECK ADD  CONSTRAINT [FK_OrderService_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderService] CHECK CONSTRAINT [FK_OrderService_Order]
GO
ALTER TABLE [dbo].[OrderService]  WITH CHECK ADD  CONSTRAINT [FK_OrderService_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[OrderService] CHECK CONSTRAINT [FK_OrderService_Service]
GO
USE [master]
GO
ALTER DATABASE [СалонКрасоты] SET  READ_WRITE 
GO
