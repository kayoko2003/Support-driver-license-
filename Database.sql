USE [master]
GO
/****** Object:  Database [Support_License]    Script Date: 7/20/2024 8:43:11 AM ******/
CREATE DATABASE [Support_License]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Support_License', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Support_License.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Support_License_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Support_License_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Support_License] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Support_License].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Support_License] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Support_License] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Support_License] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Support_License] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Support_License] SET ARITHABORT OFF 
GO
ALTER DATABASE [Support_License] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Support_License] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Support_License] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Support_License] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Support_License] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Support_License] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Support_License] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Support_License] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Support_License] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Support_License] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Support_License] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Support_License] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Support_License] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Support_License] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Support_License] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Support_License] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Support_License] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Support_License] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Support_License] SET  MULTI_USER 
GO
ALTER DATABASE [Support_License] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Support_License] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Support_License] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Support_License] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Support_License] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Support_License] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Support_License] SET QUERY_STORE = ON
GO
ALTER DATABASE [Support_License] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Support_License]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/20/2024 8:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Account_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_Name] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Gender] [bit] NULL,
	[Dob] [date] NULL,
	[isAdmin] [bit] NULL,
	[isDelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Account_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 7/20/2024 8:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[Answer_ID] [int] IDENTITY(1,1) NOT NULL,
	[Question_ID] [int] NULL,
	[Content] [nvarchar](200) NOT NULL,
	[Correct_Answer] [bit] NOT NULL,
	[User_Selected] [nvarchar](50) NULL,
 CONSTRAINT [PK__Answer__36918F5872D6B36A] PRIMARY KEY CLUSTERED 
(
	[Answer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 7/20/2024 8:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[Exam_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[License_Type_ID] [int] NULL,
	[Create_By] [int] NULL,
	[Is_Delete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Exam_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamDetail]    Script Date: 7/20/2024 8:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamDetail](
	[Question_ID] [int] NOT NULL,
	[Exam_ID] [int] NOT NULL,
 CONSTRAINT [PK_ExamDetail] PRIMARY KEY CLUSTERED 
(
	[Question_ID] ASC,
	[Exam_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LicenseType]    Script Date: 7/20/2024 8:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LicenseType](
	[License_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[License_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Penalize]    Script Date: 7/20/2024 8:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Penalize](
	[penalize_id] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](500) NOT NULL,
	[fines] [nvarchar](100) NOT NULL,
	[License_Type_ID] [int] NULL,
	[Create_By] [int] NULL,
	[Is_Delete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[penalize_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 7/20/2024 8:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[Question_ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](200) NOT NULL,
	[Question_Type_ID] [int] NULL,
	[Image] [nvarchar](100) NULL,
	[Explain] [nchar](500) NULL,
	[Create_By] [int] NULL,
	[Is_Delete] [bit] NULL,
 CONSTRAINT [PK__Question__B0B2E4C65A2A4736] PRIMARY KEY CLUSTERED 
(
	[Question_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionLicenseType]    Script Date: 7/20/2024 8:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionLicenseType](
	[Question_ID] [int] NOT NULL,
	[License_Type_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Question_ID] ASC,
	[License_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionType]    Script Date: 7/20/2024 8:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionType](
	[Question_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](50) NULL,
 CONSTRAINT [PK__Question__509FE2BB36890E7E] PRIMARY KEY CLUSTERED 
(
	[Question_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Result]    Script Date: 7/20/2024 8:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[Account_ID] [int] NOT NULL,
	[Exam_ID] [int] NOT NULL,
	[Result] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Account_ID] ASC,
	[Exam_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Account_ID], [User_Name], [Password], [Email], [Gender], [Dob], [isAdmin], [isDelete]) VALUES (1, N'kayoko', N'123', N'ngocqd2@gmail.com', 1, CAST(N'2003-03-01' AS Date), 1, 0)
INSERT [dbo].[Account] ([Account_ID], [User_Name], [Password], [Email], [Gender], [Dob], [isAdmin], [isDelete]) VALUES (2, N'ngoc', N'a', N'ngoctdhe171604@fpt.edu.vn', 0, CAST(N'2003-03-11' AS Date), 0, 0)
INSERT [dbo].[Account] ([Account_ID], [User_Name], [Password], [Email], [Gender], [Dob], [isAdmin], [isDelete]) VALUES (3, N'abc', N'123', N'ngoc', 1, CAST(N'2024-07-11' AS Date), 0, 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Answer] ON 

INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (2, 1, N'1 - Phần mặt đường và lề đường.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (3, 1, N'2 - Phần đường xe chạy', 1, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (4, 1, N'3 - Phần đường xe cơ giới.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (5, 2, N'1 - Phương tiện giao thông cơ giới đường bộ.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (6, 2, N'2 - Phương tiện giao thông thô sơ đường bộ và xe máy chuyên dùng.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (8, 2, N'3 - Cả ý 1 và ý 2.', 1, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (9, 3, N'1- Chỉ bị nhắc nhở.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (10, 3, N'2- Bị xử phạt hành chính hoặc có thể bị xử lý hình sự tùy theo mức độ vi phạm.', 1, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (11, 3, N'3- Không bị xử lý hình sự.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (12, 4, N'1- Không được vượt.', 1, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (13, 4, N'2- Được vượt khi đang đi trên cầu.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (14, 4, N'3- Được phép vượt khi đi qua nơi giao nhau có ít phương tiện cùng tham gia giao thông.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (15, 4, N'4- Được vượt khi đảm bảo an toàn.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (16, 5, N'1- Chỉ được kéo nếu đã nhìn thấy trạm xăng.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (17, 5, N'2- Chỉ được thực hiện trên đường vắng phương tiện cùng tham gia giao thông.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (18, 5, N'3- Không được phép.', 1, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (19, 6, N'1- Biển báo nguy hiểm.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (20, 6, N'2- Biển báo cấm.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (21, 6, N'3- Biển báo hiệu lệnh phải thi hành.', 1, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (22, 6, N'4- Biển báo chỉ dẫn.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (23, 7, N'1- Phải báo hiệu bằng đèn hoặc còi;', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (24, 7, N'2- Chỉ được báo hiệu bằng còi.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (25, 7, N'3- Phải báo hiệu bằng cả còi và đèn.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (26, 7, N'4- Chỉ được báo hiệu bằng đèn.', 1, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (27, 8, N'1- Xe cơ giới, xe máy chuyên dùng phải bật đèn; xe thô sơ phải bật đèn hoặc có vật phát sáng báo hiệu; chỉ được dừng xe, đỗ xe ở nơi quy định.', 1, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (28, 8, N'2- Xe cơ giới phải bật đèn ngay cả khi đường hầm sáng; phải cho xe chạy trên một làn đường và chỉ chuyển làn ở nơi được phép; được quay đầu xe, lùi xe khi cần thiết.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (29, 8, N'3- Xe máy chuyên dùng phải bật đèn ngay cả khi đường hầm sáng; phải cho xe chạy trên một làn đường và chỉ chuyển làn ở nơi được phép; được quay đầu xe, lùi xe khi cần thiết.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (30, 9, N'1- Xe bị vượt bất ngờ tăng tốc độ và cố tình không nhường đường.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (31, 9, N'2- Xe bị vượt giảm tốc độ và nhường đường.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (32, 9, N'3- Phát hiện có xe đi ngược chiều.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (33, 9, N'4- Cả ý 1 và ý 3.', 1, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (34, 10, N'1- Chủ động giữ khoảng cách an toàn phù hợp với xe chạy liền trước xe của mình.
', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (35, 10, N'2- Đảm bảo khoảng cách an toàn theo mật độ phương tiện, tình hình giao thông thực tế.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (36, 10, N'3- Cả ý 1 và ý 2.', 1, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (37, 11, N'1- Ra tín hiệu bằng tay rồi cho xe vượt qua.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (38, 11, N'2- Tăng ga mạnh để gây sự chú ý rồi cho xe vượt qua.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (39, 11, N'3- Bạn phải có tín hiệu bằng đèn hoặc còi.', 1, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (40, 12, N'1- Giữ tay ga ở mức độ phù hợp, sử dụng phanh trước và phanh sau để giảm tốc độ.', 1, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (41, 12, N'2- Nhả hết tay ga, tắt động cơ, sử dụng phanh trước và phanh sau để giảm tốc độ.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (42, 12, N'3- Sử dụng phanh trước để giảm tốc độ kết hợp với tắt chìa khóa điện của xe.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (43, 13, N'1- Để điều khiển xe chạy về phía trước.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (44, 13, N'2- Để điều tiết công suất động cơ qua đó điều khiển tốc độ của xe.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (45, 13, N'3- Để điều khiển xe chạy lùi.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (46, 13, N'4- Cả ý 1 và ý 2.', 1, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (47, 14, N'1- Biển 1.', 1, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (48, 14, N'2- Biển 2.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (49, 14, N'3- Cả hai biển.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (50, 15, N'1- Biển 1.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (51, 15, N'2- Biển 2.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (52, 15, N'3- Biển 1 và 2.', 1, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (53, 16, N'1- Biển 1.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (54, 16, N'2- Biển 2.', 1, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (55, 16, N'3- Biển 3.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (56, 17, N'1- Biển 1 và 2.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (57, 17, N'2- Biển 1 và 3.', 1, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (58, 17, N'3- Biển 2 và 3.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (59, 17, N'4- Cả ba biển.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (60, 18, N'1- Biển 1.', 1, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (61, 18, N'2- Biển 2.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (62, 18, N'3- Biển 3.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (63, 19, N'1- Biển 1.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (64, 19, N'2- Biển 2.', 1, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (65, 19, N'3- Biển 3.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (66, 20, N'1- Biển 1.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (67, 20, N'2- Biển 2.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (68, 20, N'3- Biển 3.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (69, 20, N'4- Biển 2 và 3.', 1, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (70, 21, N'1- Vạch 1.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (71, 21, N'2- Vạch 2.', 1, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (72, 21, N'3- Vạch 3.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (73, 21, N'4- Cả 3 vạch.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (74, 22, N'1- Mô tô.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (75, 22, N'2- Xe cứu thương.', 1, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (76, 23, N'1- Đúng.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (77, 23, N'2- Không đúng.', 1, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (78, 24, N'1- Cả ba hướng.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (79, 24, N'2- Hướng 1 và 2.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (80, 24, N'3- Hướng 1 và 3.', 1, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (81, 24, N'4- Hướng 2 và 3.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (152, 25, N'1- Xe con, xe tải, xe khách.', 0, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (153, 25, N'2- Xe tải, xe khách, xe mô tô.', 1, NULL)
INSERT [dbo].[Answer] ([Answer_ID], [Question_ID], [Content], [Correct_Answer], [User_Selected]) VALUES (156, 25, N'3- Xe khách, xe mô tô, xe con.', 0, NULL)
SET IDENTITY_INSERT [dbo].[Answer] OFF
GO
SET IDENTITY_INSERT [dbo].[Exam] ON 

INSERT [dbo].[Exam] ([Exam_ID], [Name], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (1, N'Đề 1', 1, 1, 0)
INSERT [dbo].[Exam] ([Exam_ID], [Name], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (2, N'Đề 2', 1, 1, 0)
INSERT [dbo].[Exam] ([Exam_ID], [Name], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (3, N'Đề 3', 1, 1, 0)
INSERT [dbo].[Exam] ([Exam_ID], [Name], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (4, N'Exam 4', 2, 1, 1)
INSERT [dbo].[Exam] ([Exam_ID], [Name], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (5, N'Exam 5', 2, 1, 1)
INSERT [dbo].[Exam] ([Exam_ID], [Name], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (6, N'exam 5', 1, 1, 1)
INSERT [dbo].[Exam] ([Exam_ID], [Name], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (7, N'exam 6', 1, 1, 1)
INSERT [dbo].[Exam] ([Exam_ID], [Name], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (8, N'1234567', 1, 1, 1)
INSERT [dbo].[Exam] ([Exam_ID], [Name], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (9, N'My name', 2, 1, 1)
INSERT [dbo].[Exam] ([Exam_ID], [Name], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (10, N'12', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Exam] OFF
GO
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (1, 1)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (1, 2)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (1, 3)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (1, 9)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (1, 10)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (2, 1)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (2, 2)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (2, 3)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (2, 9)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (2, 10)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (3, 1)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (3, 2)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (3, 3)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (3, 10)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (4, 1)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (4, 2)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (4, 3)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (4, 10)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (5, 1)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (5, 2)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (5, 3)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (5, 10)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (6, 1)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (6, 2)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (6, 3)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (6, 10)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (7, 1)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (7, 2)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (7, 3)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (7, 10)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (8, 1)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (8, 2)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (8, 3)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (8, 10)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (9, 1)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (9, 2)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (9, 3)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (10, 1)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (10, 2)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (10, 3)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (10, 10)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (11, 1)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (11, 2)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (11, 3)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (11, 10)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (12, 1)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (12, 2)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (12, 3)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (13, 1)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (13, 2)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (13, 3)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (13, 10)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (14, 1)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (14, 2)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (14, 3)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (15, 1)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (15, 2)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (15, 3)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (15, 4)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (16, 1)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (16, 2)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (16, 3)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (16, 4)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (16, 5)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (17, 1)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (17, 2)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (17, 3)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (17, 4)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (17, 10)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (18, 1)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (18, 2)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (18, 3)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (18, 4)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (18, 10)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (19, 1)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (19, 2)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (19, 3)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (20, 1)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (20, 2)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (20, 3)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (21, 1)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (21, 2)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (21, 3)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (22, 1)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (22, 2)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (22, 3)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (23, 1)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (23, 2)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (23, 3)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (23, 5)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (24, 1)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (24, 2)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (24, 3)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (25, 1)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (25, 2)
INSERT [dbo].[ExamDetail] ([Question_ID], [Exam_ID]) VALUES (25, 3)
GO
SET IDENTITY_INSERT [dbo].[LicenseType] ON 

INSERT [dbo].[LicenseType] ([License_Type_ID], [Name]) VALUES (1, N'A1')
INSERT [dbo].[LicenseType] ([License_Type_ID], [Name]) VALUES (2, N'A2')
INSERT [dbo].[LicenseType] ([License_Type_ID], [Name]) VALUES (3, N'A3')
INSERT [dbo].[LicenseType] ([License_Type_ID], [Name]) VALUES (4, N'A4')
INSERT [dbo].[LicenseType] ([License_Type_ID], [Name]) VALUES (5, N'B1')
INSERT [dbo].[LicenseType] ([License_Type_ID], [Name]) VALUES (6, N'B2')
INSERT [dbo].[LicenseType] ([License_Type_ID], [Name]) VALUES (7, N'C')
INSERT [dbo].[LicenseType] ([License_Type_ID], [Name]) VALUES (8, N'D')
SET IDENTITY_INSERT [dbo].[LicenseType] OFF
GO
SET IDENTITY_INSERT [dbo].[Penalize] ON 

INSERT [dbo].[Penalize] ([penalize_id], [content], [fines], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (1, N'Xi nhan khi chuyển làn', N'100.000 - 200.000 đồng', 1, 1, 0)
INSERT [dbo].[Penalize] ([penalize_id], [content], [fines], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (3, N'Xi nhan khi chuyển hướng', N'400.000 - 600.000 đồng', 1, 1, 0)
INSERT [dbo].[Penalize] ([penalize_id], [content], [fines], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (4, N'Chở theo 02 người', N'200.000 - 300.000 đồng', 1, 1, 0)
INSERT [dbo].[Penalize] ([penalize_id], [content], [fines], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (5, N'Chở theo 03 người', N'400.000 - 600.000 đồng (tước GPLX 1-3 tháng)', 1, 1, 0)
INSERT [dbo].[Penalize] ([penalize_id], [content], [fines], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (6, N'Không xi nhan, còi khi vượt trước', N'100.000 - 200.000 đồng', 1, 1, 0)
INSERT [dbo].[Penalize] ([penalize_id], [content], [fines], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (7, N'Dùng điện thoại, thiết bị âm thanh (trừ thiết bị trợ thính)', N'800.000 - 01 triệu đồng', 1, 1, 0)
INSERT [dbo].[Penalize] ([penalize_id], [content], [fines], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (8, N'Vượt đèn đỏ, đèn vàng', N'800.000 - 01 triệu đồng', 1, 1, 0)
INSERT [dbo].[Penalize] ([penalize_id], [content], [fines], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (9, N'Sai làn', N'400.000 - 600.000 đồng', 1, 1, 0)
INSERT [dbo].[Penalize] ([penalize_id], [content], [fines], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (10, N'Đi ngược chiều', N'01 - 02 triệu đồng', 1, 1, 0)
INSERT [dbo].[Penalize] ([penalize_id], [content], [fines], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (11, N'Đi vào đường cấm', N'400.000 - 600.000 đồng', 1, 1, 0)
INSERT [dbo].[Penalize] ([penalize_id], [content], [fines], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (12, N'Không gương chiếu hậu', N'100.000 - 200.000 đồng', 1, 1, 0)
INSERT [dbo].[Penalize] ([penalize_id], [content], [fines], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (13, N'Không mang Bằng', N'100.000 - 200.000 đồng', 1, 1, 0)
INSERT [dbo].[Penalize] ([penalize_id], [content], [fines], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (14, N'Không có Bằng', N'Xe dưới 165 cmXe dưới 165 cm3 phạt 1-2 triệu đồng
Xe trên 175 cm3: phạt 4-5 triệu đồng', 1, 1, 0)
INSERT [dbo].[Penalize] ([penalize_id], [content], [fines], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (15, N'Không mang đăng ký xe', N'100.000 - 200.000 đồng', 1, 1, 0)
INSERT [dbo].[Penalize] ([penalize_id], [content], [fines], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (16, N'Không có đăng ký xe', N'300.000 - 400.000 đồng', 1, 1, 0)
INSERT [dbo].[Penalize] ([penalize_id], [content], [fines], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (17, N'Bảo hiểm', N'100.000 - 200.000 đồng', 1, 1, 0)
INSERT [dbo].[Penalize] ([penalize_id], [content], [fines], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (18, N'Không đội mũ bảo hiểm', N'400.000-600.000 đồng (NĐ 123 2021)', 1, 1, 0)
INSERT [dbo].[Penalize] ([penalize_id], [content], [fines], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (19, N'Vượt phải', N'400.000 - 600.000 đồng', 1, 1, 0)
INSERT [dbo].[Penalize] ([penalize_id], [content], [fines], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (20, N'Dừng, đỗ không đúng nơi quy định', N'200.000 - 300.000 đồng', 1, 1, 0)
INSERT [dbo].[Penalize] ([penalize_id], [content], [fines], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (21, N'Có nồng độ cồn nhưng chưa vượt quá 50 mg/100 ml máu hoặc dưới 0.25 mg/1 lít khí thở', N'02 - 03 triệu đồng
(tước Bằng từ 10 - 12 tháng)', 1, 1, 0)
INSERT [dbo].[Penalize] ([penalize_id], [content], [fines], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (22, N'Nồng độ cồn vượt quá 80 mg/100 ml máu hoặc vượt quá 0.4 mg/1 lít khí thở', N'06 - 08 triệu đồng
(tước Bằng từ 22 - 24 tháng)', 1, 1, 0)
INSERT [dbo].[Penalize] ([penalize_id], [content], [fines], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (23, N'Chạy quá tốc tộ quy định từ 5 đến dưới 10 km/h', N'200.000 - 300.000 đồng', 1, 1, 0)
INSERT [dbo].[Penalize] ([penalize_id], [content], [fines], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (24, N'Chạy quá tốc tộ quy định từ 10 đến 20 km/h', N'800.000 - 1.000.000 đồng', 1, 1, 0)
INSERT [dbo].[Penalize] ([penalize_id], [content], [fines], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (25, N'Chạy quá tốc tộ quy định trên 20 km/h', N'04 - 05 triệu đồng
(tước Bằng từ 02 - 04 tháng)', 1, 1, 0)
INSERT [dbo].[Penalize] ([penalize_id], [content], [fines], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (26, N'Đua xe máy', N'Phạt từ 10-15 triệu đồng', 1, 1, 0)
INSERT [dbo].[Penalize] ([penalize_id], [content], [fines], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (27, N'Người đi xe máy chở người ngồi trên xe không đội bảo hiểm hoặc đội mũ bảo hiểm nhưng không cài quai đúng quy cách', N'400.000 - 600.000 đồng', 1, 1, 0)
INSERT [dbo].[Penalize] ([penalize_id], [content], [fines], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (28, N'Xe máy không nhường đường hoặc gây cản trở xe được quyền ưu tiên đang phát tín hiệu ưu tiên đi làm nhiệm vụ', N'1.000.000 - 2.000.000 đồng', 1, 1, 0)
INSERT [dbo].[Penalize] ([penalize_id], [content], [fines], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (29, N'Dừng, đỗ xe máy trong hầm đường bộ không đúng nơi quy định', N'800.000 - 1.000.000 đồng', 1, 1, 0)
INSERT [dbo].[Penalize] ([penalize_id], [content], [fines], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (30, N'Đi xe máy gắn biển số không đúng quy định; gắn biển số không rõ chữ, số; gắn biển số bị bẻ cong, bị che lấp, bị hỏng; sơn, dán thêm làm thay đổi chữ, số hoặc thay đổi màu sắc của chữ, số, nền biển', N'800.000 đồng - 1.000.000 đồng', 1, 1, 0)
INSERT [dbo].[Penalize] ([penalize_id], [content], [fines], [License_Type_ID], [Create_By], [Is_Delete]) VALUES (31, N'Mức phạt mới', N'100000', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Penalize] OFF
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([Question_ID], [Content], [Question_Type_ID], [Image], [Explain], [Create_By], [Is_Delete]) VALUES (1, N'Phần của đường bộ được sử dụng cho các phương tiện giao thông qua lại là gì ?', 1, N'', N'Phần đường xe chạy là phần của đường bộ được sử dụng cho phương tiện giao thông qua lại.                                                                                                                                                                                                                                                                                                                                                                                                                            ', 1, 0)
INSERT [dbo].[Question] ([Question_ID], [Content], [Question_Type_ID], [Image], [Explain], [Create_By], [Is_Delete]) VALUES (2, N'“Phương tiện tham gia giao thông đường bộ” gồm những loại nào ?', 1, N'', N'Tại Khoản 17 Điều 3 Luật giao thông đường bộ 2008 có quy định về vấn đề này như sau: ''Phương tiện tham gia giao thông đường bộ gồm phương tiện giao thông đường bộ và xe máy chuyên dùng''.                                                                                                                                                                                                                                                                                                                          ', 1, 0)
INSERT [dbo].[Question] ([Question_ID], [Content], [Question_Type_ID], [Image], [Explain], [Create_By], [Is_Delete]) VALUES (3, N'Sử dụng rượu bia khi lái xe, nếu bị phát hiện thì bị xử lý như thế nào ?', 1, N'Images/Question/3.jpg', N'Sử dụng rượu bia khi lái xe sẽ bị xử phạt hành chính hoặc có thể bị xử lý hình sự tùy theo mức độ vi phạm.                                                                                                                                                                                                                                                                                                                                                                                                          ', 1, 0)
INSERT [dbo].[Question] ([Question_ID], [Content], [Question_Type_ID], [Image], [Explain], [Create_By], [Is_Delete]) VALUES (4, N'Bạn đang lái xe phía trước có một xe cứu thương đang phát tín hiệu ưu tiên bạn có được phép vượt hay không ?
', 1, NULL, N'Xe cứu thương thuộc diện phương tiện xe ưu tiên, có phát tín hiệu ưu tiên. Bắt buộc các phương tiện khác phải nhường đường và không được vượt. Ngoại trừ các xe theo luật định như: Cứu hỏa, Quân Sự, Công An.                                                                                                                                                                                                                                                                                                      ', 1, 0)
INSERT [dbo].[Question] ([Question_ID], [Content], [Question_Type_ID], [Image], [Explain], [Create_By], [Is_Delete]) VALUES (5, N'Hành vi sử dụng xe mô tô để kéo, đẩy xe mô tô khác bị hết xăng đến trạm mua xăng có được phép hay không ?', 1, N'Images/Question/5.jpg', N'Hành vi bám, kéo hoặc đẩy các phương tiện khác; sử dụng mô tô để kéo, đẩy mô tô khác bị hết xăng đến trạm mua xăng cũng không được phép, sẽ gây nguy hiểm cho các phương tiện khác tham gia giao thông là BỊ NGHIÊM CẤM theo luật định.                                                                                                                                                                                                                                                                             ', 1, 0)
INSERT [dbo].[Question] ([Question_ID], [Content], [Question_Type_ID], [Image], [Explain], [Create_By], [Is_Delete]) VALUES (6, N'Biển báo hiệu hình tròn có nền xanh lam có hình vẽ màu trắng là loại biển gì dưới đây ?', 2, N'Images/Question/6.jpg', N'Biển báo hiệu lệnh phải thi hành là loại biển báo hình tròn có nền màu xanh. Nội dung thể hiện bên trong nằm chính giữa và có màu trắng.                                                                                                                                                                                                                                                                                                                                                                            ', 1, 0)
INSERT [dbo].[Question] ([Question_ID], [Content], [Question_Type_ID], [Image], [Explain], [Create_By], [Is_Delete]) VALUES (7, N'Bạn đang lái xe trong khu vực đô thị từ 22 giờ đến 5 giờ sáng hôm sau và cần vượt một xe khác, bạn cần báo hiệu như thế nào để đảm bảo an toàn giao thông ?', 1, NULL, N'Điều 14 Luật Giao thông đường bộ 2008; - Nghị định 46 năm 2016 quy định. Vượt xe trong khu vực đô thị từ 22 giờ đến 5 giờ sáng chỉ được báo hiệu bằng đèn.                                                                                                                                                                                                                                                                                                                                                          ', 1, 0)
INSERT [dbo].[Question] ([Question_ID], [Content], [Question_Type_ID], [Image], [Explain], [Create_By], [Is_Delete]) VALUES (8, N'Người điều khiển phương tiện tham gia giao thông trong hầm đường bộ ngoài việc phải tuân thủ các quy tắc giao thông còn phải thực hiện những quy định nào dưới đây ?', 1, NULL, N'Trong hầm đường bộ, nghiêm cấm việc quay đầu và lùi xe.                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', 1, 0)
INSERT [dbo].[Question] ([Question_ID], [Content], [Question_Type_ID], [Image], [Explain], [Create_By], [Is_Delete]) VALUES (9, N'Trên đoạn đường hai chiều không có giải phân cách giữa, người lái xe không được vượt xe khác trong các trường hợp nào dưới đây ?', 1, NULL, N'Khi muốn vượt một xe khác, chúng ta phải đảm bảo các yếu tố về an toàn. Trường hợp phát hiện có xe đi ngược chiều và xe đi trước (xe bị vượt) bất ngờ tăng tốc độ chúng ta sẽ không được vượt.                                                                                                                                                                                                                                                                                                                      ', 1, 0)
INSERT [dbo].[Question] ([Question_ID], [Content], [Question_Type_ID], [Image], [Explain], [Create_By], [Is_Delete]) VALUES (10, N'Khi điều khiển xe chạy với tốc độ dưới 60 km/h, để đảm bảo khoảng cách an toàn giữa hai xe, người lái xe phải điều khiển xe như thế nào ?', 1, NULL, N'Khi điều khiển xe chạy với tốc độ dưới 60 km/h, người lái xe phải chủ động giữ khoảng cách an toàn phù hợp với xe chạy liền trước xe của mình; khoảng cách này tùy thuộc vào mật độ phương tiện, tình hình giao thông thực tế để đảm bảo an toàn giao thông.                                                                                                                                                                                                                                                        ', 1, 0)
INSERT [dbo].[Question] ([Question_ID], [Content], [Question_Type_ID], [Image], [Explain], [Create_By], [Is_Delete]) VALUES (11, N'Để báo hiệu cho xe phía trước biết xe mô tô của bạn muốn vượt, bạn phải có tín hiệu như thế nào dưới đây ?
', 1, NULL, N'Khi muốn vượt xe phía trước bắt buộc phải có tín hiệu bằng đèn hoặc còi, trường hợp trong khu đông dân cư trong khung giờ từ 22h - 5h bắt buộc phải sử dụng bằng đèn.                                                                                                                                                                                                                                                                                                                                               ', 1, 0)
INSERT [dbo].[Question] ([Question_ID], [Content], [Question_Type_ID], [Image], [Explain], [Create_By], [Is_Delete]) VALUES (12, N'Khi điều khiển xe mô tô tay ga xuống đường dốc dài, độ dốc cao, người lái xe cần thực hiện các thao tác nào dưới đây để đảm bảo an toàn ?', 1, N'Images/Question/12.jpg', N'Khi điều khiển xe mô tô tay ga xuống đường dốc dài, độ dốc cao để đảm bảo an toàn người lái xe sẽ cần giữ tay ga ở mức độ phù hợp kết hợp giữa thắng trước và thắng sau để giảm tốc độ khi cần thiết. Tránh việc chỉ sử dụng thắng trước vì rất dễ gây tai nạn.                                                                                                                                                                                                                                                     ', 1, 0)
INSERT [dbo].[Question] ([Question_ID], [Content], [Question_Type_ID], [Image], [Explain], [Create_By], [Is_Delete]) VALUES (13, N'Tay ga trên xe mô tô hai bánh có tác dụng gì trong các trường hợp dưới đây ?', 1, NULL, N'Tay ga trên xe mô tô sẽ có tác dụng điều chỉnh tốc độ xe, cho phép xe tiến về phía trước. Không có tác dụng lùi xe.                                                                                                                                                                                                                                                                                                                                                                                                 ', 1, 0)
INSERT [dbo].[Question] ([Question_ID], [Content], [Question_Type_ID], [Image], [Explain], [Create_By], [Is_Delete]) VALUES (14, N'Biển nào cấm xe rẽ trái ?
', 2, N'Images/Question/14.jpg', N'Biển 1 là biển cấm xe rẽ trái. Biển 2 là biển cấm xe quay đầu. Biển báo cấm quay đầu không có giá trị cấm rẽ trái.                                                                                                                                                                                                                                                                                                                                                                                                  ', 1, 0)
INSERT [dbo].[Question] ([Question_ID], [Content], [Question_Type_ID], [Image], [Explain], [Create_By], [Is_Delete]) VALUES (15, N'Biển nào dưới đây các phương tiện không được phép đi vào ?
', 2, N'Images/Question/15.jpg', N'Biển 1: Biển báo đường cấm tất cả các loại phương tiện. Biển 2: Biển báo cấm đi được ngược chiều. Biển 3: Biển báo cấm đỗ xe. Vì vậy chọn Biển 1 và Biển 2.                                                                                                                                                                                                                                                                                                                                                         ', 1, 0)
INSERT [dbo].[Question] ([Question_ID], [Content], [Question_Type_ID], [Image], [Explain], [Create_By], [Is_Delete]) VALUES (16, N'Biển nào xe mô tô hai bánh không được đi vào ?
', 2, N'Images/Question/16.jpg', N'Biển 1: Biển báo cấm xe ôtô không cấm xe môtô. Biển 2: Biển báo cấm xe môtô. Biển 3: Biển báo cấm xe tải không cấm xe mô tô. Vì vậy chọn Biển 2.                                                                                                                                                                                                                                                                                                                                                                    ', 1, 0)
INSERT [dbo].[Question] ([Question_ID], [Content], [Question_Type_ID], [Image], [Explain], [Create_By], [Is_Delete]) VALUES (17, N'Biển nào báo hiệu nguy hiểm giao nhau với đường sắt ?
', 2, N'Images/Question/17.jpg', N'Biển 1: Biển báo giao nhau với đường sắt có rào chắn. Biển 2: Biển báo giao nhau với đường hai chiều. Biển 3: Biển báo nơi đường sắt giao vuông góc với đường bộ. Vì vậy chọn Biển 1 và Biển 3.

                                                                                                                                                                                                                                                                                                                 ', 1, 0)
INSERT [dbo].[Question] ([Question_ID], [Content], [Question_Type_ID], [Image], [Explain], [Create_By], [Is_Delete]) VALUES (18, N'Biển nào báo hiệu “Đường giao nhau” của các tuyến đường cùng cấp ?', 2, N'Images/Question/18.jpg', N'Biển 1: Biển báo trước sắp đến nơi giao nhau cùng mức của các tuyến đường cùng cấp (không có đường nào ưu tiên). Biển 2: Biển báo giao nhau với đường không ưu tiên. Biển 3: Biển báo giao nhau với đường ưu tiên. Vì vậy chọn Biển 1.                                                                                                                                                                                                                                                                              ', 1, 0)
INSERT [dbo].[Question] ([Question_ID], [Content], [Question_Type_ID], [Image], [Explain], [Create_By], [Is_Delete]) VALUES (19, N'
Biển nào chỉ dẫn nơi bắt đầu đoạn đường dành cho người đi bộ ?', 2, N'Images/Question/19.jpg', N'Biển 1: Biển báo hiệu sắp đến phần đường cắt ngang dành cho người đi bộ. Biển 2: Biển báo hiệu bắt đầu đoạn đường dành riêng cho người đi bộ. Biển 3: Biển báo hiệu gần đến đoạn đường thường xuyên có trẻ em đi ngang qua. Nên chọn biển 2.                                                                                                                                                                                                                                                                        ', 1, 0)
INSERT [dbo].[Question] ([Question_ID], [Content], [Question_Type_ID], [Image], [Explain], [Create_By], [Is_Delete]) VALUES (20, N'Biển nào dưới đây báo hiệu hết cấm vượt ?
', 2, N'Images/Question/20.jpg', N'Biển 1: Hết hạn chế tốc độ tối đa. Biển 2: Hết tất cả lệnh cấm. Biển 3: Hết cấm vượt. Vì vậy chọn biển 2 và biển 3.                                                                                                                                                                                                                                                                                                                                                                                                 ', 1, 0)
INSERT [dbo].[Question] ([Question_ID], [Content], [Question_Type_ID], [Image], [Explain], [Create_By], [Is_Delete]) VALUES (21, N'Vạch kẻ đường nào dưới đây là vạch phân chia hai chiều xe chạy (vạch tim đường), xe không được lấn làn, không được đè lên vạch ?', 1, N'Images/Question/21.jpg', N'Vạch 1: Vạch phân chia các làn xe cùng chiều, dạng vạch đơn, đứt nứt. Vạch 2: Vạch phân chia hai chiều xe chạy, dạng vạch đơn, nét liền. Vạch 3: Vạch phân chia các làn xe cùng chiều, dạng vạch đơn, nét liền. Vì vậy chọn vạch 2.                                                                                                                                                                                                                                                                                 ', 1, 0)
INSERT [dbo].[Question] ([Question_ID], [Content], [Question_Type_ID], [Image], [Explain], [Create_By], [Is_Delete]) VALUES (22, N'Xe nào được quyền đi trước trong trường hợp này ?
', 3, N'Images/Question/22.jpg', N'Thứ tự xét xe đi trong sa hình: Thứ 1. Xe nào nằm trong giao lộ xe đó được quyền đi trước. Thứ 2. Xe ưu tiên: xe cứu hỏa, xe quân sự, xe công an, xe cứu thương. Thứ 3. Xe ở trên Đường ưu tiên. Thứ 4. Quy tắc bên phải trống ( bên tay phải xe nào trống xe đó đi trước). Thứ 5: Rẽ phải, đi thẳng, rẽ trái. Vì xe cứu thương ở thứ tự thứ 2 nên sẽ đi trước xe mô tô.                                                                                                                                            ', 1, 0)
INSERT [dbo].[Question] ([Question_ID], [Content], [Question_Type_ID], [Image], [Explain], [Create_By], [Is_Delete]) VALUES (23, N'Xe tải kéo mô tô ba bánh như hình này có đúng quy tắc giao thông không ?
', 3, N'Images/Question/23.jpg', N'Trong hình, có biển báo cấm xe kéo nên trường hợp này không đúng quy tắc giao thông                                                                                                                                                                                                                                                                                                                                                                                                                                 ', 1, 0)
INSERT [dbo].[Question] ([Question_ID], [Content], [Question_Type_ID], [Image], [Explain], [Create_By], [Is_Delete]) VALUES (24, N'Theo hướng mũi tên, những hướng nào xe mô tô được phép đi ?', 3, N'Images/Question/24.jpg', N'Trên hình, Hướng 2 có biển báo cấm xe mô tô đi vào. Hướng 1 không có biển cấm. Hướng 3 cấm xe ô tô không cấm xe mô tô. Vì vậy chọn hướng 1 và hướng 3.                                                                                                                                                                                                                                                                                                                                                              ', 1, 0)
INSERT [dbo].[Question] ([Question_ID], [Content], [Question_Type_ID], [Image], [Explain], [Create_By], [Is_Delete]) VALUES (25, N'Các xe đi theo hướng mũi tên, xe nào vi phạm quy tắc giao thông ?', 3, N'Images/Question/25.jpg', N'Mũi tên đỏ hướng xe đang di chuyển. Xe con đèn xanh rẽ phải đúng. Xe tải đèn đỏ đi thẳng sai. Xe khách làn đường bắt buộc rẽ trái mà đi thẳng sai. Xe môtô đèn đỏ đi thẳng sai. Chọn xe khách, xe tải, môtô.                                                                                                                                                                                                                                                                                                        ', 1, 0)
INSERT [dbo].[Question] ([Question_ID], [Content], [Question_Type_ID], [Image], [Explain], [Create_By], [Is_Delete]) VALUES (29, N'đây là câu hỏi mới', 1, N'', N'đây là giải thích                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ', 1, 1)
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
INSERT [dbo].[QuestionLicenseType] ([Question_ID], [License_Type_ID]) VALUES (1, 1)
INSERT [dbo].[QuestionLicenseType] ([Question_ID], [License_Type_ID]) VALUES (2, 1)
INSERT [dbo].[QuestionLicenseType] ([Question_ID], [License_Type_ID]) VALUES (3, 1)
INSERT [dbo].[QuestionLicenseType] ([Question_ID], [License_Type_ID]) VALUES (4, 1)
INSERT [dbo].[QuestionLicenseType] ([Question_ID], [License_Type_ID]) VALUES (5, 1)
INSERT [dbo].[QuestionLicenseType] ([Question_ID], [License_Type_ID]) VALUES (6, 1)
INSERT [dbo].[QuestionLicenseType] ([Question_ID], [License_Type_ID]) VALUES (7, 1)
INSERT [dbo].[QuestionLicenseType] ([Question_ID], [License_Type_ID]) VALUES (8, 1)
INSERT [dbo].[QuestionLicenseType] ([Question_ID], [License_Type_ID]) VALUES (9, 1)
INSERT [dbo].[QuestionLicenseType] ([Question_ID], [License_Type_ID]) VALUES (10, 1)
INSERT [dbo].[QuestionLicenseType] ([Question_ID], [License_Type_ID]) VALUES (11, 1)
INSERT [dbo].[QuestionLicenseType] ([Question_ID], [License_Type_ID]) VALUES (12, 1)
INSERT [dbo].[QuestionLicenseType] ([Question_ID], [License_Type_ID]) VALUES (13, 1)
INSERT [dbo].[QuestionLicenseType] ([Question_ID], [License_Type_ID]) VALUES (14, 1)
INSERT [dbo].[QuestionLicenseType] ([Question_ID], [License_Type_ID]) VALUES (15, 1)
INSERT [dbo].[QuestionLicenseType] ([Question_ID], [License_Type_ID]) VALUES (16, 1)
INSERT [dbo].[QuestionLicenseType] ([Question_ID], [License_Type_ID]) VALUES (17, 1)
INSERT [dbo].[QuestionLicenseType] ([Question_ID], [License_Type_ID]) VALUES (18, 1)
INSERT [dbo].[QuestionLicenseType] ([Question_ID], [License_Type_ID]) VALUES (19, 1)
INSERT [dbo].[QuestionLicenseType] ([Question_ID], [License_Type_ID]) VALUES (20, 1)
INSERT [dbo].[QuestionLicenseType] ([Question_ID], [License_Type_ID]) VALUES (21, 1)
INSERT [dbo].[QuestionLicenseType] ([Question_ID], [License_Type_ID]) VALUES (22, 1)
INSERT [dbo].[QuestionLicenseType] ([Question_ID], [License_Type_ID]) VALUES (23, 1)
INSERT [dbo].[QuestionLicenseType] ([Question_ID], [License_Type_ID]) VALUES (24, 1)
INSERT [dbo].[QuestionLicenseType] ([Question_ID], [License_Type_ID]) VALUES (25, 1)
GO
SET IDENTITY_INSERT [dbo].[QuestionType] ON 

INSERT [dbo].[QuestionType] ([Question_Type_ID], [Content]) VALUES (1, N'Luật giao thông')
INSERT [dbo].[QuestionType] ([Question_Type_ID], [Content]) VALUES (2, N'Biển báo')
INSERT [dbo].[QuestionType] ([Question_Type_ID], [Content]) VALUES (3, N'Sa hình')
SET IDENTITY_INSERT [dbo].[QuestionType] OFF
GO
INSERT [dbo].[Result] ([Account_ID], [Exam_ID], [Result]) VALUES (1, 1, 4)
INSERT [dbo].[Result] ([Account_ID], [Exam_ID], [Result]) VALUES (2, 1, 8)
INSERT [dbo].[Result] ([Account_ID], [Exam_ID], [Result]) VALUES (2, 2, 0)
INSERT [dbo].[Result] ([Account_ID], [Exam_ID], [Result]) VALUES (2, 3, 23)
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_isAdmin]  DEFAULT ((0)) FOR [isAdmin]
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK__Answer__Question__4E88ABD4] FOREIGN KEY([Question_ID])
REFERENCES [dbo].[Question] ([Question_ID])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK__Answer__Question__4E88ABD4]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD FOREIGN KEY([License_Type_ID])
REFERENCES [dbo].[LicenseType] ([License_Type_ID])
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Account] FOREIGN KEY([Create_By])
REFERENCES [dbo].[Account] ([Account_ID])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Account]
GO
ALTER TABLE [dbo].[ExamDetail]  WITH CHECK ADD  CONSTRAINT [FK_ExamDetail_Exam] FOREIGN KEY([Exam_ID])
REFERENCES [dbo].[Exam] ([Exam_ID])
GO
ALTER TABLE [dbo].[ExamDetail] CHECK CONSTRAINT [FK_ExamDetail_Exam]
GO
ALTER TABLE [dbo].[ExamDetail]  WITH CHECK ADD  CONSTRAINT [FK_ExamDetail_Question] FOREIGN KEY([Question_ID])
REFERENCES [dbo].[Question] ([Question_ID])
GO
ALTER TABLE [dbo].[ExamDetail] CHECK CONSTRAINT [FK_ExamDetail_Question]
GO
ALTER TABLE [dbo].[Penalize]  WITH CHECK ADD FOREIGN KEY([License_Type_ID])
REFERENCES [dbo].[LicenseType] ([License_Type_ID])
GO
ALTER TABLE [dbo].[Penalize]  WITH CHECK ADD  CONSTRAINT [FK_Penalize_Account] FOREIGN KEY([Create_By])
REFERENCES [dbo].[Account] ([Account_ID])
GO
ALTER TABLE [dbo].[Penalize] CHECK CONSTRAINT [FK_Penalize_Account]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK__Question__Questi__4BAC3F29] FOREIGN KEY([Question_Type_ID])
REFERENCES [dbo].[QuestionType] ([Question_Type_ID])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK__Question__Questi__4BAC3F29]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Account] FOREIGN KEY([Create_By])
REFERENCES [dbo].[Account] ([Account_ID])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Account]
GO
ALTER TABLE [dbo].[QuestionLicenseType]  WITH CHECK ADD FOREIGN KEY([License_Type_ID])
REFERENCES [dbo].[LicenseType] ([License_Type_ID])
GO
ALTER TABLE [dbo].[QuestionLicenseType]  WITH CHECK ADD  CONSTRAINT [FK__QuestionL__Quest__6B24EA82] FOREIGN KEY([Question_ID])
REFERENCES [dbo].[Question] ([Question_ID])
GO
ALTER TABLE [dbo].[QuestionLicenseType] CHECK CONSTRAINT [FK__QuestionL__Quest__6B24EA82]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD FOREIGN KEY([Account_ID])
REFERENCES [dbo].[Account] ([Account_ID])
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD FOREIGN KEY([Exam_ID])
REFERENCES [dbo].[Exam] ([Exam_ID])
GO
USE [master]
GO
ALTER DATABASE [Support_License] SET  READ_WRITE 
GO
