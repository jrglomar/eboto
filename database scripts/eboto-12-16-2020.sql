USE [eboto]
GO
ALTER TABLE [dbo].[t_vote_option] DROP CONSTRAINT [FK_vote_o_userID]
GO
ALTER TABLE [dbo].[t_vote_option] DROP CONSTRAINT [FK_vote_o_electionID]
GO
ALTER TABLE [dbo].[t_vote_option] DROP CONSTRAINT [FK_vote_o_candidateID]
GO
ALTER TABLE [dbo].[t_vote_contestant] DROP CONSTRAINT [FK_vote_con_userID]
GO
ALTER TABLE [dbo].[t_vote_contestant] DROP CONSTRAINT [FK_vote_con_contestID]
GO
ALTER TABLE [dbo].[t_vote_contestant] DROP CONSTRAINT [FK_vote_con_constestantID]
GO
ALTER TABLE [dbo].[t_vote_candidate] DROP CONSTRAINT [FK_vote_c_userID]
GO
ALTER TABLE [dbo].[t_vote_candidate] DROP CONSTRAINT [FK_vote_c_electionID]
GO
ALTER TABLE [dbo].[t_vote_candidate] DROP CONSTRAINT [FK_vote_c_candidateID]
GO
ALTER TABLE [dbo].[t_user] DROP CONSTRAINT [FK_user_orgsID]
GO
ALTER TABLE [dbo].[t_user] DROP CONSTRAINT [FK_user_courseID]
GO
ALTER TABLE [dbo].[t_poll] DROP CONSTRAINT [FK_poll_orgID]
GO
ALTER TABLE [dbo].[t_option] DROP CONSTRAINT [FK_option_electionID]
GO
ALTER TABLE [dbo].[t_election] DROP CONSTRAINT [FK_election_orgID]
GO
ALTER TABLE [dbo].[t_contestant] DROP CONSTRAINT [FK_contestant_contestID]
GO
ALTER TABLE [dbo].[t_contest] DROP CONSTRAINT [FK_contest_orgID]
GO
ALTER TABLE [dbo].[t_candidate] DROP CONSTRAINT [FK_candidate_electionID]
GO
ALTER TABLE [dbo].[t_vote_option] DROP CONSTRAINT [DF_VoteOption]
GO
ALTER TABLE [dbo].[t_vote_candidate] DROP CONSTRAINT [DF_VoteCandidate]
GO
ALTER TABLE [dbo].[t_user] DROP CONSTRAINT [DF__t_user__userStat__01142BA1]
GO
ALTER TABLE [dbo].[t_user] DROP CONSTRAINT [DF_User]
GO
ALTER TABLE [dbo].[t_poll] DROP CONSTRAINT [DF__t_poll__pollStat__7F2BE32F]
GO
ALTER TABLE [dbo].[t_poll] DROP CONSTRAINT [DF_Poll]
GO
ALTER TABLE [dbo].[t_option] DROP CONSTRAINT [DF__t_option__option__7D439ABD]
GO
ALTER TABLE [dbo].[t_option] DROP CONSTRAINT [DF_Option]
GO
ALTER TABLE [dbo].[t_election] DROP CONSTRAINT [DF__t_electio__elect__7B5B524B]
GO
ALTER TABLE [dbo].[t_election] DROP CONSTRAINT [DF_Election]
GO
ALTER TABLE [dbo].[t_contestant] DROP CONSTRAINT [DF__t_contest__conte__2739D489]
GO
ALTER TABLE [dbo].[t_contestant] DROP CONSTRAINT [DF__t_contest__conte__797309D9]
GO
ALTER TABLE [dbo].[t_contest] DROP CONSTRAINT [DF__t_contest__conte__787EE5A0]
GO
ALTER TABLE [dbo].[t_contest] DROP CONSTRAINT [DF_Contest]
GO
ALTER TABLE [dbo].[t_candidate] DROP CONSTRAINT [DF__t_candida__candi__76969D2E]
GO
ALTER TABLE [dbo].[t_candidate] DROP CONSTRAINT [DF_Candidate]
GO
ALTER TABLE [dbo].[r_org] DROP CONSTRAINT [DF__r_org__orgStatus__74AE54BC]
GO
ALTER TABLE [dbo].[r_org] DROP CONSTRAINT [DF_Org]
GO
ALTER TABLE [dbo].[r_course] DROP CONSTRAINT [DF__r_course__course__72C60C4A]
GO
ALTER TABLE [dbo].[r_course] DROP CONSTRAINT [DF_Course]
GO
/****** Object:  Table [dbo].[t_vote_option]    Script Date: 12/16/2020 9:58:24 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_vote_option]') AND type in (N'U'))
DROP TABLE [dbo].[t_vote_option]
GO
/****** Object:  Table [dbo].[t_vote_contestant]    Script Date: 12/16/2020 9:58:24 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_vote_contestant]') AND type in (N'U'))
DROP TABLE [dbo].[t_vote_contestant]
GO
/****** Object:  Table [dbo].[t_vote_candidate]    Script Date: 12/16/2020 9:58:24 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_vote_candidate]') AND type in (N'U'))
DROP TABLE [dbo].[t_vote_candidate]
GO
/****** Object:  Table [dbo].[t_user]    Script Date: 12/16/2020 9:58:24 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_user]') AND type in (N'U'))
DROP TABLE [dbo].[t_user]
GO
/****** Object:  Table [dbo].[t_poll]    Script Date: 12/16/2020 9:58:24 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_poll]') AND type in (N'U'))
DROP TABLE [dbo].[t_poll]
GO
/****** Object:  Table [dbo].[t_option]    Script Date: 12/16/2020 9:58:24 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_option]') AND type in (N'U'))
DROP TABLE [dbo].[t_option]
GO
/****** Object:  Table [dbo].[t_election]    Script Date: 12/16/2020 9:58:24 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_election]') AND type in (N'U'))
DROP TABLE [dbo].[t_election]
GO
/****** Object:  Table [dbo].[t_contestant]    Script Date: 12/16/2020 9:58:24 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_contestant]') AND type in (N'U'))
DROP TABLE [dbo].[t_contestant]
GO
/****** Object:  Table [dbo].[t_contest]    Script Date: 12/16/2020 9:58:24 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_contest]') AND type in (N'U'))
DROP TABLE [dbo].[t_contest]
GO
/****** Object:  Table [dbo].[t_candidate]    Script Date: 12/16/2020 9:58:24 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_candidate]') AND type in (N'U'))
DROP TABLE [dbo].[t_candidate]
GO
/****** Object:  Table [dbo].[r_org]    Script Date: 12/16/2020 9:58:24 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[r_org]') AND type in (N'U'))
DROP TABLE [dbo].[r_org]
GO
/****** Object:  Table [dbo].[r_course]    Script Date: 12/16/2020 9:58:24 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[r_course]') AND type in (N'U'))
DROP TABLE [dbo].[r_course]
GO
USE [master]
GO
/****** Object:  Database [eboto]    Script Date: 12/16/2020 9:58:24 AM ******/
DROP DATABASE [eboto]
GO
/****** Object:  Database [eboto]    Script Date: 12/16/2020 9:58:24 AM ******/
CREATE DATABASE [eboto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'eboto', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\eboto.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'eboto_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\eboto_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eboto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [eboto] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [eboto] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [eboto] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [eboto] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [eboto] SET ARITHABORT OFF 
GO
ALTER DATABASE [eboto] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [eboto] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [eboto] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [eboto] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [eboto] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [eboto] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [eboto] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [eboto] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [eboto] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [eboto] SET  ENABLE_BROKER 
GO
ALTER DATABASE [eboto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [eboto] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [eboto] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [eboto] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [eboto] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [eboto] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [eboto] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [eboto] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [eboto] SET  MULTI_USER 
GO
ALTER DATABASE [eboto] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [eboto] SET DB_CHAINING OFF 
GO
ALTER DATABASE [eboto] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [eboto] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [eboto]
GO
/****** Object:  Table [dbo].[r_course]    Script Date: 12/16/2020 9:58:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[r_course](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[courseName] [varchar](100) NULL,
	[courseDateCreated] [datetime] NULL,
	[courseStatus] [bit] NULL,
 CONSTRAINT [PK_courseID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[r_org]    Script Date: 12/16/2020 9:58:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[r_org](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[orgName] [varchar](100) NULL,
	[orgDateCreated] [datetime] NULL,
	[orgStatus] [bit] NULL,
	[orgLogo] [varchar](200) NULL,
 CONSTRAINT [PK_orgsID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_candidate]    Script Date: 12/16/2020 9:58:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_candidate](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[candidateElectionID] [numeric](18, 0) NULL,
	[candidateDateCreated] [datetime] NULL,
	[candidateStatus] [bit] NULL,
	[candidatePosition] [varchar](100) NULL,
	[candidateName] [varchar](200) NULL,
	[candidateDescription] [varchar](1000) NULL,
	[candidateImage] [varchar](500) NULL,
 CONSTRAINT [PK_candidatesID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_contest]    Script Date: 12/16/2020 9:58:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_contest](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[contestName] [varchar](100) NULL,
	[contestDateStart] [datetime] NULL,
	[contestDateEnd] [datetime] NULL,
	[contestOrg] [numeric](18, 0) NULL,
	[contestDateCreated] [datetime] NULL,
	[contestStatus] [bit] NULL,
	[contestDescription] [varchar](1000) NULL,
 CONSTRAINT [PK_contestID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_contestant]    Script Date: 12/16/2020 9:58:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_contestant](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[contestantName] [varchar](100) NULL,
	[contestantDescription] [varchar](1000) NULL,
	[contestStatus] [bit] NULL,
	[contestantContestID] [numeric](18, 0) NULL,
	[contestantImage] [varchar](500) NULL,
	[contestantDateCreated] [datetime] NULL,
 CONSTRAINT [PK_contestantID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_election]    Script Date: 12/16/2020 9:58:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_election](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[electionName] [varchar](100) NULL,
	[electionDateStart] [datetime] NULL,
	[electionDateEnd] [datetime] NULL,
	[electionOrg] [numeric](18, 0) NULL,
	[electionDateCreated] [datetime] NULL,
	[electionStatus] [bit] NULL,
	[electionDescription] [varchar](1000) NULL,
 CONSTRAINT [PK_electionID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_option]    Script Date: 12/16/2020 9:58:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_option](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[optionPollID] [numeric](18, 0) NULL,
	[optionName] [varchar](100) NULL,
	[optionDateCreated] [datetime] NULL,
	[optionStatus] [bit] NULL,
 CONSTRAINT [PK_optionID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_poll]    Script Date: 12/16/2020 9:58:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_poll](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[pollName] [varchar](100) NULL,
	[pollDateStart] [datetime] NULL,
	[pollDateEnd] [datetime] NULL,
	[pollOrg] [numeric](18, 0) NULL,
	[pollDateCreated] [datetime] NULL,
	[pollStatus] [bit] NULL,
	[pollDescription] [varchar](1000) NULL,
 CONSTRAINT [PK_pollsID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_user]    Script Date: 12/16/2020 9:58:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_user](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[userFirstName] [varchar](100) NULL,
	[userMiddleName] [varchar](100) NULL,
	[userLastName] [varchar](100) NULL,
	[userStudentNo] [varchar](100) NULL,
	[userPassword] [varchar](100) NULL,
	[userEmail] [varchar](100) NULL,
	[userType] [varchar](100) NULL,
	[userOrg] [numeric](18, 0) NULL,
	[userCourse] [numeric](18, 0) NULL,
	[userDateCreated] [datetime] NULL,
	[userStatus] [bit] NULL,
 CONSTRAINT [PK_userID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_vote_candidate]    Script Date: 12/16/2020 9:58:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_vote_candidate](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[vote_userID] [numeric](18, 0) NULL,
	[vote_candidateID] [numeric](18, 0) NULL,
	[vote_electionID] [numeric](18, 0) NULL,
	[voteDateCreated] [datetime] NULL,
 CONSTRAINT [PK_vote_candidateID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_vote_contestant]    Script Date: 12/16/2020 9:58:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_vote_contestant](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[vote_userID] [numeric](18, 0) NULL,
	[vote_contestantID] [numeric](18, 0) NULL,
	[vote_contestID] [numeric](18, 0) NULL,
	[voteDateCreated] [datetime] NULL,
 CONSTRAINT [PK_vote_contestID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_vote_option]    Script Date: 12/16/2020 9:58:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_vote_option](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[vote_userID] [numeric](18, 0) NULL,
	[vote_optionID] [numeric](18, 0) NULL,
	[vote_pollID] [numeric](18, 0) NULL,
	[voteDateCreated] [datetime] NULL,
 CONSTRAINT [PK_vote_optionID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[r_org] ON 

INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(1 AS Numeric(18, 0)), NULL, CAST(N'2020-12-10T13:01:12.893' AS DateTime), 0, N'dp10.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(2 AS Numeric(18, 0)), N'asd', CAST(N'2020-12-10T13:03:07.197' AS DateTime), 0, N'dp11.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(3 AS Numeric(18, 0)), N'asd', CAST(N'2020-12-10T13:08:11.470' AS DateTime), 0, N'avatar_01.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(4 AS Numeric(18, 0)), N'asd', CAST(N'2020-12-10T13:09:56.930' AS DateTime), 0, N'dp12.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(5 AS Numeric(18, 0)), N'asd', CAST(N'2020-12-10T13:10:17.147' AS DateTime), 0, N'dp.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(6 AS Numeric(18, 0)), N'Public', CAST(N'2020-12-10T13:34:08.167' AS DateTime), 0, N'PUPLogo1.png')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(7 AS Numeric(18, 0)), N'asd', CAST(N'2020-12-10T13:37:47.923' AS DateTime), 0, N'dp7.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(8 AS Numeric(18, 0)), N'COMMITS', CAST(N'2020-12-10T13:44:08.070' AS DateTime), 0, N'COMMITS.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(9 AS Numeric(18, 0)), N'COMMITS', CAST(N'2020-12-10T13:45:04.977' AS DateTime), 0, N'COMMITS1.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(10 AS Numeric(18, 0)), N'test', CAST(N'2020-12-10T14:01:08.320' AS DateTime), 0, N'dp8.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(11 AS Numeric(18, 0)), N'test', CAST(N'2020-12-10T14:01:27.373' AS DateTime), 0, N'PUPLogo2.png')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(12 AS Numeric(18, 0)), N'test2', CAST(N'2020-12-10T14:01:34.310' AS DateTime), 0, N'dp9.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(13 AS Numeric(18, 0)), N'JMSs', CAST(N'2020-12-10T14:30:43.480' AS DateTime), 0, N'COMMITS3.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(14 AS Numeric(18, 0)), N'COMMITS', CAST(N'2020-12-11T09:06:43.710' AS DateTime), 0, N'11942076_1674469006101558_3534662844221263438_o_(1).jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(15 AS Numeric(18, 0)), N'JMS', CAST(N'2020-12-11T09:07:30.637' AS DateTime), 0, N'jms.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(16 AS Numeric(18, 0)), N'FBTO', CAST(N'2020-12-11T09:08:09.240' AS DateTime), 0, N'fbto.png')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(17 AS Numeric(18, 0)), N'DOMT', CAST(N'2020-12-11T09:08:57.907' AS DateTime), 0, N'DOMT.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(18 AS Numeric(18, 0)), N'CHRS', CAST(N'2020-12-11T09:09:31.253' AS DateTime), 0, N'CHRS.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(19 AS Numeric(18, 0)), N'YES', CAST(N'2020-12-11T09:10:11.563' AS DateTime), 0, N'yes.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(20 AS Numeric(18, 0)), N'PRIVATE', CAST(N'2020-12-11T09:15:00.277' AS DateTime), 0, N'PUPLogo2.png')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(21 AS Numeric(18, 0)), N'PUBLIC', CAST(N'2020-12-11T09:15:12.433' AS DateTime), 0, N'PUPLogo1.png')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(22 AS Numeric(18, 0)), N'TEST', CAST(N'2020-12-11T09:37:52.607' AS DateTime), 0, N'dp.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(23 AS Numeric(18, 0)), N'TEST', CAST(N'2020-12-12T11:35:57.787' AS DateTime), 0, N'PUPLogo3.png')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(24 AS Numeric(18, 0)), N'PUBLIC', CAST(N'2020-12-13T15:31:46.147' AS DateTime), 1, N'PUPLogo4.png')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(25 AS Numeric(18, 0)), N'PRIVATE', CAST(N'2020-12-13T15:31:55.043' AS DateTime), 1, N'PUPLogo5.png')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(26 AS Numeric(18, 0)), N'COMMITS', CAST(N'2020-12-13T15:32:01.940' AS DateTime), 1, N'11942076_1674469006101558_3534662844221263438_o4.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(27 AS Numeric(18, 0)), N'JMS', CAST(N'2020-12-13T15:32:12.987' AS DateTime), 1, N'jms1.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(28 AS Numeric(18, 0)), N'CHRS', CAST(N'2020-12-13T15:32:21.400' AS DateTime), 1, N'CHRS1.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(29 AS Numeric(18, 0)), N'FBTO', CAST(N'2020-12-13T15:32:36.390' AS DateTime), 1, N'fbto1.png')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(30 AS Numeric(18, 0)), N'DOMT', CAST(N'2020-12-13T15:32:44.193' AS DateTime), 1, N'DOMT1.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(31 AS Numeric(18, 0)), N'YES', CAST(N'2020-12-13T15:32:53.567' AS DateTime), 1, N'yes1.jpg')
SET IDENTITY_INSERT [dbo].[r_org] OFF
GO
SET IDENTITY_INSERT [dbo].[t_candidate] ON 

INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(14 AS Numeric(18, 0)), CAST(N'2020-12-13T16:19:41.530' AS DateTime), 1, N'President', N'John Raven Glomar', N'Age: 21
Skills: Prog', NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(14 AS Numeric(18, 0)), CAST(N'2020-12-13T16:19:42.487' AS DateTime), 1, N'President', N'John Raven Glomar', N'Age: 21
Skills: Prog', NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(14 AS Numeric(18, 0)), CAST(N'2020-12-13T16:20:45.967' AS DateTime), 1, N'President', N'John Raven Glomar', N'Skills: Prog
Age: 21', NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(14 AS Numeric(18, 0)), CAST(N'2020-12-13T16:21:35.430' AS DateTime), 1, N'President', N'John Raven Glomar', N'Skills: Prog', NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(24 AS Numeric(18, 0)), CAST(N'2020-12-13T17:26:17.410' AS DateTime), 1, N'President', N'John Raven Glomar', N's', NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(110 AS Numeric(18, 0)), CAST(N'2020-12-14T15:52:19.413' AS DateTime), 1, N'President', N'TEST', N'asd', NULL)
SET IDENTITY_INSERT [dbo].[t_candidate] OFF
GO
SET IDENTITY_INSERT [dbo].[t_contest] ON 

INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(1 AS Numeric(18, 0)), N'Pagalingan sumayaw', CAST(N'2020-12-17T00:00:00.000' AS DateTime), CAST(N'2020-12-30T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-28T14:54:17.430' AS DateTime), 1, N'asdasd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(2 AS Numeric(18, 0)), N'asd', CAST(N'2020-12-31T00:00:00.000' AS DateTime), CAST(N'2020-12-09T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-28T15:07:08.707' AS DateTime), 1, N'asdasd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(3 AS Numeric(18, 0)), N'asd', CAST(N'2020-12-31T00:00:00.000' AS DateTime), CAST(N'2020-12-09T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-28T15:07:36.920' AS DateTime), 1, N'asdasd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(4 AS Numeric(18, 0)), N'Test Contest 1', CAST(N'2020-11-28T00:00:00.000' AS DateTime), CAST(N'2020-12-03T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-28T21:29:55.320' AS DateTime), 1, N'This is test contest 1')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(5 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, CAST(N'2020-11-29T09:54:37.237' AS DateTime), 1, NULL)
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(6 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, CAST(N'2020-11-29T09:54:40.193' AS DateTime), 1, NULL)
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(7 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, CAST(N'2020-11-29T09:57:27.527' AS DateTime), 1, NULL)
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(8 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, CAST(N'2020-11-29T09:57:40.377' AS DateTime), 1, NULL)
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(9 AS Numeric(18, 0)), N'Test Contest2', CAST(N'2020-11-29T00:00:00.000' AS DateTime), CAST(N'2020-11-30T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T12:15:11.183' AS DateTime), 1, N'Test contest2')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(10 AS Numeric(18, 0)), N'Test Contest3', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T12:16:11.130' AS DateTime), 1, N'Test contest3')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(11 AS Numeric(18, 0)), N'Test Contest4', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T12:19:01.300' AS DateTime), 1, N'Test Contest4')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(12 AS Numeric(18, 0)), N'Test Contest4', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T12:21:15.783' AS DateTime), 1, N'Test Contest 4')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(13 AS Numeric(18, 0)), N'Test Contest4', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T12:22:23.530' AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(14 AS Numeric(18, 0)), N'Test Contest4', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T12:22:50.010' AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(15 AS Numeric(18, 0)), N'Test Contest4', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T12:22:59.560' AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(16 AS Numeric(18, 0)), N'Test Contest4', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T12:22:59.560' AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(17 AS Numeric(18, 0)), N'Test Contest5', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T12:23:10.287' AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(18 AS Numeric(18, 0)), N'Test Contest6', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T12:23:27.060' AS DateTime), 1, N'asdascd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(19 AS Numeric(18, 0)), N'Test Contest7', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T12:23:50.993' AS DateTime), 1, N'asd7')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(20 AS Numeric(18, 0)), N'Test Contest9', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T12:24:27.717' AS DateTime), 1, N'asdc')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(21 AS Numeric(18, 0)), N'Test Contest10', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T12:25:51.907' AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(22 AS Numeric(18, 0)), N'Test Contest10', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T12:25:51.907' AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(23 AS Numeric(18, 0)), N'asd', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T12:28:38.457' AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(24 AS Numeric(18, 0)), N'asd11', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T12:29:44.747' AS DateTime), 1, N'asd11')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(25 AS Numeric(18, 0)), N'asd12', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T12:30:09.237' AS DateTime), 1, N'asd12')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(26 AS Numeric(18, 0)), N'asd12', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T12:30:10.877' AS DateTime), 1, N'asd12')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(27 AS Numeric(18, 0)), N'asd12', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T12:30:11.623' AS DateTime), 1, N'asd12')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(28 AS Numeric(18, 0)), N'asd12', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T12:30:21.050' AS DateTime), 1, N'asd12')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(29 AS Numeric(18, 0)), N'Test Contest4', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T12:32:51.810' AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(30 AS Numeric(18, 0)), N'asdasdas', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T12:33:34.073' AS DateTime), 1, N'asdasdasd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(31 AS Numeric(18, 0)), N'asd', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T12:37:48.537' AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(32 AS Numeric(18, 0)), N'asd', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T12:38:19.493' AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(33 AS Numeric(18, 0)), N'v123', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T12:39:33.890' AS DateTime), 1, N'v123')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(34 AS Numeric(18, 0)), N'v123', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T12:40:44.760' AS DateTime), 1, N'v123')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(35 AS Numeric(18, 0)), N'asd', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T12:44:51.383' AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(36 AS Numeric(18, 0)), N'asd', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T12:45:53.330' AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(37 AS Numeric(18, 0)), N'ba', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T12:46:04.117' AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(38 AS Numeric(18, 0)), N'test 123', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T12:47:42.960' AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(39 AS Numeric(18, 0)), N'test 123', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T12:47:42.960' AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(40 AS Numeric(18, 0)), N'asd123v', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T12:48:57.770' AS DateTime), 1, N'asd123v')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(41 AS Numeric(18, 0)), N'test loading', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T12:49:13.867' AS DateTime), 1, N'test loading')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(42 AS Numeric(18, 0)), N'new contest', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T13:07:47.623' AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(43 AS Numeric(18, 0)), N'v2 new contest', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-29T13:10:25.263' AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(44 AS Numeric(18, 0)), N'Test Contest123', CAST(N'2020-11-30T00:00:00.000' AS DateTime), CAST(N'2020-12-02T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-30T15:23:31.200' AS DateTime), 1, N'asdv123')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(45 AS Numeric(18, 0)), N'Test', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-12-01T16:04:50.017' AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(46 AS Numeric(18, 0)), N'asd', CAST(N'2020-12-12T00:00:00.000' AS DateTime), CAST(N'2020-12-13T23:59:59.000' AS DateTime), NULL, CAST(N'2020-12-12T11:35:31.483' AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(47 AS Numeric(18, 0)), N'asd', CAST(N'2020-12-12T00:00:00.000' AS DateTime), CAST(N'2020-12-13T23:59:59.000' AS DateTime), NULL, CAST(N'2020-12-12T12:22:18.547' AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(48 AS Numeric(18, 0)), N' zxc', CAST(N'2020-12-12T00:00:00.000' AS DateTime), CAST(N'2020-12-15T23:59:59.000' AS DateTime), CAST(25 AS Numeric(18, 0)), CAST(N'2020-12-12T12:22:27.400' AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(49 AS Numeric(18, 0)), N'Test public', CAST(N'2020-12-13T00:00:00.000' AS DateTime), CAST(N'2020-12-14T23:59:59.000' AS DateTime), CAST(24 AS Numeric(18, 0)), CAST(N'2020-12-13T15:38:16.917' AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(50 AS Numeric(18, 0)), N'test', CAST(N'2020-12-14T00:00:00.000' AS DateTime), CAST(N'2020-12-15T23:59:59.000' AS DateTime), CAST(24 AS Numeric(18, 0)), CAST(N'2020-12-14T16:15:45.757' AS DateTime), 1, N'asd')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription]) VALUES (CAST(51 AS Numeric(18, 0)), N'asd', CAST(N'2020-12-14T00:00:00.000' AS DateTime), CAST(N'2020-12-15T23:59:59.000' AS DateTime), CAST(24 AS Numeric(18, 0)), CAST(N'2020-12-14T16:19:28.470' AS DateTime), 1, N'asd')
SET IDENTITY_INSERT [dbo].[t_contest] OFF
GO
SET IDENTITY_INSERT [dbo].[t_contestant] ON 

INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(1 AS Numeric(18, 0)), N'test', N'test', 1, NULL, NULL, NULL)
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(2 AS Numeric(18, 0)), N'test', N'asd', 1, NULL, NULL, NULL)
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(3 AS Numeric(18, 0)), N'asd', N'asd', 1, NULL, N'11942076_1674469006101558_3534662844221263438_o27.jpg', NULL)
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(4 AS Numeric(18, 0)), N'Test', N'asd', 1, NULL, N'11942076_1674469006101558_3534662844221263438_o28.jpg', NULL)
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(5 AS Numeric(18, 0)), N'asd', N'asd', 1, NULL, N'11942076_1674469006101558_3534662844221263438_o29.jpg', NULL)
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(6 AS Numeric(18, 0)), N'asd', N'asd', 1, CAST(51 AS Numeric(18, 0)), N'11942076_1674469006101558_3534662844221263438_o210.jpg', NULL)
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(7 AS Numeric(18, 0)), N'asd', N'asd', 1, CAST(51 AS Numeric(18, 0)), N'11942076_1674469006101558_3534662844221263438_o211.jpg', CAST(N'2020-12-14T16:25:28.640' AS DateTime))
SET IDENTITY_INSERT [dbo].[t_contestant] OFF
GO
SET IDENTITY_INSERT [dbo].[t_election] ON 

INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(1 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(2 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(3 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(4 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(5 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(6 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(7 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(8 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(9 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(10 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(11 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(12 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(14 AS Numeric(18, 0)), N'qwe', CAST(N'2020-11-25T00:00:00.000' AS DateTime), CAST(N'2020-11-26T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(15 AS Numeric(18, 0)), N'qweqwe', CAST(N'2020-11-25T00:00:00.000' AS DateTime), CAST(N'2020-11-26T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(16 AS Numeric(18, 0)), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(17 AS Numeric(18, 0)), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(18 AS Numeric(18, 0)), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(19 AS Numeric(18, 0)), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(20 AS Numeric(18, 0)), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(21 AS Numeric(18, 0)), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(22 AS Numeric(18, 0)), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(23 AS Numeric(18, 0)), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(24 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(25 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(26 AS Numeric(18, 0)), N'qwe123231', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(27 AS Numeric(18, 0)), N'123123123asd', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(28 AS Numeric(18, 0)), N'12313sd', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(29 AS Numeric(18, 0)), N'asdasdsad', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(30 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(31 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(32 AS Numeric(18, 0)), N'test26-01', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(33 AS Numeric(18, 0)), N'test26-02', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-26T10:26:34.030' AS DateTime), 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(34 AS Numeric(18, 0)), N'DOMT Election', CAST(N'2020-12-26T00:00:00.000' AS DateTime), CAST(N'2020-12-30T23:59:59.000' AS DateTime), CAST(26 AS Numeric(18, 0)), CAST(N'2020-11-26T11:20:23.860' AS DateTime), 1, N's')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(35 AS Numeric(18, 0)), N'test-26-042', CAST(N'2020-12-26T00:00:00.000' AS DateTime), CAST(N'2020-12-30T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-26T11:20:32.633' AS DateTime), 0, N'')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(36 AS Numeric(18, 0)), N'qwe', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-26T11:25:10.340' AS DateTime), 0, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(37 AS Numeric(18, 0)), N'qwesd', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-26T11:25:51.993' AS DateTime), 0, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(38 AS Numeric(18, 0)), N'qwesd', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-26T11:25:55.157' AS DateTime), 0, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(39 AS Numeric(18, 0)), N'qwe', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-26T11:26:38.680' AS DateTime), 0, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(40 AS Numeric(18, 0)), N'qwec', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-26T11:27:57.980' AS DateTime), 0, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(41 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, CAST(N'2020-11-28T14:10:27.817' AS DateTime), 0, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(42 AS Numeric(18, 0)), N'SSC Election', CAST(N'2020-11-28T00:00:00.000' AS DateTime), CAST(N'2020-11-30T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-28T14:35:56.287' AS DateTime), 1, N'This is for ssc election
Vote Wisely')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(43 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, CAST(N'2020-11-28T14:36:00.277' AS DateTime), 0, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(44 AS Numeric(18, 0)), N'SSC Election', CAST(N'2020-11-28T00:00:00.000' AS DateTime), CAST(N'2020-11-30T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-28T14:36:11.290' AS DateTime), 1, N'This is for ssc election
Vote Wisely')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(45 AS Numeric(18, 0)), N'PSC Election', CAST(N'2020-11-28T00:00:00.000' AS DateTime), CAST(N'2020-11-30T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-28T14:36:26.270' AS DateTime), 1, N'This is for ssc election
Vote Wisely')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(46 AS Numeric(18, 0)), N'COMMITS Election', CAST(N'2020-11-28T00:00:00.000' AS DateTime), CAST(N'2020-12-11T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-28T14:37:58.993' AS DateTime), 1, N'This is COMMITS Election')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(47 AS Numeric(18, 0)), N'SSC Election', CAST(N'2020-11-28T00:00:00.000' AS DateTime), CAST(N'2020-12-08T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-28T16:11:16.403' AS DateTime), 1, N'This is for SSC Election
Please vote wisely')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(48 AS Numeric(18, 0)), N'PSC Election', CAST(N'2020-11-30T00:00:00.000' AS DateTime), CAST(N'2020-12-02T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-30T23:43:39.960' AS DateTime), 1, N'qews')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(49 AS Numeric(18, 0)), N'JMS Electionqwe', CAST(N'2020-12-01T00:00:00.000' AS DateTime), CAST(N'2020-12-06T00:00:00.000' AS DateTime), NULL, CAST(N'2020-12-01T00:23:14.130' AS DateTime), 0, N'This is jms election')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(50 AS Numeric(18, 0)), N'SSC Election', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-12-03T09:38:09.890' AS DateTime), 0, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(51 AS Numeric(18, 0)), N'test123', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-12-03T09:39:28.377' AS DateTime), 0, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(52 AS Numeric(18, 0)), N'asd', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-12-03T09:41:09.110' AS DateTime), 0, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(53 AS Numeric(18, 0)), N'asd', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-12-03T09:41:51.603' AS DateTime), 0, N'asdv')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(54 AS Numeric(18, 0)), N'dasd', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-12-03T09:42:26.910' AS DateTime), 0, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(55 AS Numeric(18, 0)), N'asd', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-12-03T09:42:53.353' AS DateTime), 0, N'savd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(56 AS Numeric(18, 0)), N'avsd', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-12-03T09:43:04.870' AS DateTime), 0, N'avsd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(57 AS Numeric(18, 0)), N'asvd', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-12-03T09:43:15.357' AS DateTime), 0, N'avsd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(58 AS Numeric(18, 0)), N'avsd', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-12-03T09:44:42.847' AS DateTime), 0, N'asvd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(59 AS Numeric(18, 0)), N'asd', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-12-03T09:45:00.143' AS DateTime), 0, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(60 AS Numeric(18, 0)), N'asd', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-12-03T09:45:17.513' AS DateTime), 0, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(61 AS Numeric(18, 0)), N'asdasd', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-12-03T09:45:20.627' AS DateTime), 0, N'asdasd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(62 AS Numeric(18, 0)), N'asd', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-12-03T09:46:35.117' AS DateTime), 0, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(63 AS Numeric(18, 0)), N'asdv', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-12-03T09:49:09.337' AS DateTime), 0, N'asvd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(64 AS Numeric(18, 0)), N'123', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-12-03T09:49:25.430' AS DateTime), 0, N'123')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(65 AS Numeric(18, 0)), N'Test', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-12-03T13:10:34.650' AS DateTime), 0, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(66 AS Numeric(18, 0)), N'asd', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-12-03T13:21:14.743' AS DateTime), 0, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(67 AS Numeric(18, 0)), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-12-03T13:40:03.093' AS DateTime), 0, N'')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(68 AS Numeric(18, 0)), N'asd', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-12-03T13:40:12.710' AS DateTime), 0, N'vs')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(69 AS Numeric(18, 0)), N'asd', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2020-12-03T13:40:44.497' AS DateTime), 0, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(70 AS Numeric(18, 0)), N'', CAST(N'2020-12-08T00:00:00.000' AS DateTime), CAST(N'2020-12-17T00:00:00.000' AS DateTime), NULL, CAST(N'2020-12-03T13:40:58.527' AS DateTime), 0, N'asdascd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(71 AS Numeric(18, 0)), N'SSC Election', CAST(N'2020-12-04T00:00:00.000' AS DateTime), CAST(N'2020-12-12T00:00:00.000' AS DateTime), NULL, CAST(N'2020-12-04T10:09:39.387' AS DateTime), 1, N'This election is for ssc election. Please vote wisely')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(72 AS Numeric(18, 0)), N'SSC Election', CAST(N'2020-12-04T00:00:00.000' AS DateTime), CAST(N'2020-12-12T00:00:00.000' AS DateTime), NULL, CAST(N'2020-12-04T10:09:58.630' AS DateTime), 1, N'ASD')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(73 AS Numeric(18, 0)), N'asd', CAST(N'2020-12-04T00:00:00.000' AS DateTime), CAST(N'2020-12-11T00:00:00.000' AS DateTime), NULL, CAST(N'2020-12-04T10:35:27.317' AS DateTime), 0, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(74 AS Numeric(18, 0)), N'', CAST(N'2020-12-04T00:00:00.000' AS DateTime), CAST(N'2020-12-24T00:00:00.000' AS DateTime), NULL, CAST(N'2020-12-04T10:41:00.550' AS DateTime), 0, N'')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(75 AS Numeric(18, 0)), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2020-11-30T00:00:00.000' AS DateTime), NULL, CAST(N'2020-12-04T10:41:07.637' AS DateTime), 1, N'')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(76 AS Numeric(18, 0)), N'asd', CAST(N'2020-12-04T00:00:00.000' AS DateTime), CAST(N'2020-12-04T00:00:00.000' AS DateTime), NULL, CAST(N'2020-12-04T11:38:50.830' AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(77 AS Numeric(18, 0)), N'asd', CAST(N'2020-12-04T00:00:00.000' AS DateTime), CAST(N'2020-12-05T23:59:59.000' AS DateTime), NULL, CAST(N'2020-12-04T11:41:53.817' AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(80 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, CAST(N'2020-12-04T11:46:36.487' AS DateTime), 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(81 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, CAST(N'2020-12-04T11:46:42.277' AS DateTime), 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(84 AS Numeric(18, 0)), N'asd', CAST(N'2020-12-04T00:00:00.000' AS DateTime), CAST(N'2020-12-05T00:00:00.000' AS DateTime), NULL, CAST(N'2020-12-04T12:57:13.153' AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(85 AS Numeric(18, 0)), N'asda', CAST(N'2020-12-04T00:00:00.000' AS DateTime), CAST(N'2020-12-05T00:00:00.000' AS DateTime), NULL, CAST(N'2020-12-04T12:58:02.607' AS DateTime), 1, N'asdasd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(86 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, CAST(N'2020-12-04T12:58:05.840' AS DateTime), 1, NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(87 AS Numeric(18, 0)), N'BBTE Election', CAST(N'2020-12-04T00:00:00.000' AS DateTime), CAST(N'2020-12-12T23:59:59.000' AS DateTime), NULL, CAST(N'2020-12-04T12:58:27.047' AS DateTime), 1, N'asdasd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(88 AS Numeric(18, 0)), N'Test', CAST(N'2020-12-04T00:00:00.000' AS DateTime), CAST(N'2020-12-04T23:59:59.000' AS DateTime), NULL, CAST(N'2020-12-04T13:06:15.953' AS DateTime), 1, N'qwe')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(89 AS Numeric(18, 0)), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1970-01-02T00:59:59.000' AS DateTime), NULL, CAST(N'2020-12-04T16:42:48.170' AS DateTime), 1, N'')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(90 AS Numeric(18, 0)), N'asd', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1970-01-02T00:59:59.000' AS DateTime), NULL, CAST(N'2020-12-04T16:43:01.080' AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(91 AS Numeric(18, 0)), N'asd', CAST(N'2020-12-04T00:00:00.000' AS DateTime), CAST(N'2020-12-05T23:59:59.000' AS DateTime), NULL, CAST(N'2020-12-04T16:43:08.370' AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(92 AS Numeric(18, 0)), N'asd', CAST(N'2020-12-04T00:00:00.000' AS DateTime), CAST(N'2020-12-04T23:59:59.000' AS DateTime), NULL, CAST(N'2020-12-04T16:48:12.217' AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(93 AS Numeric(18, 0)), N'asdas213', CAST(N'2020-12-04T00:00:00.000' AS DateTime), CAST(N'2020-12-05T23:59:59.000' AS DateTime), NULL, CAST(N'2020-12-04T16:48:28.420' AS DateTime), 1, N'asdasdsad')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(94 AS Numeric(18, 0)), N'asdtest', CAST(N'2020-12-02T00:00:00.000' AS DateTime), CAST(N'2020-12-03T23:59:59.000' AS DateTime), NULL, CAST(N'2020-12-04T16:49:11.550' AS DateTime), 1, N'asdtest')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(95 AS Numeric(18, 0)), N'qcwe', CAST(N'2020-12-04T00:00:00.000' AS DateTime), CAST(N'2020-12-05T23:59:59.000' AS DateTime), NULL, CAST(N'2020-12-04T17:09:48.687' AS DateTime), 1, N'cqwe')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(96 AS Numeric(18, 0)), N'asd', CAST(N'2020-12-12T00:00:00.000' AS DateTime), CAST(N'2020-12-14T23:59:59.000' AS DateTime), CAST(30 AS Numeric(18, 0)), CAST(N'2020-12-12T11:35:21.083' AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(97 AS Numeric(18, 0)), N'sad', CAST(N'2020-12-13T00:00:00.000' AS DateTime), CAST(N'2020-12-18T23:59:59.000' AS DateTime), CAST(30 AS Numeric(18, 0)), CAST(N'2020-12-12T11:42:57.953' AS DateTime), 1, N'dasd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(98 AS Numeric(18, 0)), N'asd', CAST(N'2020-12-13T00:00:00.000' AS DateTime), CAST(N'2020-12-14T23:59:59.000' AS DateTime), CAST(27 AS Numeric(18, 0)), CAST(N'2020-12-12T11:43:51.333' AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(99 AS Numeric(18, 0)), N'asd', CAST(N'2020-12-12T00:00:00.000' AS DateTime), CAST(N'2020-12-13T23:59:59.000' AS DateTime), NULL, CAST(N'2020-12-12T12:08:45.313' AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(100 AS Numeric(18, 0)), N'asd', CAST(N'2020-12-12T00:00:00.000' AS DateTime), CAST(N'2020-12-13T23:59:59.000' AS DateTime), NULL, CAST(N'2020-12-12T12:17:00.147' AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(101 AS Numeric(18, 0)), N'asd', CAST(N'2020-12-13T00:00:00.000' AS DateTime), CAST(N'2020-12-14T23:59:59.000' AS DateTime), CAST(28 AS Numeric(18, 0)), CAST(N'2020-12-12T12:36:01.013' AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(102 AS Numeric(18, 0)), N'Test', CAST(N'2020-12-13T00:00:00.000' AS DateTime), CAST(N'2020-12-14T23:59:59.000' AS DateTime), CAST(14 AS Numeric(18, 0)), CAST(N'2020-12-13T15:31:03.327' AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(103 AS Numeric(18, 0)), N'Test Election', CAST(N'2020-12-13T00:00:00.000' AS DateTime), CAST(N'2020-12-17T23:59:59.000' AS DateTime), CAST(26 AS Numeric(18, 0)), CAST(N'2020-12-13T16:31:27.517' AS DateTime), 1, N'Please vote wisely')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(104 AS Numeric(18, 0)), N'Test Election', CAST(N'2020-12-13T00:00:00.000' AS DateTime), CAST(N'2020-12-14T23:59:59.000' AS DateTime), CAST(24 AS Numeric(18, 0)), CAST(N'2020-12-13T16:31:48.820' AS DateTime), 1, N'')
GO
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(105 AS Numeric(18, 0)), N'asd', CAST(N'2020-12-13T00:00:00.000' AS DateTime), CAST(N'2020-12-14T23:59:59.000' AS DateTime), CAST(24 AS Numeric(18, 0)), CAST(N'2020-12-13T16:32:44.200' AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(106 AS Numeric(18, 0)), N'zxc', CAST(N'2020-12-13T00:00:00.000' AS DateTime), CAST(N'2020-12-14T23:59:59.000' AS DateTime), CAST(24 AS Numeric(18, 0)), CAST(N'2020-12-13T16:34:57.483' AS DateTime), 1, N'zxc')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(107 AS Numeric(18, 0)), N'asd2', CAST(N'2020-12-13T00:00:00.000' AS DateTime), CAST(N'2020-12-14T23:59:59.000' AS DateTime), CAST(24 AS Numeric(18, 0)), CAST(N'2020-12-13T16:37:12.663' AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(108 AS Numeric(18, 0)), N'asd', CAST(N'2020-12-13T00:00:00.000' AS DateTime), CAST(N'2020-12-14T23:59:59.000' AS DateTime), CAST(26 AS Numeric(18, 0)), CAST(N'2020-12-13T16:37:47.567' AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(109 AS Numeric(18, 0)), N'asdxzc', CAST(N'2020-12-13T00:00:00.000' AS DateTime), CAST(N'2020-12-14T23:59:59.000' AS DateTime), CAST(28 AS Numeric(18, 0)), CAST(N'2020-12-13T16:37:55.977' AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(110 AS Numeric(18, 0)), N'This is election name', CAST(N'2020-12-13T00:00:00.000' AS DateTime), CAST(N'2020-12-14T23:59:59.000' AS DateTime), CAST(25 AS Numeric(18, 0)), CAST(N'2020-12-13T16:43:34.323' AS DateTime), 1, N'This is decsription')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(111 AS Numeric(18, 0)), N'asd', CAST(N'2020-12-13T00:00:00.000' AS DateTime), CAST(N'2020-12-14T23:59:59.000' AS DateTime), CAST(25 AS Numeric(18, 0)), CAST(N'2020-12-13T16:47:24.867' AS DateTime), 1, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(112 AS Numeric(18, 0)), N'new', CAST(N'2020-12-13T00:00:00.000' AS DateTime), CAST(N'2020-12-14T23:59:59.000' AS DateTime), NULL, CAST(N'2020-12-13T16:47:34.950' AS DateTime), 0, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(113 AS Numeric(18, 0)), N'asd', CAST(N'2020-12-13T00:00:00.000' AS DateTime), CAST(N'2020-12-14T23:59:59.000' AS DateTime), NULL, CAST(N'2020-12-13T16:48:03.823' AS DateTime), 0, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(114 AS Numeric(18, 0)), N'new', CAST(N'2020-12-13T00:00:00.000' AS DateTime), CAST(N'2020-12-14T23:59:59.000' AS DateTime), NULL, CAST(N'2020-12-13T16:48:14.890' AS DateTime), 0, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(115 AS Numeric(18, 0)), N'new', CAST(N'2020-12-13T00:00:00.000' AS DateTime), CAST(N'2020-12-14T23:59:59.000' AS DateTime), NULL, CAST(N'2020-12-13T16:48:30.320' AS DateTime), 0, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(116 AS Numeric(18, 0)), N'asd', CAST(N'2020-12-13T00:00:00.000' AS DateTime), CAST(N'2020-12-14T23:59:59.000' AS DateTime), CAST(24 AS Numeric(18, 0)), CAST(N'2020-12-13T16:53:50.530' AS DateTime), 0, N'asd')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(117 AS Numeric(18, 0)), N'new test election name', CAST(N'2020-12-13T00:00:00.000' AS DateTime), CAST(N'2020-12-14T23:59:59.000' AS DateTime), CAST(24 AS Numeric(18, 0)), CAST(N'2020-12-13T16:55:54.403' AS DateTime), 0, N'description')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription]) VALUES (CAST(118 AS Numeric(18, 0)), N'New Election123', CAST(N'2020-12-13T00:00:00.000' AS DateTime), CAST(N'2020-12-14T23:59:59.000' AS DateTime), CAST(24 AS Numeric(18, 0)), CAST(N'2020-12-13T17:04:20.887' AS DateTime), 0, N'asd')
SET IDENTITY_INSERT [dbo].[t_election] OFF
GO
SET IDENTITY_INSERT [dbo].[t_option] ON 

INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)), N'asd', CAST(N'2020-12-14T16:37:26.863' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[t_option] OFF
GO
SET IDENTITY_INSERT [dbo].[t_poll] ON 

INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription]) VALUES (CAST(1 AS Numeric(18, 0)), N'This is poll voting', CAST(N'2020-11-28T00:00:00.000' AS DateTime), CAST(N'2020-12-02T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-28T14:43:26.170' AS DateTime), 1, N'asd')
INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription]) VALUES (CAST(2 AS Numeric(18, 0)), N'This is poll voting v2', CAST(N'2020-11-28T00:00:00.000' AS DateTime), CAST(N'2020-12-10T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-28T14:44:21.070' AS DateTime), 1, N'Rqwqwe')
INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription]) VALUES (CAST(3 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, CAST(N'2020-11-28T14:44:40.603' AS DateTime), 1, NULL)
INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription]) VALUES (CAST(4 AS Numeric(18, 0)), N'This is poll voting v3', CAST(N'2020-11-28T00:00:00.000' AS DateTime), CAST(N'2020-11-30T00:00:00.000' AS DateTime), NULL, CAST(N'2020-11-28T14:45:21.190' AS DateTime), 1, N'qweqwe')
INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription]) VALUES (CAST(5 AS Numeric(18, 0)), N' sad', CAST(N'2020-12-12T00:00:00.000' AS DateTime), CAST(N'2020-12-15T23:59:59.000' AS DateTime), CAST(24 AS Numeric(18, 0)), CAST(N'2020-12-12T11:35:45.107' AS DateTime), 1, N'sad')
INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription]) VALUES (CAST(6 AS Numeric(18, 0)), N'Test private', CAST(N'2020-12-13T00:00:00.000' AS DateTime), CAST(N'2020-12-14T23:59:59.000' AS DateTime), CAST(25 AS Numeric(18, 0)), CAST(N'2020-12-13T15:38:27.480' AS DateTime), 1, N'asd')
INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription]) VALUES (CAST(7 AS Numeric(18, 0)), N'asd', CAST(N'2020-12-13T00:00:00.000' AS DateTime), CAST(N'2020-12-14T23:59:59.000' AS DateTime), CAST(31 AS Numeric(18, 0)), CAST(N'2020-12-13T15:38:32.930' AS DateTime), 1, N'asd')
SET IDENTITY_INSERT [dbo].[t_poll] OFF
GO
SET IDENTITY_INSERT [dbo].[t_user] ON 

INSERT [dbo].[t_user] ([id], [userFirstName], [userMiddleName], [userLastName], [userStudentNo], [userPassword], [userEmail], [userType], [userOrg], [userCourse], [userDateCreated], [userStatus]) VALUES (CAST(1 AS Numeric(18, 0)), N'jet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[t_user] OFF
GO
ALTER TABLE [dbo].[r_course] ADD  CONSTRAINT [DF_Course]  DEFAULT (getdate()) FOR [courseDateCreated]
GO
ALTER TABLE [dbo].[r_course] ADD  DEFAULT ((1)) FOR [courseStatus]
GO
ALTER TABLE [dbo].[r_org] ADD  CONSTRAINT [DF_Org]  DEFAULT (getdate()) FOR [orgDateCreated]
GO
ALTER TABLE [dbo].[r_org] ADD  DEFAULT ((1)) FOR [orgStatus]
GO
ALTER TABLE [dbo].[t_candidate] ADD  CONSTRAINT [DF_Candidate]  DEFAULT (getdate()) FOR [candidateDateCreated]
GO
ALTER TABLE [dbo].[t_candidate] ADD  DEFAULT ((1)) FOR [candidateStatus]
GO
ALTER TABLE [dbo].[t_contest] ADD  CONSTRAINT [DF_Contest]  DEFAULT (getdate()) FOR [contestDateCreated]
GO
ALTER TABLE [dbo].[t_contest] ADD  DEFAULT ((1)) FOR [contestStatus]
GO
ALTER TABLE [dbo].[t_contestant] ADD  DEFAULT ((1)) FOR [contestStatus]
GO
ALTER TABLE [dbo].[t_contestant] ADD  DEFAULT (getdate()) FOR [contestantDateCreated]
GO
ALTER TABLE [dbo].[t_election] ADD  CONSTRAINT [DF_Election]  DEFAULT (getdate()) FOR [electionDateCreated]
GO
ALTER TABLE [dbo].[t_election] ADD  DEFAULT ((1)) FOR [electionStatus]
GO
ALTER TABLE [dbo].[t_option] ADD  CONSTRAINT [DF_Option]  DEFAULT (getdate()) FOR [optionDateCreated]
GO
ALTER TABLE [dbo].[t_option] ADD  DEFAULT ((1)) FOR [optionStatus]
GO
ALTER TABLE [dbo].[t_poll] ADD  CONSTRAINT [DF_Poll]  DEFAULT (getdate()) FOR [pollDateCreated]
GO
ALTER TABLE [dbo].[t_poll] ADD  DEFAULT ((1)) FOR [pollStatus]
GO
ALTER TABLE [dbo].[t_user] ADD  CONSTRAINT [DF_User]  DEFAULT (getdate()) FOR [userDateCreated]
GO
ALTER TABLE [dbo].[t_user] ADD  DEFAULT ((1)) FOR [userStatus]
GO
ALTER TABLE [dbo].[t_vote_candidate] ADD  CONSTRAINT [DF_VoteCandidate]  DEFAULT (getdate()) FOR [voteDateCreated]
GO
ALTER TABLE [dbo].[t_vote_option] ADD  CONSTRAINT [DF_VoteOption]  DEFAULT (getdate()) FOR [voteDateCreated]
GO
ALTER TABLE [dbo].[t_candidate]  WITH CHECK ADD  CONSTRAINT [FK_candidate_electionID] FOREIGN KEY([candidateElectionID])
REFERENCES [dbo].[t_election] ([id])
GO
ALTER TABLE [dbo].[t_candidate] CHECK CONSTRAINT [FK_candidate_electionID]
GO
ALTER TABLE [dbo].[t_contest]  WITH CHECK ADD  CONSTRAINT [FK_contest_orgID] FOREIGN KEY([contestOrg])
REFERENCES [dbo].[r_org] ([id])
GO
ALTER TABLE [dbo].[t_contest] CHECK CONSTRAINT [FK_contest_orgID]
GO
ALTER TABLE [dbo].[t_contestant]  WITH CHECK ADD  CONSTRAINT [FK_contestant_contestID] FOREIGN KEY([contestantContestID])
REFERENCES [dbo].[t_contest] ([id])
GO
ALTER TABLE [dbo].[t_contestant] CHECK CONSTRAINT [FK_contestant_contestID]
GO
ALTER TABLE [dbo].[t_election]  WITH CHECK ADD  CONSTRAINT [FK_election_orgID] FOREIGN KEY([electionOrg])
REFERENCES [dbo].[r_org] ([id])
GO
ALTER TABLE [dbo].[t_election] CHECK CONSTRAINT [FK_election_orgID]
GO
ALTER TABLE [dbo].[t_option]  WITH CHECK ADD  CONSTRAINT [FK_option_electionID] FOREIGN KEY([optionPollID])
REFERENCES [dbo].[t_poll] ([id])
GO
ALTER TABLE [dbo].[t_option] CHECK CONSTRAINT [FK_option_electionID]
GO
ALTER TABLE [dbo].[t_poll]  WITH CHECK ADD  CONSTRAINT [FK_poll_orgID] FOREIGN KEY([pollOrg])
REFERENCES [dbo].[r_org] ([id])
GO
ALTER TABLE [dbo].[t_poll] CHECK CONSTRAINT [FK_poll_orgID]
GO
ALTER TABLE [dbo].[t_user]  WITH CHECK ADD  CONSTRAINT [FK_user_courseID] FOREIGN KEY([userCourse])
REFERENCES [dbo].[r_course] ([id])
GO
ALTER TABLE [dbo].[t_user] CHECK CONSTRAINT [FK_user_courseID]
GO
ALTER TABLE [dbo].[t_user]  WITH CHECK ADD  CONSTRAINT [FK_user_orgsID] FOREIGN KEY([userOrg])
REFERENCES [dbo].[r_org] ([id])
GO
ALTER TABLE [dbo].[t_user] CHECK CONSTRAINT [FK_user_orgsID]
GO
ALTER TABLE [dbo].[t_vote_candidate]  WITH CHECK ADD  CONSTRAINT [FK_vote_c_candidateID] FOREIGN KEY([vote_candidateID])
REFERENCES [dbo].[t_candidate] ([id])
GO
ALTER TABLE [dbo].[t_vote_candidate] CHECK CONSTRAINT [FK_vote_c_candidateID]
GO
ALTER TABLE [dbo].[t_vote_candidate]  WITH CHECK ADD  CONSTRAINT [FK_vote_c_electionID] FOREIGN KEY([vote_electionID])
REFERENCES [dbo].[t_election] ([id])
GO
ALTER TABLE [dbo].[t_vote_candidate] CHECK CONSTRAINT [FK_vote_c_electionID]
GO
ALTER TABLE [dbo].[t_vote_candidate]  WITH CHECK ADD  CONSTRAINT [FK_vote_c_userID] FOREIGN KEY([vote_userID])
REFERENCES [dbo].[t_user] ([id])
GO
ALTER TABLE [dbo].[t_vote_candidate] CHECK CONSTRAINT [FK_vote_c_userID]
GO
ALTER TABLE [dbo].[t_vote_contestant]  WITH CHECK ADD  CONSTRAINT [FK_vote_con_constestantID] FOREIGN KEY([vote_contestantID])
REFERENCES [dbo].[t_contestant] ([id])
GO
ALTER TABLE [dbo].[t_vote_contestant] CHECK CONSTRAINT [FK_vote_con_constestantID]
GO
ALTER TABLE [dbo].[t_vote_contestant]  WITH CHECK ADD  CONSTRAINT [FK_vote_con_contestID] FOREIGN KEY([vote_contestID])
REFERENCES [dbo].[t_contest] ([id])
GO
ALTER TABLE [dbo].[t_vote_contestant] CHECK CONSTRAINT [FK_vote_con_contestID]
GO
ALTER TABLE [dbo].[t_vote_contestant]  WITH CHECK ADD  CONSTRAINT [FK_vote_con_userID] FOREIGN KEY([vote_userID])
REFERENCES [dbo].[t_user] ([id])
GO
ALTER TABLE [dbo].[t_vote_contestant] CHECK CONSTRAINT [FK_vote_con_userID]
GO
ALTER TABLE [dbo].[t_vote_option]  WITH CHECK ADD  CONSTRAINT [FK_vote_o_candidateID] FOREIGN KEY([vote_optionID])
REFERENCES [dbo].[t_option] ([id])
GO
ALTER TABLE [dbo].[t_vote_option] CHECK CONSTRAINT [FK_vote_o_candidateID]
GO
ALTER TABLE [dbo].[t_vote_option]  WITH CHECK ADD  CONSTRAINT [FK_vote_o_electionID] FOREIGN KEY([vote_pollID])
REFERENCES [dbo].[t_poll] ([id])
GO
ALTER TABLE [dbo].[t_vote_option] CHECK CONSTRAINT [FK_vote_o_electionID]
GO
ALTER TABLE [dbo].[t_vote_option]  WITH CHECK ADD  CONSTRAINT [FK_vote_o_userID] FOREIGN KEY([vote_userID])
REFERENCES [dbo].[t_user] ([id])
GO
ALTER TABLE [dbo].[t_vote_option] CHECK CONSTRAINT [FK_vote_o_userID]
GO
USE [master]
GO
ALTER DATABASE [eboto] SET  READ_WRITE 
GO
