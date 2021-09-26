USE [master]
GO
/****** Object:  Database [HR_TEST]    Script Date: 26/9/2021 7:20:48 am ******/
CREATE DATABASE [HR_TEST]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HR_TEST', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HR_TEST.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HR_TEST_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HR_TEST_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HR_TEST] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HR_TEST].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HR_TEST] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HR_TEST] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HR_TEST] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HR_TEST] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HR_TEST] SET ARITHABORT OFF 
GO
ALTER DATABASE [HR_TEST] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HR_TEST] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HR_TEST] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HR_TEST] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HR_TEST] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HR_TEST] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HR_TEST] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HR_TEST] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HR_TEST] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HR_TEST] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HR_TEST] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HR_TEST] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HR_TEST] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HR_TEST] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HR_TEST] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HR_TEST] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HR_TEST] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HR_TEST] SET RECOVERY FULL 
GO
ALTER DATABASE [HR_TEST] SET  MULTI_USER 
GO
ALTER DATABASE [HR_TEST] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HR_TEST] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HR_TEST] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HR_TEST] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HR_TEST] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HR_TEST', N'ON'
GO
USE [HR_TEST]
GO
/****** Object:  Table [dbo].[DEPARTMENT]    Script Date: 26/9/2021 7:20:49 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DEPARTMENT](
	[DEPARTMENT_ID] [char](36) NOT NULL,
	[CODE] [varchar](10) NULL,
	[DESCRIPTION] [nvarchar](500) NULL,
	[TS] [timestamp] NULL,
	[CREATED_DATE] [datetime] NULL CONSTRAINT [DF_DEPARTMENT_CREATED_DATE]  DEFAULT (getdate()),
	[UPDATED_DATE] [datetime] NULL,
 CONSTRAINT [PK_DEPARTMENT] PRIMARY KEY CLUSTERED 
(
	[DEPARTMENT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EMPLOYEE]    Script Date: 26/9/2021 7:20:49 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EMPLOYEE](
	[EMPLOYEE_ID] [int] IDENTITY(1,1) NOT NULL,
	[EMPLOYEE_NAME] [nvarchar](500) NULL,
	[EMPLOYEE_NO] [varchar](10) NULL,
	[DOB] [datetime] NULL,
	[JOIN_DATE] [datetime] NULL,
	[DEPARTMENT] [char](36) NULL,
	[SALARY] [decimal](10, 2) NULL,
	[SKILLS] [nvarchar](200) NULL,
	[TS] [timestamp] NOT NULL,
	[CREATED_DATE] [datetime] NULL CONSTRAINT [DF_EMPLOYEE_CREATED_DATE]  DEFAULT (getdate()),
	[UPDATED_DATE] [datetime] NULL,
 CONSTRAINT [PK_EMPLOYEE] PRIMARY KEY CLUSTERED 
(
	[EMPLOYEE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Skills]    Script Date: 26/9/2021 7:20:49 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skills](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Skills] [nvarchar](20) NULL,
 CONSTRAINT [PK_Skills] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[DEPARTMENT] ([DEPARTMENT_ID], [CODE], [DESCRIPTION], [CREATED_DATE], [UPDATED_DATE]) VALUES (N'1                                   ', N'001', N'IT', CAST(N'2021-09-23 15:38:23.983' AS DateTime), NULL)
INSERT [dbo].[DEPARTMENT] ([DEPARTMENT_ID], [CODE], [DESCRIPTION], [CREATED_DATE], [UPDATED_DATE]) VALUES (N'2                                   ', N'002', N'Account', CAST(N'2021-09-23 15:39:10.673' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[EMPLOYEE] ON 

INSERT [dbo].[EMPLOYEE] ([EMPLOYEE_ID], [EMPLOYEE_NAME], [EMPLOYEE_NO], [DOB], [JOIN_DATE], [DEPARTMENT], [SALARY], [SKILLS], [CREATED_DATE], [UPDATED_DATE]) VALUES (1, N'afda', N'001', CAST(N'2021-09-21 00:00:00.000' AS DateTime), CAST(N'2021-09-21 00:00:00.000' AS DateTime), N'001                                 ', CAST(4500.00 AS Decimal(10, 2)), N'JAVA,.NET CORE', CAST(N'2021-09-23 18:12:29.167' AS DateTime), NULL)
INSERT [dbo].[EMPLOYEE] ([EMPLOYEE_ID], [EMPLOYEE_NAME], [EMPLOYEE_NO], [DOB], [JOIN_DATE], [DEPARTMENT], [SALARY], [SKILLS], [CREATED_DATE], [UPDATED_DATE]) VALUES (2, N'sdfadf', N'002', CAST(N'2021-09-01 00:00:00.000' AS DateTime), CAST(N'2021-09-25 00:00:00.000' AS DateTime), N'001                                 ', CAST(4500.00 AS Decimal(10, 2)), N'.NET CORE,AWS,C#', CAST(N'2021-09-24 12:03:43.883' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[EMPLOYEE] OFF
SET IDENTITY_INSERT [dbo].[Skills] ON 

INSERT [dbo].[Skills] ([ID], [Skills]) VALUES (1, N'JAVA')
INSERT [dbo].[Skills] ([ID], [Skills]) VALUES (2, N'.NET CORE')
INSERT [dbo].[Skills] ([ID], [Skills]) VALUES (3, N'AWS')
INSERT [dbo].[Skills] ([ID], [Skills]) VALUES (4, N'C#')
INSERT [dbo].[Skills] ([ID], [Skills]) VALUES (5, N'EXCEL')
INSERT [dbo].[Skills] ([ID], [Skills]) VALUES (6, N'ACCOUNTING')
INSERT [dbo].[Skills] ([ID], [Skills]) VALUES (7, N'MVC')
INSERT [dbo].[Skills] ([ID], [Skills]) VALUES (8, N'BITBUCKET')
INSERT [dbo].[Skills] ([ID], [Skills]) VALUES (9, N'OTHERS')
SET IDENTITY_INSERT [dbo].[Skills] OFF
/****** Object:  StoredProcedure [dbo].[dep_select]    Script Date: 26/9/2021 7:20:49 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[dep_select]

as 
begin
SELECT * FROM   [dbo].[DEPARTMENT]

END
GO
/****** Object:  StoredProcedure [dbo].[emp_delete]    Script Date: 26/9/2021 7:20:49 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[emp_delete]
(
@EMPLOYEE_ID CHAR(36)
)
as 
begin
DELETE from   [dbo].[EMPLOYEE] WHERE [EMPLOYEE_ID]=@EMPLOYEE_ID

END
GO
/****** Object:  StoredProcedure [dbo].[emp_insert]    Script Date: 26/9/2021 7:20:49 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[emp_insert]
(

@EMPLOYEE_NAME NVARCHAR(500),
@EMPLOYEE_NO VARCHAR(10),
@DOB DATETIME,
@JOIN_DATE DATETIME,
@DEPARTMENT CHAR(36),
@SALARY DECIMAL,
@SKILLS NVARCHAR(500)

)
as 
begin

INSERT INTO EMPLOYEE
           (EMPLOYEE_NAME
           ,EMPLOYEE_NO
           ,DOB
           ,JOIN_DATE
           ,DEPARTMENT
           ,SALARY
           ,SKILLS	
		   	          
		   )

VALUES (
@EMPLOYEE_NAME,
@EMPLOYEE_NO,
@DOB ,
@JOIN_DATE ,
@DEPARTMENT ,
@SALARY ,
@SKILLS 

)
end
GO
/****** Object:  StoredProcedure [dbo].[emp_select]    Script Date: 26/9/2021 7:20:49 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[emp_select]

as 
begin
SELECT E.EMPLOYEE_ID,E.EMPLOYEE_NAME,E.EMPLOYEE_NO,convert(varchar, E.DOB, 106) DOB,convert(varchar,E.JOIN_DATE, 106) JOIN_DATE,D.DESCRIPTION DEPARTMENT,SKILLS,SALARY
 FROM   [dbo].[EMPLOYEE] E
 INNER JOIN [dbo].[DEPARTMENT] D on E.DEPARTMENT=D.CODE

END
GO
/****** Object:  StoredProcedure [dbo].[emp_selectbyempid]    Script Date: 26/9/2021 7:20:49 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[emp_selectbyempid]
(
@EMPLOYEE_ID int
)
as 
begin
SELECT E.EMPLOYEE_ID,E.EMPLOYEE_NAME,E.EMPLOYEE_NO,convert(varchar, E.DOB, 106) DOB,convert(varchar,E.JOIN_DATE, 106) JOIN_DATE,D.DESCRIPTION DEPARTMENT,SKILLS,SALARY
 FROM   [dbo].[EMPLOYEE] E
 INNER JOIN [dbo].[DEPARTMENT] D on E.DEPARTMENT=D.CODE
 WHERE [EMPLOYEE_ID]=@EMPLOYEE_ID

END


GO
/****** Object:  StoredProcedure [dbo].[emp_update]    Script Date: 26/9/2021 7:20:49 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[emp_update]
(
@EMPLOYEE_ID int,
@EMPLOYEE_NAME NVARCHAR(500),
@EMPLOYEE_NO VARCHAR(10),
@DOB DATETIME,
@JOIN_DATE DATETIME,
@DEPARTMENT CHAR(36),
@SALARY DECIMAL,
@SKILLS NVARCHAR(300),
@UPDATED_DATE DATETIME
)
as 
begin
UPDATE EMPLOYEE SET 
           EMPLOYEE_NAME=@EMPLOYEE_NAME
           ,EMPLOYEE_NO=@EMPLOYEE_NO
           ,DOB=@DOB
           ,JOIN_DATE=@JOIN_DATE
           ,DEPARTMENT=@DEPARTMENT
           ,SALARY=@SALARY
           ,SKILLS=@SKILLS     
		   ,UPDATED_DATE=@UPDATED_DATE
	WHERE EMPLOYEE_ID=@EMPLOYEE_ID

end
GO
/****** Object:  StoredProcedure [dbo].[get_Skill]    Script Date: 26/9/2021 7:20:49 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_Skill]

as 
begin
SELECT * FROM   [dbo].[Skills]

END
GO
USE [master]
GO
ALTER DATABASE [HR_TEST] SET  READ_WRITE 
GO
